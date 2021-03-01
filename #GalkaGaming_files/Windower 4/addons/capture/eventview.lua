
require('capture-lib')

eventview = eventview or {}
eventview.info = {
  name = 'EventView',
  log_name = 'EView',
  box_name = 'EView',
  version = '010',
  date = '2021/01/29',
  lib_version = '006',
  author = 'ibm2431',
  commands = {'eventview'},
  key = 'eventview',
  folder = 'eventview/'
}

if not capture then
  _addon.name = eventview.info.name
  _addon.version = eventview.info.version
  _addon.date = eventview.info.date
  _addon.lib_version = eventview.info.lib_version
  _addon.author = eventview.info.author
  _addon.commands = eventview.info.commands
end

-- ------------------------------------------------------------------------------
-- DEFAULT USER SETTINGS
-- ------------------------------------------------------------------------------

eventview.defaults = T{}

eventview.defaults.mode = lib.mode.ACTIVE
eventview.defaults.file_path = 'data/eventview/'

eventview.defaults.show_box = true -- shows the eventview info box
eventview.defaults.auto_hide = true -- when an event finishes, auto-hide the box after 5 seconds
eventview.defaults.auto_hide_time = 6 -- the number of seconds before hiding the box after event

eventview.defaults.box = T{}
eventview.defaults.box.max_num = 3
eventview.defaults.box.spacing = 8
eventview.defaults.box.pos   = T{}
eventview.defaults.box.pos.x = 465
eventview.defaults.box.pos.y = 540
eventview.defaults.box.text       = {}
eventview.defaults.box.text.size  = 11
eventview.defaults.box.text.font  = 'Consolas'
eventview.defaults.box.text.alpha = 255
eventview.defaults.box.text.red   = 255
eventview.defaults.box.text.green = 255
eventview.defaults.box.text.blue  = 255

eventview.defaults.box.bg = T{}
eventview.defaults.box.bg.red   = 30
eventview.defaults.box.bg.green = 30
eventview.defaults.box.bg.blue  = 60
eventview.defaults.box.bg.alpha = 230

eventview.defaults.color = T{}
eventview.defaults.color.actor        = 12 -- 01234567 (Name)
eventview.defaults.color.event        =  1 -- 123
eventview.defaults.color.event_header = 18 -- CS Event (0x032), CS Event + Strings (0x033), CS Event + Params (0x034)
eventview.defaults.color.event_option =  9 -- Event Option (0x05B)
eventview.defaults.color.event_update =  9 -- Event Update (0x05C)
eventview.defaults.color.incoming     = 19 -- INCOMING
eventview.defaults.color.message      =  1 -- 12345
eventview.defaults.color.npc_chat     = 25 -- NPC Chat (0x036)
eventview.defaults.color.option       = 21 -- 1
eventview.defaults.color.outgoing     = 19 -- OUTGOING
eventview.defaults.color.params       = 21 -- 0, 1, 2, 3, 4, 5, 6, 7
eventview.defaults.color.system       = 19

---------------------------------------------------------------------------------
-- COMMANDS
---------------------------------------------------------------------------------
eventview.help_text = {
  ['box_test'] = "Displays a test box. Call again to hide, and save setting.",
  ['capture'] = "Starts or stops a capture: start | stop",
  ['color_test'] = "Displays the color codes used by the addon",
  ['mode'] = "Sets mode: OFF | INFO | PASSIVE | ACTIVE",
  ['ver'] = "Shows addon (and library) version and date",
}

eventview.commands = {
  ['capture'] = function(args)
    if args[1] then
      local toggle = string.lower(args[1])
      if toggle == 'start' then
        eventview.startCapture()
      elseif toggle == 'stop' then
        eventview.stopCapture()
      else
        lib.msg(eventview, "Usage: //eventview capture [start | stop]")
      end
    else
      lib.msg(eventview, "Usage: //eventview capture [start | stop]")
    end
  end,
  ['color_test'] = function()
    lib.colorTest(eventview)
  end,
  ['box_test'] = function ()
    lib.testBox(eventview)
  end,
  ['ver'] = function()
    lib.displayVer(eventview)
  end,
  ['mode'] = function(args)
    lib.setMode(eventview, args[1])
  end,  
  ['help'] = function()
    lib.displayHelp(eventview)
  end,
}

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Sets up tables and files for use in the current zone
--------------------------------------------------
eventview.setupZone = function(zone)
  local current_zone = res.zones[zone].en
  eventview.file.simple = lib.fileOpen(eventview.settings.file_path.. eventview.vars.my_name ..'/simple/'.. current_zone ..'.log')
  eventview.file.raw = lib.fileOpen(eventview.settings.file_path.. eventview.vars.my_name ..'/raw/'.. current_zone ..'.log')
  
  if eventview.settings.mode == lib.mode.CAPTURE then
    eventview.file.capture.simple = lib.fileOpen(eventview.vars.capture_root ..'simple/'.. current_zone ..'.log')
    eventview.file.capture.raw = lib.fileOpen(eventview.vars.capture_root ..'raw/'.. current_zone ..'.log')
  end
