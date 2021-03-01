require('capture-lib')

capture = capture or {}
capture.info = {
  name = 'Capture',
  log_name = 'Capture',
  box_name = 'Capture',
  version = '003',
  date = '2021/01/21',
  lib_version = '006',
  author = 'ibm2431',
  commands = {'capture'},
  folder = 'captures'
}

_addon.name = capture.info.name
_addon.version = capture.info.version
_addon.date = capture.info.date
_addon.lib_version = capture.info.lib_version
_addon.author = capture.info.author
_addon.commands = capture.info.commands

capture.plugin = {
  pv = require('packetviewer'),
  npcl = require('npclogger'),
  actionview = require('actionview'),
  eventview = require('eventview'),
  caplog = require('caplog'),
  hptrack = require('hptrack'),
  info = require('info'),
  gardenlog = require('gardenlog'),
  -- spawnwatch = require('spawnwatch'),
}

capture.plugin_alias = {
  pv = 'pv',
  npcl = 'npcl',
  npclogger = 'npcl',
  actionview = 'actionview',
  aview = 'actionview',
  eventview = 'eventview',
  eview = 'eventview',
  idview = 'eventview',
  caplog = 'caplog',
  log = 'caplog',
  cl = 'caplog',
  capturelog = 'caplog',
  hptrack = 'hptrack',
  hpt = 'hptrack',
  info = 'info',
  gardenlog ='gardenlog',
  gl = 'gardenlog',
  -- spawnwatch = 'spawnwatch',
  -- sw = 'spawnwatch'
}

-- ------------------------------------------------------------------------------
-- DEFAULT USER SETTINGS
-- ------------------------------------------------------------------------------

capture.defaults = {}
capture.defaults.capture_root = 'captures/'

for name, plugin in pairs(capture.plugin) do
  capture.defaults[name] = plugin.defaults
end

capture.defaults.color = T{}
capture.defaults.color.system    = 19

capture.settings = config.load(capture.defaults)


for name, plugin in pairs(capture.plugin) do
  plugin.settings = capture.settings[name]
end

---------------------------------------------------------------------------------
-- INITIALIZE
---------------------------------------------------------------------------------
capture.my_name = windower.ffxi.get_player().name
capture.color = {}
capture.color.log = { -- Preformatted character codes for log colors.
  SYSTEM       = lib.color[capture.settings.color.system][1],
}
capture.color.box = { -- \\cs(#,#,#) values for Windower text boxes
  SYSTEM       = lib.color[capture.settings.color.system][2],
}

local has_prerenders = false
capture.prerenders = {}
for name, plugin in pairs(capture.plugin) do
  plugin.initialize()
  if plugin.preRender then
    capture.prerenders[name] = plugin.preRender
    has_prerenders = true
  end
end

if has_prerenders then
  capture.frame = 0
  windower.register_event('prerender', function()
    if capture.frame % 5 == 0 then
      for name, prerender in pairs(capture.prerenders) do
        prerender()
      end
      capture.frame = 0
    end
    capture.frame = capture.frame + 1
  end)
  capture.frame = 0
end

windower.register_event('addon command',function (command, ...)
	command = command and command:lower()
	if command == 'start' then
    capture.startCapture()
  elseif command == 'stop' then
    capture.stopCapture()
	else
    local alias = capture.plugin_alias[command]
    if alias then
      capture.plugin[alias].command(...)
    else
      warning('Unknown plugin: \''..command..'\'. Ignored.')
    end
	end
end)

windower.register_event('unhandled command',function (command, ...)
	command = command and command:lower()
  for alias, full_name in pairs(capture.plugin_alias) do
    if command == alias then
      capture.plugin[full_name].command(...)
    end
  end
end)

-- Starts a capture
---------------------------------------------------------------------
capture.startCapture = function()
  if not (capture.mode == lib.mode.CAPTURE) then
    local date = os.date('*t')
    file_root = capture.settings.capture_root.. '%.4u-%.2u-%.2u_%.2u-%.2u/%s/'
    file_root = file_root:format(date.year, date.month, date.day, date.hour, date.min, capture.my_name)
    
    local started_plugins = 0
    local started_line = ''
    for name, plugin in pairs(capture.plugin) do
      local plugin_path = file_root.. plugin.info.folder
      lib.startCapture(plugin, plugin_path)
      started_line = started_line .. '('.. plugin.info.log_name .. ' v'.. plugin.info.version .. ') '
      started_plugins = started_plugins + 1
      if started_plugins == 3 then
        lib.msg(capture, started_line)
        started_line = ''
        started_plugins = 0
      end
    end
    if started_line ~= '' then
      lib.msg(capture, started_line)
    end
    
    coroutine.schedule(function()
      lib.msg(capture.plugin.pv, "Logging started: //capture pv l file both")
      windower.send_command("input //capture pv l file both")
      windower.send_command("input //capture npcl always_widescan on")
    end, 1)
    
    coroutine.schedule(function()
      lib.msg(capture, 'Capture started!')
    end, 1.2)
    
    capture.mode = lib.mode.CAPTURE
  else
    lib.msg(capture, 'Capture already in progress!')
  end
end

-- Stops a capture
---------------------------------------------------------------------
capture.stopCapture = function()
  if capture.mode == lib.mode.CAPTURE then
    for name, plugin in pairs(capture.plugin) do
      lib.stopCapture(plugin, true)
    end

    coroutine.schedule(function()
      lib.msg(capture, 'Capture stopped')
    end, 0.5)
    
    capture.mode = lib.mode.ACTIVE
  else
    lib.msg(capture, 'Capture hasn\'t started yet!')
  end
end

windower.register_event('load',function (command, ...)
	windower.send_command('bind ^c capture start')
  windower.send_command('bind ^v capture stop')
end)

windower.register_event('unload',function (command, ...)
  if capture.settings.mode == lib.mode.CAPTURE then
    capture.stopCapture()
  end
  for name, plugin in pairs(capture.plugin) do
    if plugin.unload then
      plugin.unload()
    end
  end
    
	windower.send_command('unbind ^c')
  windower.send_command('unbind ^v')
end)