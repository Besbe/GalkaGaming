
require('capture-lib')

info = info or {}
info.info = {
  name = 'Info',
  log_name = 'Info',
  box_name = 'Info',
  version = '004',
  date = '2020/04/01',
  lib_version = '006',
  author = 'ibm2431',
  commands = {'info'},
  key = 'info',
  folder = 'info/'
}

if not capture then
  _addon.name = info.info.name
  _addon.version = info.info.version
  _addon.date = info.info.date
  _addon.lib_version = info.info.lib_version
  _addon.author = info.info.author
  _addon.commands = info.info.commands
end

-- ------------------------------------------------------------------------------
-- DEFAULT USER SETTINGS
-- ------------------------------------------------------------------------------

info.defaults = T{}

info.defaults.mode = lib.mode.ACTIVE
info.defaults.file_path = 'data/info/'

info.defaults.show_char   = true -- shows the character info box
info.defaults.show_target = true -- shows the target info box
info.defaults.show_world  = true -- shows the world info box
info.defaults.show_job    = true -- shows current job information
info.defaults.show_zone   = true -- shows current zone information
info.defaults.show_moon   = true -- shows moon information

info.defaults.char_box = T{}
info.defaults.char_box.pos   = T{}
info.defaults.char_box.pos.x = windower.get_windower_settings().x_res*1/3
info.defaults.char_box.pos.y = 0
info.defaults.char_box.text       = {}
info.defaults.char_box.text.size  = 10
info.defaults.char_box.text.font  = 'Consolas'
info.defaults.char_box.text.alpha = 255
info.defaults.char_box.text.red   = 255
info.defaults.char_box.text.green = 255
info.defaults.char_box.text.blue  = 255

info.defaults.char_box.bg = T{}
info.defaults.char_box.bg.red   = 30
info.defaults.char_box.bg.green = 30
info.defaults.char_box.bg.blue  = 60
info.defaults.char_box.bg.alpha = 230

info.defaults.target_box = T{}
info.defaults.target_box.style = 'horizontal'
info.defaults.target_box.auto_hide = false
info.defaults.target_box.pos   = T{}
info.defaults.target_box.pos.x = windower.get_windower_settings().x_res - 120
info.defaults.target_box.pos.y = windower.get_windower_settings().y_res * 1/2
info.defaults.target_box.padding = 2
info.defaults.target_box.text       = {}
info.defaults.target_box.text.size  = 10
info.defaults.target_box.text.font  = 'Consolas'
info.defaults.target_box.text.alpha = 255
info.defaults.target_box.text.red   = 255
info.defaults.target_box.text.green = 255
info.defaults.target_box.text.blue  = 255

info.defaults.target_box.bg = T{}
info.defaults.target_box.bg.red   = 30
info.defaults.target_box.bg.green = 30
info.defaults.target_box.bg.blue  = 60
info.defaults.target_box.bg.alpha = 230

info.defaults.world_box = T{}
info.defaults.world_box.pos   = T{}
info.defaults.world_box.pos.x = 20
info.defaults.world_box.pos.y = windower.get_windower_settings().y_res-17
info.defaults.world_box.text       = {}
info.defaults.world_box.text.size  = 10
info.defaults.world_box.text.font  = 'Consolas'
info.defaults.world_box.text.alpha = 255
info.defaults.world_box.text.red   = 255
info.defaults.world_box.text.green = 255
info.defaults.world_box.text.blue  = 255

info.defaults.world_box.bg = T{}
info.defaults.world_box.bg.red   = 30
info.defaults.world_box.bg.green = 30
info.defaults.world_box.bg.blue  = 60
info.defaults.world_box.bg.alpha = 230

info.defaults.color = T{}
info.defaults.color.system    = 19

info.settings = {}

---------------------------------------------------------------------------------
-- COMMANDS
---------------------------------------------------------------------------------
info.help_text = {
  ['color_test']   = "Displays the color codes used by the addon",
  ['character']    = "Toggles display of character info box",
  ['job']          = "Toggles display of character's job",
  ['mode']         = "Sets mode: OFF | INFO | PASSIVE | ACTIVE",
  ['moon']         = "Toggles display of moon information",
  ['target']       = "Toggles display of target info box",
  ['target_style'] = "Switches display style of target info box",
  ['ver']          = "Shows addon (and library) version and date",
  ['world']        = "Toggles display of world info box",
  ['zone']         = "Toggles display of zone information",
}