end

-- Pulls apart params sent with an event CS packet
--------------------------------------------------
eventview.getParams = function(params_string)
  local params = {}
  local final_param_string = ''
  local int_rep = 0
  for i = 0, 6 do
    params[i + 1] = string.sub(params_string, (i * 8)+1, (i * 8) + 8)
    int_rep = lib.byteStringToInt(params[i + 1])
    params[i + 1] = tostring(int_rep)
    final_param_string = final_param_string .. int_rep .. ", "
  end
  params[8] = string.sub(params_string, (7 * 8) + 1, (7 * 8) + 8)
  int_rep = lib.byteStringToInt(params[8])
  params[8] = tostring(int_rep)
  final_param_string = final_param_string .. int_rep
  return params, final_param_string
end

-- Handles writing an event to the info box
--------------------------------------------------
eventview.writeBox = function(info)
  local packet_type = eventview.packets[info.id]
  local template = packet_type.template
  
  box = texts.new(template, eventview.settings.box)
  texts.pos(box, eventview.vars.box_positions[1].x, eventview.vars.box_positions[1].y)
  
  if info.dir == 'OUTGOING >' then
    box.dir = eventview.color.box.OUTGOING.. info.dir
  else
    box.dir = eventview.color.box.INCOMING.. info.dir
  end
  box.type = packet_type.box_color.. lib.padRight(packet_type.text, 31)
  if template ~= eventview.template.UPDATE then
    box.actor = eventview.color.box.ACTOR.. info.actor
  end

  if template == eventview.template.NPC_CHAT then
    box.message = eventview.color.box.MESSAGE.. lib.padLeft(info.message, 5)
  else
    if template ~= eventview.template.UPDATE then
      box.event = eventview.color.box.EVENT.. lib.padLeft(info.event, 6)
    end
    
    if template == eventview.template.OPTION then
      box.option = eventview.color.box.OPTION.. lib.padLeft(info.option, 5)
    elseif info.params then
      box.p1 = lib.padLeft(info.params[1], 11)
      box.p2 = lib.padLeft(info.params[2], 11)
      box.p3 = lib.padLeft(info.params[3], 11)
      box.p4 = lib.padLeft(info.params[4], 11)
      box.p5 = lib.padLeft(info.params[5], 11)
      box.p6 = lib.padLeft(info.params[6], 11)
      box.p7 = lib.padLeft(info.params[7], 11)
      box.p8 = lib.padLeft(info.params[8], 11)
      if info.sparam1 then
        box.sp1 = lib.padLeft(info.sparam1, 22)
        box.sp2 = lib.padLeft(info.sparam2, 22)
        box.sp3 = lib.padLeft(info.sparam3, 22)
        box.sp4 = lib.padLeft(info.sparam4, 22)
      end
    end
  end
  return box
end

-- Builds a colorized chatlog string
--------------------------------------------------
eventview.buildChatlogString = function(info)
  local packet_type = eventview.packets[info.id]
  local chatlog_string = eventview.h.eventview
  
  local chatlog_info = packet_type.string_params(info)
  if chatlog_info[1] == info.actor then
    chatlog_info[1] = string.gsub(chatlog_info[1], ' ', ' '.. eventview.color.log.ACTOR)
  end
  if info.param_string then
    if chatlog_info[1] == info.param_string then
      chatlog_info[1] = string.gsub(chatlog_info[1], ' ', ' '.. eventview.color.log.PARAMS)
    elseif chatlog_info[3] == info.param_string then
      chatlog_info[3] = string.gsub(chatlog_info[3], ' ', ' '.. eventview.color.log.PARAMS)
    end
  end
  
  if info.dir == 'OUTGOING >' then
    chatlog_string = chatlog_string.. eventview.color.log.OUTGOING.. info.dir .. ' '
  else
    chatlog_string = chatlog_string.. eventview.color.log.INCOMING.. info.dir .. ' '
  end
  chatlog_string = chatlog_string.. packet_type.log_color.. packet_type.text.. packet_type.log_string
  
  chatlog_string = string.format(chatlog_string, unpack(chatlog_info))
  return chatlog_string
