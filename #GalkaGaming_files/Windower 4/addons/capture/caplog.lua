
require('capture-lib')

caplog = caplog or {}
caplog.info = {
  name = 'CaptureLogger',
  log_name = 'CapLog',
  box_name = 'CL',
  version = '002',
  date = '2019/11/16',
  lib_version = '006',
  author = 'ibm2431',
  commands = {'caplog','cl'},
  key = 'caplog',
  folder = 'caplog/'
}

if not capture then
  _addon.name = caplog.info.name
  _addon.version = caplog.info.version
  _addon.date = caplog.info.date
  _addon.lib_version = caplog.info.lib_version
  _addon.author = caplog.info.author
  _addon.commands = caplog.info.commands
end

-- ------------------------------------------------------------------------------
-- DEFAULT USER SETTINGS
-- ------------------------------------------------------------------------------

caplog.defaults = T{}

caplog.defaults.mode = lib.mode.PASSIVE
caplog.defaults.file_path = 'data/caplog/'

caplog.defaults.log_say = true
caplog.defaults.log_shout = false
caplog.defaults.log_tell = false
caplog.defaults.log_party = true
caplog.defaults.log_linkshell = false
caplog.defaults.log_unity = false

caplog.defaults.block_say = false
caplog.defaults.block_shout = true
caplog.defaults.block_tell = true
caplog.defaults.block_party = false
caplog.defaults.block_linkshell = true
caplog.defaults.block_unity = true

caplog.defaults.show_box = false
caplog.defaults.timestamps = true

caplog.defaults.suppress_file_messages = true

caplog.defaults.box = T{}
caplog.defaults.box.pos   = T{}
caplog.defaults.box.pos.x = 465
caplog.defaults.box.pos.y = 540
caplog.defaults.box.text       = {}
caplog.defaults.box.text.size  = 11
caplog.defaults.box.text.font  = 'Consolas'
caplog.defaults.box.text.alpha = 255
caplog.defaults.box.text.red   = 255
caplog.defaults.box.text.green = 255
caplog.defaults.box.text.blue  = 255

caplog.defaults.box.bg = T{}
caplog.defaults.box.bg.red   = 30
caplog.defaults.box.bg.green = 30
caplog.defaults.box.bg.blue  = 60
caplog.defaults.box.bg.alpha = 230

caplog.defaults.color = T{}
caplog.defaults.color.tell      = 24 -- Red Lotus Blade
caplog.defaults.color.party     = 22 -- 34
caplog.defaults.color.linkshell = 12 -- 01234567 (Name)
caplog.defaults.color.system    = 19

---------------------------------------------------------------------------------
-- COMMANDS
---------------------------------------------------------------------------------
caplog.help_text = {
  ['show_box'] = "Toggles displaying number of blocked messages",
  ['timestamps'] = "Writes timestamps in the log file: OFF | ON",
  ['log'] = "Toggles file logging of: SAY | SHOUT | YELL | PARTY | LINKSHELL | UNITY",
  ['block'] = "Toggles blocking of: SAY | SHOUT | YELL | PARTY | LINKSHELL | UNITY",
  ['mode'] = "Sets mode: OFF | INFO | PASSIVE | ACTIVE",
  ['ver'] = "Shows addon (and library) version and date"
}

caplog.commands = {
  ['color_test'] = function()
    lib.colorTest(caplog)
  end,
  ['box_test'] = function ()
    lib.testBox(caplog)
  end,
  ['ver'] = function()
    lib.displayVer(caplog)
  end,
  ['log'] = function(args)
    local chat_modes = {
      say = true,
      shout = true,
      tell = true,
      party = true,
      linkshell = true,
      unity = true,
    }
    local chat_mode = chat_modes[args[2]]
    if chat_mode then
      lib.setToggle(caplog, 'log_'.. chat_mode, args[3])
    end
  end,
  ['block'] = function(args)
    local chat_modes = {
      say = true,
      shout = true,
      tell = true,
      party = true,
      linkshell = true,
      unity = true,
    }
    local chat_mode = chat_modes[args[2]]
    if chat_mode then
      lib.setToggle(caplog, 'show_'.. chat_mode, args[3])
    end
  end,
  ['capture'] = function(args)
    if args[1] then
      local toggle = string.lower(args[1])
      if toggle == 'start' then
        caplog.startCapture()
      elseif toggle == 'stop' then
        caplog.stopCapture()
      else
        lib.msg(caplog, "Usage: //caplog capture [start | stop]")
      end
    else
      lib.msg(caplog, "Usage: //caplog capture [start | stop]")
    end
  end,
  ['mode'] = function(args)
    lib.setMode(caplog, args[1])
  end,
  ['timestamps'] = function(args)
    lib.setToggle(caplog, 'timestamps', args[1])
  end,
  ['help'] = function()
    lib.displayHelp(caplog)
  end
}

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Handles writing an event to the info box
--------------------------------------------------
caplog.writeBox = function(info)
  box = texts.new(caplog.template.blocked, caplog.settings.box)
  
  box.tell = lib.padRight(info.name, 3)
  box.party = lib.padRight(info.name, 3)
  box.linkshell = lib.padRight(info.name, 3)
  
  return box
end

local chat_modes = {
  [1] = 'say',
  [2] = 'shout',
  [3] = 'shout',
  [12] = 'tell',
  [13] = 'party',
  [14] = 'linkshell',
  [212] = 'unity'
}