info.commands = {
  ['color_test'] = function()
    lib.colorTest(info)
  end,
  ['help'] = function()
    lib.displayHelp(info)
  end,
  ['character'] = function()
    lib.setToggle(info, 'show_char', args[1])
    if info.settings.show_char then
      info.vars.char.box:show()
    else
      info.vars.char.box:hide()
    end
  end,
  ['target'] = function(args)
    lib.setToggle(info, 'show_target', args[1])
    if info.settings.show_target then
      info.vars.target.box:show()
    else
      info.vars.target.box:hide()
    end
  end,
  ['target_style'] = function(args)
    if info.settings.target_box.style == "horizontal" then
      info.settings.target_box.style = "vertical"
    else
      info.settings.target_box.style = "horizontal"
    end
    info.buildTargetBox()
  end,
  ['world'] = function(args)
    lib.setToggle(info, 'show_world', args[1])
    if info.settings.show_world then
      info.vars.world.box:show()
    else
      info.vars.world.box:hide()
    end
  end,
  ['job'] = function(args)
    lib.setToggle(info, 'show_job', args[1])
    info.buildCharBox()
  end,
  ['zone'] = function(args)
    lib.setToggle(info, 'show_zone', args[1])
    info.buildCharBox()
  end,
  ['moon'] = function(args)
    lib.setToggle(info, 'show_moon', args[1])
    info.buildWorldBox()
  end,
  ['mode'] = function(args)
    lib.setMode(info, args[1])
    if (info.settings.mode == lib.mode.OFF) or (info.settings.mode == lib.mode.PASSIVE) then
      info.vars.char.box:hide()
      info.vars.target.box:hide()
      info.vars.world.box:hide()
    else
      if info.settings.show_char then
        info.vars.char.box:show()
      end
      if info.settings.show_target then
        info.vars.target.box:show()
      end
      if info.settings.show_world then
        info.vars.world.box:show()
      end
    end
  end,  
  ['ver'] = function()
    lib.displayVer(info)
  end,
}

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Checks for a valid command and executes it
--------------------------------------------------
info.command = function(cmd, ...)
  lib.command(info, cmd, ...)
end

-- Prints a message to the chatlog
--------------------------------------------------
info.display = function(message)
  windower.add_to_chat(info.settings.message_color, "[Info] ".. message)
end

-- Builds the character information box
--------------------------------------------------
info.buildCharBox = function()
  if info.vars.char then
    info.vars.char.box:hide()
    info.vars.char = nil
  end
  info.vars.char = {
    box = texts.new(),
    settings = info.settings.char_box
  }

  local box_text = 'X: ${cx|%s} Y: ${cy|%s} Z: ${cz|%s} R: ${cr|%s}'
  if info.settings.show_job then
    box_text = '(${job|%s}) ' .. box_text
  end
  if info.settings.show_zone then
    box_text = box_text .. ' Zone: ${zone|%s}'
  end

  info.vars.char.box = texts.new(box_text, info.vars.char.settings)
  info.vars.char.box.cx = '000.000'
  info.vars.char.box.cy = '000.000'
  info.vars.char.box.cz = '000.000'
  info.vars.char.box.cr = '000'
  info.vars.char.box.zone = info.vars.zone
  info.vars.char.box.job = info.vars.job
  
  if info.settings.show_char then
    info.vars.char.box:show()
  end
end

-- Builds the targe information box
--------------------------------------------------
info.buildTargetBox = function()
  if info.vars.target then
    info.vars.target.box:hide()
    info.vars.target = nil
  end
  
  local box_text = ''
  if info.settings.target_box.style == "horizontal" then
    box_text = 'ID: ${id|%s} Lv: ${lvl|%s} X: ${mx|%s} Y: ${my|%s} Z: ${mz|%s} R: ${mr|%s}'
  else
    box_text = 'ID: ${id|%s}\nLv: ${lvl|%s}\nX : ${mx|%s}\nY : ${my|%s}\nZ : ${mz|%s}\nR : ${mr|%s}'
  end

  info.vars.target = {
    box = texts.new(),
    settings = info.settings.target_box
  }

  info.vars.target.box = texts.new(box_text, info.vars.target.settings)
  info.vars.target.box.id  = ' -None- '
  info.vars.target.box.lvl = '  ?'
  info.vars.target.box.mx  = '  ?     '
  info.vars.target.box.my  = '  ?     '
  info.vars.target.box.mz  = '  ?     '
  info.vars.target.box.mr  = ' ?'
  
  if info.settings.show_target and (not info.settings.target_box.auto_hide) then
    info.vars.target.box:show()
  end