end

-- Builds a simple string for file logging
--------------------------------------------------
eventview.buildSimpleString = function(info)
  local packet_type = eventview.packets[info.id]
  local simple_info = packet_type.string_params(info)
  return string.format(info.dir .. ' '.. packet_type.text .. packet_type.simple_string, unpack(simple_info))
end

-- Checks incoming chunks for event CSes or NPC chats and logs them
--------------------------------------------------
eventview.checkChunk = function(dir, id, data)
  if eventview.settings.mode == lib.mode.OFF then
    return
  end
  
  if eventview.packets[id] and (eventview.packets[id].dir == dir) then
    local update_packet = {}
    local info = {
      id = id,
      dir = dir
    }
    if id == 0x05B then
      update_packet = packets.parse('outgoing', data)
      eventview.vars.in_event = false
    else
      update_packet = packets.parse('incoming', data)
    end
    
    if id == 0x00A and not (update_packet['Menu Zone'] > 0) then
      return
    end
    
    if update_packet['Menu Zone'] then
      info.actor = update_packet['Menu Zone']
    elseif update_packet['NPC'] then
      info.actor = update_packet['NPC']
    elseif update_packet['Actor'] then
      info.actor = update_packet['Actor']
    elseif update_packet['Target'] then
      info.actor = update_packet['Target']
    end
    
    if info.actor then
      if id == 0x00A then
        info.actor = info.actor .. ' ('.. res.zones[info.actor].en ..')'
      else
        local mob = windower.ffxi.get_mob_by_id(info.actor)
        if mob and mob.name then
          info.actor = info.actor .. ' ('.. mob.name ..')'
        end
      end
    end

    if update_packet['Message ID'] then
      info.message = tostring(update_packet['Message ID'])
    elseif update_packet['Option Index'] then
      eventview.vars.in_event = false
      info.option = tostring(update_packet['Option Index'])
      info.event = string.format('%X', tonumber(update_packet['Menu ID'], 16))
    else
      eventview.vars.in_event = true
      
      if update_packet['Menu ID'] then
        info.event = string.format('%X', tonumber(update_packet['Menu ID'], 16))
        if id == 0x033 then
          info.params, info.param_string = eventview.getParams(string.sub(data:hex(), (0x50*2)+1, (0x70*2)))
          info.sparam1 = update_packet['NPC Name']
          info.sparam2 = update_packet['_dupeNPC Name1']
          info.sparam3 = update_packet['_dupeNPC Name2']
          info.sparam4 = update_packet['_dupeNPC Name3']
          info.sparam_string = info.sparam1 .. ', '.. info.sparam2 ..', '.. info.sparam3 .. ', '.. info.sparam4
        elseif (not update_packet['Menu Zone']) or (update_packet['Menu Zone'] <= 0) then
          info.params, info.param_string = eventview.getParams(string.sub(data:hex(), (0x08*2)+1, (0x28*2)))
        end
      elseif id ~= 0x032 then
        info.params, info.param_string = eventview.getParams(string.sub(data:hex(), (0x04*2)+1, (0x24*2)))
      end
    end
    
    if eventview.settings.mode >= lib.mode.PASSIVE then
      local simple_string = eventview.buildSimpleString(info)
      lib.fileAppend(eventview.file.simple, simple_string .. "\n\n")
      lib.fileAppend(eventview.file.raw, simple_string .. '\n'.. data:hexformat_file() .. '\n')
      
      if eventview.settings.mode == lib.mode.CAPTURE then
        lib.fileAppend(eventview.file.capture.simple, simple_string .. "\n\n")
        lib.fileAppend(eventview.file.capture.raw, simple_string .. '\n'.. data:hexformat_file() .. '\n')
      end
    end
    
    if eventview.settings.mode ~= lib.mode.PASSIVE then
      windower.add_to_chat(eventview.color.log.SYSTEM, eventview.buildChatlogString(info))
      lib.updateBox(eventview, info)
    end
  end
end