-- Parses an action and returns the appropriate IDs and strings based on its category
---------------------------------------------------------------------
caplog.checkMessage = function(original, modified, orig_mode, mod_mode, blocked)
  if (caplog.settings.mode > lib.mode.OFF) and (caplog.settings.mode ~= lib.mode.PASSIVE) then
    local chat_mode = chat_modes[orig_mode]
    local blocked = false
    local logged = true
    
    if chat_mode then
      if caplog.settings['block_'.. chat_mode] then
        blocked = (caplog.settings.mode == lib.mode.INFO) or (caplog.settings.mode >= lib.mode.ACTIVE)
      elseif not caplog.settings['log_'.. chat_mode] then
        logged = caplog.settings.mode >= lib.mode.INFO
      end
    end

    if blocked then
      return '', orig_mode, true
    elseif logged then
      caplog.logMessage(original)
    end
  end
end

-- Logs the result of a parsed action into various internal tables and files
---------------------------------------------------------------------
caplog.logMessage = function(message)
  if caplog.settings.mode >= lib.mode.PASSIVE then
    local timestamp = ''
    if caplog.settings.timestamps then
      timestamp = os.date(('[%H:%M:%S] ':gsub('%${([%l%d_]+)}', {})))
    end
    
    local to_log = timestamp .. message:strip_format()
    
    if to_log ~= caplog.vars.last_line then
      caplog.vars.last_line = to_log
      if caplog.settings.mode == lib.mode.CAPTURE then
        lib.fileAppend(caplog.file.capture, timestamp .. message:strip_format() .. '\n')
      end
      lib.fileAppend(caplog.file.log, timestamp .. message:strip_format() .. '\n')
    end
  end
end

-- Starts logging to a new log file
---------------------------------------------------------------------
caplog.startCapture = function()
  local date = os.date('*t')
  local filename = '%s_%.4u.%.2u.%.2u.txt':format(caplog.vars.my_name, date.year, date.month, date.day)
  
  caplog.file.capture = lib.fileOpen(caplog.vars.capture_root.. filename)
end

-- Stops logging to a capture file
---------------------------------------------------------------------
caplog.stopCapture = function()
  local timestamp = ''
  if caplog.settings.timestamps then
    timestamp = os.date(('[%H:%M:%S] ':gsub('%${([%l%d_]+)}', {})))
  end
  if caplog.settings.mode == lib.mode.CAPTURE then
    lib.fileAppend(caplog.file.capture, timestamp .. 'Capture stopped.' .. '\n')
  end
end

-- Checks for a valid command and executes it
--------------------------------------------------
caplog.command = function(cmd, ...)
  lib.command(caplog, cmd, ...)
end

---------------------------------------------------------------------------------
-- INITIALIZE
---------------------------------------------------------------------------------
caplog.initialize = function()
  ---------------------------------------------------------------------------------
  -- DISPLAY COLORS AND LOG HEADERS
  ---------------------------------------------------------------------------------

  caplog.color = {}
  caplog.color.log = { -- Preformatted character codes for log colors.
    LINKSHELL = lib.color[caplog.settings.color.linkshell][1],
    PARTY     = lib.color[caplog.settings.color.party][1],
    SYSTEM    = lib.color[caplog.settings.color.system][1],
    TELL      = lib.color[caplog.settings.color.tell][1],
  }
  caplog.color.box = { -- \\cs(#,#,#) values for Windower text boxes
    LINKSHELL = lib.color[caplog.settings.color.linkshell][2],
    PARTY     = lib.color[caplog.settings.color.party][2],
    SYSTEM    = lib.color[caplog.settings.color.system][2],
    TELL      = lib.color[caplog.settings.color.tell][2],
  }
  ---------------------------------------------------------------------------------
  -- VARIABLES AND TEMPLATES
  ---------------------------------------------------------------------------------

  caplog.template = {
    blocked = 
              caplog.color.box.SYSTEM ..'[CL] '..
              caplog.color.box.SYSTEM .. 'T: '.. caplog.color.box.LINKSHELL ..'%s'..
              caplog.color.box.SYSTEM .. 'P: '.. caplog.color.box.LINKSHELL ..'%s'..
              caplog.color.box.SYSTEM .. 'L: '.. caplog.color.box.LINKSHELL ..'%s'
  }

  caplog.vars = {}
  caplog.vars.my_name = windower.ffxi.get_player().name
  caplog.vars.previous_mode = caplog.settings.mode
  
  caplog.vars.last_line = ''

  caplog.file = T{}
  caplog.file.log = lib.fileOpen(caplog.settings.file_path.. caplog.vars.my_name ..'.txt')

  lib.checkLibVer(caplog)
  windower.register_event("incoming text", caplog.checkMessage)
  
  if caplog.settings.suppress_file_messages then
    notice = function(...)
      local args = T{...}
      if string.find(args[1], 'New file: ') then
        return
      else
        captionlog('Notice', logger.settings.noticecolor, ...)
      end
    end
  end
  
  if not capture then
    windower.register_event('addon command', caplog.command)
    windower.register_event('unload', function ()
      if caplog.settings.mode == lib.mode.CAPTURE then
        caplog.settings.mode = caplog.vars.previous_mode
      end
    end)
  end
end

if not capture then
  caplog.settings = config.load(caplog.defaults)
  caplog.initialize()
else
  return caplog
end