end

-- Builds the world information box
--------------------------------------------------
info.buildWorldBox = function()
  if info.vars.world then
    info.vars.world.box:hide()
    info.vars.world = nil
  end
  
  local box_text = ''
  if info.settings.show_moon then
    box_text = 'T: ${time|%s} C: ${capture_time|%s} M: ${moon|%s}'
  else
    box_text = 'T: ${time|%s} C: ${capture_time|%s}'
  end

  info.vars.world = {
    box = texts.new(),
    settings = info.settings.world_box
  }

  info.vars.world.box = texts.new(box_text, info.vars.world.settings)
  info.vars.world.box.time         = '0'
  info.vars.world.box.capture_time = '00:00:00 '
  info.vars.world.box.server       = '?'
  info.vars.world.box.moon         = '?'
  
  if info.settings.show_world then
    info.vars.world.box:show()
  end
end

-- Starts a capture
---------------------------------------------------------------------
info.startCapture = function()
  info.vars.capture_start = os.time()
  info.vars.world.box.capture_time = '00:00:00'
end

-- Stops a capture
---------------------------------------------------------------------
info.stopCapture = function()
  info.vars.world.box.capture_time = '00:00:00'
end

-- Sets up information for current zone
--------------------------------------------------
info.setupZone = function(zone, zone_left)
  info.vars.current_zone = zone
  info.vars.zone_name = res.zones[zone].en
  info.vars.zone = string.format('%03d', info.vars.current_zone) .. ' - '.. info.vars.zone_name
  info.vars.char.box.zone = info.vars.zone
end

-- Sets up information for current job
--------------------------------------------------
info.setupJob = function(main, mlvl, sub, slvl)
  if sub then
    sub = string.format('%02d', slvl) .. res.jobs[sub].ens
  else
    sub = "00NON"
  end
  info.vars.job = string.format('%02d', mlvl) .. res.jobs[main].ens .. '/'.. sub
  info.vars.char.box.job = info.vars.job
end

-- The prerender event to run when capture calls a prerender
--------------------------------------------------
info.preRender = function()
  if (info.settings.mode > lib.mode.OFF) and (info.settings.mode ~= lib.mode.PASSIVE) then
    if info.settings.show_char then
      local my = windower.ffxi.get_mob_by_id(info.vars.my_id)
      if my then
        info.vars.char.box.cx = string.format('%+08.03f', my.x)
        info.vars.char.box.cy = string.format('%+08.03f', my.z) -- Windower and DSP have these axis swapped vs each other
        info.vars.char.box.cz = string.format('%+08.03f', my.y)
        local my_facing = my.facing
        if my_facing < 0 then
          my_facing = info.vars.twopi - (my_facing * -1)
        end
        local my_r = math.round((my_facing / info.vars.twopi) * 256)
        info.vars.char.box.cr = string.format('%03d', my_r)
      end
    end
    
    if info.settings.show_target then
      local mob = windower.ffxi.get_mob_by_target('t')
      if mob and mob.id > 0 then
        local level = '\\cs(255,100,100)  ?\\cr'
        if npcl then
          local npc = nil
          if npcl.settings.mode == lib.mode.CAPTURE then
            npc = npcl.db.capture.npc_info[mob.id]
          else
            npc = npcl.db.main.npc_info[mob.id]
          end
          
          if npc and npc.widescan and npc.widescan.seen then
            level = '\\cs(100,255,100)'.. lib.padLeft(tostring(npc.widescan.seen), 3) ..'\\cr'
          end
        end
        
        info.vars.target.box.id   = lib.padLeft(string.format('%8d', mob.id), 8)
        info.vars.target.box.lvl  = level
        info.vars.target.box.mx   = string.format('%+08.03f', mob.x)
        info.vars.target.box.my   = string.format('%+08.03f', mob.z) -- Windower and DSP have these axis swapped vs each other
        info.vars.target.box.mz   = string.format('%+08.03f', mob.y)
        
        local mob_facing = mob.facing
        if mob_facing < 0 then
          mob_facing = info.vars.twopi - (mob_facing * -1)
        end
        local mob_r = math.round((mob_facing / info.vars.twopi) * 256)
        if info.settings.target_box.style == "horizontal" then
          info.vars.target.box.mr = lib.padLeft(string.format('%03d', mob_r), 3)
        else
          info.vars.target.box.mr = lib.padLeft(string.format('%03d', mob_r), 4)
        end
        
        info.vars.target.box:show()
      else
        info.vars.target.box.id  = ' -None- '
        info.vars.target.box.lvl = '  ?'
        info.vars.target.box.mx  = '  ?     '
        info.vars.target.box.my  = '  ?     '
        info.vars.target.box.mz  = '  ?     '
        info.vars.target.box.mr  = '  ?'
        if info.settings.target_box.auto_hide then
          info.vars.target.box:hide()
        end
      end
    end
    
    if info.settings.show_world then
      local timestamp = os.date('%H:%M:%S ')
      info.vars.world.box.time = timestamp
      
      if info.settings.show_moon then
        local world_info = windower.ffxi.get_info()
        local moon = world_info.moon
        local phase = info.vars.moon_phases[world_info.moon_phase]
        info.vars.world.box.moon = moon ..'% ('.. phase ..')'
      end
      
      if info.settings.mode == lib.mode.CAPTURE then
        local time_elapsed = os.time() - info.vars.capture_start
        local minutes = time_elapsed / 60
        local hours = minutes / 60
        local capture_time = string.format('%02d:%02d:%02d', hours, minutes % 60, time_elapsed % 60)
        info.vars.world.box.capture_time = capture_time
      end
    end
  end