-- Starts logging to a new log file
---------------------------------------------------------------------
eventview.startCapture = function()
  eventview.file.capture.simple = lib.fileOpen(eventview.vars.capture_root.. 'simple.log')
  eventview.file.capture.raw    = lib.fileOpen(eventview.vars.capture_root.. 'raw.log')
end

-- Stops logging to a capture file
---------------------------------------------------------------------
eventview.stopCapture = function()
  -- Stubbed
end

-- Checks for a valid command and executes it
--------------------------------------------------
eventview.command = function(cmd, ...)
  lib.command(eventview, cmd, ...)
end

---------------------------------------------------------------------------------
-- INITIALIZE
---------------------------------------------------------------------------------
eventview.initialize = function()
  ---------------------------------------------------------------------------------
  -- DISPLAY COLORS AND LOG HEADERS
  ---------------------------------------------------------------------------------

  eventview.color = {}
  eventview.color.log = { -- Preformatted character codes for log colors.
    SYSTEM       = lib.color[eventview.settings.color.system][1],
    INCOMING     = lib.color[eventview.settings.color.incoming][1],
    OUTGOING     = lib.color[eventview.settings.color.outgoing][1],
    EVENT_HEADER = lib.color[eventview.settings.color.event_header][1],
    EVENT_OPTION = lib.color[eventview.settings.color.event_option][1],
    EVENT_UPDATE = lib.color[eventview.settings.color.event_update][1],
    NPC_CHAT     = lib.color[eventview.settings.color.npc_chat][1],
    ACTOR        = lib.color[eventview.settings.color.actor][1],
    EVENT        = lib.color[eventview.settings.color.event][1],
    OPTION       = lib.color[eventview.settings.color.option][1],
    MESSAGE      = lib.color[eventview.settings.color.message][1],
    PARAMS       = lib.color[eventview.settings.color.params][1],
  }
  eventview.color.box = { -- \\cs(#,#,#) values for Windower text boxes
    SYSTEM       = lib.color[eventview.settings.color.system][2],
    INCOMING     = lib.color[eventview.settings.color.incoming][2],
    OUTGOING     = lib.color[eventview.settings.color.outgoing][2],
    EVENT_HEADER = lib.color[eventview.settings.color.event_header][2],
    EVENT_OPTION = lib.color[eventview.settings.color.event_option][2],
    EVENT_UPDATE = lib.color[eventview.settings.color.event_update][2],
    NPC_CHAT     = lib.color[eventview.settings.color.npc_chat][2],
    ACTOR        = lib.color[eventview.settings.color.actor][2],
    EVENT        = lib.color[eventview.settings.color.event][2],
    OPTION       = lib.color[eventview.settings.color.option][2],
    MESSAGE      = lib.color[eventview.settings.color.message][2],
    PARAMS       = lib.color[eventview.settings.color.params][2],
  }

  eventview.h = { -- Headers for log string. ex: NPC:
    eventview = eventview.color.log.SYSTEM .. '[EView] ',
    actor     = eventview.color.log.SYSTEM .. 'NPC: '       .. eventview.color.log.ACTOR,
    event     = eventview.color.log.SYSTEM .. 'Event: '     .. eventview.color.log.EVENT,
    option    = eventview.color.log.SYSTEM .. 'Option: '    .. eventview.color.log.OPTION,
    message   = eventview.color.log.SYSTEM .. 'Message: '   .. eventview.color.log.MESSAGE,
    params    = eventview.color.log.SYSTEM .. 'Params: '    .. eventview.color.log.PARAMS,
    sparams   = eventview.color.log.SYSTEM .. 'StrParams: ' .. eventview.color.log.PARAMS,
    zone      = eventview.color.log.SYSTEM .. 'Zone: '      .. eventview.color.log.ACTOR,
  }

  ---------------------------------------------------------------------------------
  -- VARIABLES AND TEMPLATES
  ---------------------------------------------------------------------------------

  eventview.template = {}
  eventview.template.EVENT        = ' ${dir|%s} ${type|%s}'.. 
                                 eventview.color.box.SYSTEM ..'[EView]\n Event: ${event|%s}'.. eventview.color.box.SYSTEM ..
                                 ' Actor: ${actor|%s}\n \n '
  eventview.template.ZONE        = ' ${dir|%s} ${type|%s}'.. 
                                 eventview.color.box.SYSTEM ..'[EView]\n Event: ${event|%s}'.. eventview.color.box.SYSTEM ..
                                 ' Zone: ${actor|%s}\n \n '
  eventview.template.EVENT_PARAMS = ' ${dir|%s} ${type|%s}'.. 
                                 eventview.color.box.SYSTEM ..'[EView]\n Event: ${event|%s}'.. eventview.color.box.SYSTEM ..
                                 ' Actor: ${actor|%s}\n '..eventview.color.box.SYSTEM ..'P: '.. eventview.color.box.PARAMS ..
                                 '${p1|%s} ${p2|%s} ${p3|%s} ${p4|%s}\n    ${p5|%s} ${p6|%s} ${p7|%s} ${p8|%s}'
  eventview.template.EVENT_STRING = ' ${dir|%s} ${type|%s}'.. 
                                 eventview.color.box.SYSTEM ..'[EView]\n Event: ${event|%s}'.. eventview.color.box.SYSTEM ..
                                 ' Actor: ${actor|%s}\n '..eventview.color.box.SYSTEM ..'P: '.. eventview.color.box.PARAMS ..
                                 '${p1|%s} ${p2|%s} ${p3|%s} ${p4|%s}\n    ${p5|%s} ${p6|%s} ${p7|%s} ${p8|%s}\n'..
                                 eventview.color.box.SYSTEM ..' SP: '.. eventview.color.box.PARAMS..
                                 '${sp1|%s} ${sp2|%s}\n     ${sp3|%s} ${sp4|%s}'
  eventview.template.OPTION       = ' ${dir|%s} ${type|%s}'..eventview.color.box.SYSTEM ..'[EView]\n Event: ${event|%s} '..
                                 eventview.color.box.SYSTEM ..'Actor: ${actor|%s}\n'..eventview.color.box.SYSTEM ..' Option: ${option|%s}\n '
  eventview.template.UPDATE       = ' ${dir|%s} ${type|%s}'.. eventview.color.box.SYSTEM ..'[EView]\n'..
                                 ' P: '.. eventview.color.box.PARAMS ..'${p1|%s} ${p2|%s} ${p3|%s} ${p4|%s}\n    ${p5|%s} ${p6|%s} ${p7|%s} ${p8|%s}\n '
  eventview.template.NPC_CHAT     = ' ${dir|%s} ${type|%s}'..eventview.color.box.SYSTEM ..'[EView]\n'..eventview.color.box.SYSTEM ..' Actor: ${actor|%s}\n'..
                                 eventview.color.box.SYSTEM ..' Message: ${message|%s}\n '

  eventview.vars = {}
  eventview.vars.my_name = windower.ffxi.get_player().name

  eventview.vars.show_box = eventview.settings.show_box
  -- I really should not have to do this, but assigning box positions based off
  -- of settings.box.pos.y directly will cause settings.box.pos.y to CHANGE
  -- when I move a box that was previously assigned in that y position.
  eventview.vars.initial_x = eventview.settings.box.pos.x
  eventview.vars.initial_y = eventview.settings.box.pos.y
  eventview.vars.in_event = false
  eventview.vars.hide_ticking = false
  eventview.vars.color_testing = false

  eventview.vars.box_positions = {
    [1] = {x = eventview.vars.initial_x, y = eventview.vars.initial_y}
  }
  for i = 2, 10 do
    eventview.vars.box_positions[i] = {
      x = eventview.vars.initial_x,
      y = eventview.vars.initial_y - (((eventview.settings.box.text.size + eventview.settings.box.spacing) * 4) * (i - 1))
    }
  end

  eventview.vars.boxes = {}
  eventview.vars.test_box_info = {
    dir = 'INCOMING <',
    id = 0x034,
    actor = '12345678 (Test Moogle)',
    event = '12345',
    params = {'123', '1234', '12345', '123456', '1234567', '12345678', '123456789', '1234567890'}
  }

  eventview.file = T{}
  eventview.file.capture = T{}
  eventview.file.simple = lib.fileOpen(eventview.settings.file_path.. eventview.vars.my_name ..'/logs/simple.log')
  eventview.file.raw    = lib.fileOpen(eventview.settings.file_path.. eventview.vars.my_name ..'/logs/raw.log')

  ---------------------------------------------------------------------------------
  -- PACKET PARSING INFORMATION
  ---------------------------------------------------------------------------------

  eventview.packets = {
    [0x00A] = {
      dir = 'INCOMING <',
      text = 'Zone CS (0x00A): ',
      box_color = eventview.color.box.EVENT_HEADER,
      log_color = eventview.color.log.EVENT_HEADER,
      log_string = eventview.h.zone..'%s, '.. eventview.h.event..'%s\n',
      simple_string = ' Zone: %s\nEvent: %s',
      string_params = function(info) return {[1] = info.actor, [2] = info.event} end,
      template = eventview.template.ZONE,
    },
    [0x033] = {
      dir = 'INCOMING <',
      text = 'CS Event + Strings (0x033): ',
      box_color = eventview.color.box.EVENT_HEADER,
      log_color = eventview.color.log.EVENT_HEADER,
      log_string = eventview.h.actor..'%s, '.. eventview.h.event..'%s, '.. eventview.h.params..'%s, '.. eventview.h.sparams..'%s',
      simple_string = ' NPC: %s\nEvent: %s\nParams: %s\nStrParams: %s',
      string_params = function(info) return {[1] = info.actor, [2] = info.event, [3] = info.param_string, [4] = info.sparam_string} end,
      template = eventview.template.EVENT_STRING,
    },
    [0x032] = {
      dir = 'INCOMING <',
      text = 'CS Event (0x032): ',
      box_color = eventview.color.box.EVENT_HEADER,
      log_color = eventview.color.log.EVENT_HEADER,
      log_string = eventview.h.actor..'%s, '.. eventview.h.event..'%s\n',
      simple_string = ' NPC: %s\nEvent: %s',
      string_params = function(info) return {[1] = info.actor, [2] = info.event} end,
      template = eventview.template.EVENT,
    },
    [0x034] = {
      dir = 'INCOMING <',
      text = 'CS Event + Params (0x034): ',
      box_color = eventview.color.box.EVENT_HEADER,
      log_color = eventview.color.log.EVENT_HEADER,
      log_string = eventview.h.actor..'%s, '.. eventview.h.event..'%s, '.. eventview.h.params..'%s',
      simple_string = ' NPC: %s\nEvent: %s\nParams: %s',
      string_params = function(info) return {[1] = info.actor, [2] = info.event, [3] = info.param_string} end,
      template = eventview.template.EVENT_PARAMS,
    },
    [0x05C] = {
      dir = 'INCOMING <',
      text = 'Event Update (0x05C): ',
      box_color = eventview.color.box.EVENT_UPDATE,
      log_color = eventview.color.log.EVENT_UPDATE,
      log_string = eventview.h.params..'%s',
      simple_string = ' \nParams: %s',
      string_params = function(info) return {[1] = info.param_string} end,
      template = eventview.template.UPDATE,
    },
    [0x036] = {
      dir = 'INCOMING <',
      text = 'NPC Chat (0x036): ',
      box_color = eventview.color.box.NPC_CHAT,
      log_color = eventview.color.log.NPC_CHAT,
      log_string = eventview.h.actor..'%s, '.. eventview.h.message..'%s',
      simple_string = ' NPC: %s\nMessage: %s',
      string_params = function(info) return {[1] = info.actor, [2] = info.message} end,
      template = eventview.template.NPC_CHAT,
    },
    [0x05B] = {
      dir = 'OUTGOING >',
      text = 'Event Option (0x05B): ',
      box_color = eventview.color.box.EVENT_OPTION,
      log_color = eventview.color.log.EVENT_OPTION,
      log_string = eventview.h.actor..'%s, '.. eventview.h.event..'%s, '.. eventview.h.option..'%s',
      simple_string = ' NPC: %s\nEvent: %s\nOption: %s',
      string_params = function(info) return {[1] = info.actor, [2] = info.event, [3] = info.option} end,
      template = eventview.template.OPTION,
    },
  }

  lib.checkLibVer(eventview)
  windower.register_event('zone change', function(new, old) eventview.setupZone(new) end)
  windower.register_event('outgoing chunk', function(id, data, modified, injected, blocked) eventview.checkChunk('OUTGOING >', id, data) end)
  windower.register_event('incoming chunk', function(id, data, modified, injected, blocked) eventview.checkChunk('INCOMING <', id, data) end)
  
  if not capture then
    windower.register_event('addon command', eventview.command)
  end
  eventview.setupZone(windower.ffxi.get_info().zone)
end

if not capture then
  eventview.settings = config.load(eventview.defaults)
  eventview.initialize()
else
  return eventview
end