end

-- The unload event to run when capture unloads
--------------------------------------------------
info.unload = function()
  local addon_settings = info.settings
  local char_x, char_y = texts.pos(info.vars.char.box)
  local target_x, target_y = texts.pos(info.vars.target.box)
  local world_x, world_y = texts.pos(info.vars.world.box)
  addon_settings.char_box.pos.x = char_x
  addon_settings.char_box.pos.y = char_y
  addon_settings.target_box.pos.x = target_x
  addon_settings.target_box.pos.y = target_y
  addon_settings.world_box.pos.x = world_x
  addon_settings.world_box.pos.y = world_y

  if capture then
    capture.settings[info.info.key] = addon_settings
    config.save(capture.settings)
  else
    config.save(addon_settings)
  end
end

---------------------------------------------------------------------------------
-- INITIALIZE
---------------------------------------------------------------------------------
info.initialize = function()
  ---------------------------------------------------------------------------------
  -- DISPLAY COLORS AND LOG HEADERS
  ---------------------------------------------------------------------------------

  info.color = {}
  info.color.log = { -- Preformatted character codes for log colors.
    SYSTEM       = lib.color[info.settings.color.system][1],
  }
  info.color.box = { -- \\cs(#,#,#) values for Windower text boxes
    SYSTEM       = lib.color[info.settings.color.system][2],
  }

  ---------------------------------------------------------------------------------
  -- VARIABLES AND TEMPLATES
  ---------------------------------------------------------------------------------

  info.vars = {}
  info.vars.my_name = windower.ffxi.get_player().name
  info.vars.my_id = windower.ffxi.get_player().id
  
  info.vars.twopi = 2 * math.pi
  info.vars.moon_phases = {
    [0]  = "  New   ",
    [1]  = "WaxCrsnt",
    [2]  = "WaxCrsnt",
    [3]  = "Frst Qtr",
    [4]  = "Wax Gibb",
    [5]  = "Wax Gibb",
    [6]  = "  Full  ",
    [7]  = "Wan Gibb",
    [8]  = "Wan Gibb",
    [9]  = "Last Qtr",
    [10] = "WanCrsnt",
    [11] = "WanCrsnt",
  }

  info.buildCharBox()
  info.buildTargetBox()
  info.buildWorldBox()

  ---------------------------------------------------------------------------------
  -- EVENTS
  ---------------------------------------------------------------------------------
  if not capture then
    windower.register_event('addon command', info.command)
    
    windower.register_event('prerender', function()
      if frame%10 == 0 then
        info.preRender()
        frame = 0
      end
      frame = frame + 1
    end)

    frame = 0
  end
  
  windower.register_event('zone change', function(new, old)
    info.setupZone(new, old)
  end)
  info.setupZone(windower.ffxi.get_info().zone)
  
  windower.register_event('job change', function(main, mlvl, sub, slvl)
    info.setupJob(main, mlvl, sub, slvl)
  end)
  local player = windower.ffxi.get_player()
  info.setupJob(player.main_job_id, player.main_job_level, player.sub_job_id, player.sub_job_level)
end

if not capture then
  info.settings = config.load(info.defaults)
  info.initialize()
else
  return info
end
