require('capture-lib')
res = require('resources')
eventview = require('eventview')

gardenlog = gardenlog or {}
gardenlog.info = {
  name = 'GardenLog',
  log_name = 'GL',
  box_name = 'GL',
  version = '003',
  date = '2021/02/07',
  lib_version = '006',
  author = 'ibm2431',
  commands = {'gardenlog','gl'},
  key = 'gardenlog',
  folder = 'gardenlog/'
}

if not capture then
  _addon.name = gardenlog.info.name
  _addon.version = gardenlog.info.version
  _addon.date = gardenlog.info.date
  _addon.lib_version = gardenlog.info.lib_version
  _addon.author = gardenlog.info.author
  _addon.commands = gardenlog.info.commands
end

-- ------------------------------------------------------------------------------
-- DEFAULT USER SETTINGS
-- ------------------------------------------------------------------------------

gardenlog.defaults = T{}

gardenlog.defaults.mode = lib.mode.PASSIVE
gardenlog.defaults.file_path = 'data/gardenlog/'

gardenlog.defaults.show_box = true -- shows the gardenlog info box
gardenlog.defaults.auto_hide = true -- when items are displayed in the log, auto-hide the box after X seconds
gardenlog.defaults.auto_hide_time = 30 -- the number of seconds before hiding the box after event

gardenlog.defaults.box = T{}
gardenlog.defaults.box.max_num = 1
gardenlog.defaults.box.spacing = 8
gardenlog.defaults.box.pos   = T{}
gardenlog.defaults.box.pos.x = 465
gardenlog.defaults.box.pos.y = 20
gardenlog.defaults.box.text       = {}
gardenlog.defaults.box.text.size  = 11
gardenlog.defaults.box.text.font  = 'Consolas'
gardenlog.defaults.box.text.alpha = 255
gardenlog.defaults.box.text.red   = 255
gardenlog.defaults.box.text.green = 255
gardenlog.defaults.box.text.blue  = 255

gardenlog.defaults.box.bg = T{}
gardenlog.defaults.box.bg.red   = 30
gardenlog.defaults.box.bg.green = 30
gardenlog.defaults.box.bg.blue  = 60
gardenlog.defaults.box.bg.alpha = 230

gardenlog.defaults.color = T{}
gardenlog.defaults.color.system          = 19
gardenlog.defaults.color.location        = 12
gardenlog.defaults.color.rank            = 21
gardenlog.defaults.color.slot            = 18
gardenlog.defaults.color.item_id         = 1
gardenlog.defaults.color.item_name       = 9
gardenlog.defaults.color.seed            = 1
gardenlog.defaults.color.seed_name       = 9
gardenlog.defaults.color.fertilizer      = 1
gardenlog.defaults.color.fertilizer_name = 9
gardenlog.defaults.color.node            = 9

gardenlog.settings = {}

---------------------------------------------------------------------------------
-- COMMANDS
---------------------------------------------------------------------------------
gardenlog.help_text = {
  ['mode']            = "Sets mode: OFF | INFO | PASSIVE | ACTIVE",
  ['ver']             = "Shows addon (and library) version and date",
}

gardenlog.commands = {
  ['help'] = function()
    lib.displayHelp(gardenlog)
  end,
  ['color_test'] = function()
    lib.colorTest(gardenlog)
  end,
  ['box_test'] = function ()
    lib.testBox(gardenlog)
  end,
  ['mode'] = function(args)
    lib.setMode(gardenlog, args[1])
  end,  
  ['ver'] = function()
    lib.displayVer(gardenlog)
  end,
}

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Checks for a valid command and executes it
--------------------------------------------------
gardenlog.command = function(cmd, ...)
  lib.command(gardenlog, cmd, ...)
end

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Sets up tables and files for use in the current zone
--------------------------------------------------
function gardenlog.setupZone(zone, zone_left)
  if gardenlog.vars.in_garden then
    gardenlog.vars.in_garden = false
  elseif zone == 280 then
    gardenlog.vars.in_garden = true
  end
end

-- Builds a simple string for file logging
--------------------------------------------------
gardenlog.buildSimpleString = function(item)
  if gardenlog.vars.seed ~= '' then
    return string.format(gardenlog.template.LOG_FURROW, item.location, item.rank, 
                          item.slot, item.id, item.name,
                          gardenlog.vars.seed,
                          gardenlog.vars.seed_name,
                          gardenlog.vars.fertilizer,
                          gardenlog.vars.fertilizer_name)
  elseif gardenlog.vars.node ~= '' then
    return string.format(gardenlog.template.LOG_GROVE_VEIN, item.location, item.rank,
                          gardenlog.vars.node,
                          item.slot, item.id, item.name,
                          gardenlog.vars.fertilizer,
                          gardenlog.vars.fertilizer_name)
  else
    return string.format(gardenlog.template.LOG, item.location, item.rank, 
                          item.slot, item.id, item.name,
                          gardenlog.vars.fertilizer,
                          gardenlog.vars.fertilizer_name)
  end
end

-- Handles writing an item to the info box
--------------------------------------------------
gardenlog.writeBox = function(info)
  local box = texts.new(gardenlog.template.ITEMS, gardenlog.settings.box)

  local space_needed = -9
  
  if gardenlog.vars.seed ~= '' then
    box = texts.new(gardenlog.template.ITEMS_FURROW, gardenlog.settings.box)
    box.seed = gardenlog.vars.seed
    box.seed_name = gardenlog.vars.seed_name
    space_needed = space_needed + string.len(gardenlog.vars.seed) + string.len(gardenlog.vars.seed_name)
  elseif gardenlog.vars.node ~= '' then
    box = texts.new(gardenlog.template.ITEMS_GROVE_VEIN, gardenlog.settings.box)
    box.node = gardenlog.vars.node
  end
  box.fertilizer = gardenlog.vars.fertilizer
  box.fertilizer_name = gardenlog.vars.fertilizer_name

  space_needed = space_needed + string.len(gardenlog.vars.fertilizer) + string.len(gardenlog.vars.fertilizer_name)
  if space_needed < 0 then
    space_needed = 0
  end
  box.label_space = lib.padRight(' ', space_needed)
  

  
  box.location = gardenlog.color.box.LOCATION.. lib.padRight(gardenlog.vars.location, 16)
  box.rank = gardenlog.color.box.RANK.. gardenlog.vars.rank
  
  local items_string = ''
  for _, item in pairs(info) do
    items_string = items_string .. gardenlog.color.box.SLOT.. '  #'.. lib.padRight(item.slot, 2) ..': '.. 
                   gardenlog.color.box.ITEM_ID.. lib.padLeft(item.id, 5) .. gardenlog.color.box.ITEM_NAME.. ' ('.. item.name .. ')\n'
  end
  box.items = items_string

  return box
end

-- Checks an incoming chunk for a spawn packet
------------------------------------------------
function gardenlog.checkChunk(id, data, modified, injected, blocked)
  if gardenlog.settings.mode == lib.mode.OFF then
    return
  end
  
  if gardenlog.vars.in_garden then
    if id == 0x05C then
      gardenlog.vars.slot = gardenlog.vars.slot + 1
    elseif id == 0x032 or id == 0x034 then
      local event_packet = packets.parse('incoming', data)
      local event = event_packet['Menu ID']
      local is_furrow = false
      local furrow = 0
      
      local node = ''
      local location = nil
      
      if event == 1003 then
        location = "Pond Dredger"
      elseif event == 1005 then
        location = "Coastal Net"
      elseif event >= 1006 and event <= 1014 then
        location = "Garden Furrow"
        furrow = math.mod((event - 1006), 3) + 1
        location = location .." #".. tostring(furrow)
        is_furrow = true
      elseif event >= 1017 and event <= 1024 then
        location = "Arboreal Grove"
        node = tostring(event_packet['NPC'])
      elseif event >= 1041 and event <= 1048 then
        location = "Mineral Vein"
        node = tostring(event_packet['NPC'])
      elseif event == 1065 then
        location = "Flotsam"
      else
        location = ''
      end

      if gardenlog.vars.location ~= location then
        gardenlog.vars.slot = 1
        gardenlog.vars.location = location
        gardenlog.vars.location_items = {}
      elseif (node ~= '') and (gardenlog.vars.node ~= node) then
        gardenlog.vars.slot = 1
        gardenlog.vars.location_items = {}
      end
      
      gardenlog.vars.node = node
  
      if id == 0x034 and (location ~= '') then -- Flotsam doesn't have params
        local params, _ = eventview.getParams(string.sub(data:hex(), (0x08*2)+1, (0x28*2)))
        gardenlog.vars.rank = params[1]
        
        local fertilizer = tonumber(params[2])
        
        if is_furrow then -- Furrows have different param rules from other locations
          if (event - 1011 - furrow) == 0 then
            -- Seed, fertilizer, and rank are packed, but only in checking furrow events
            local rank_as_num = tonumber(gardenlog.vars.rank)
            gardenlog.vars.rank = tostring(bit.band(rank_as_num, 7))
            gardenlog.vars.seed = bit.band(fertilizer, 0xFFFF)
            fertilizer = bit.rshift(bit.band(fertilizer, 0xFFFF0000), 16)
          elseif (event - 1005 - furrow) == 0 then
            -- In the seed planting event, param 1 is the seed by itself
            gardenlog.vars.seed = tonumber(params[1])
            gardenlog.vars.rank = params[5] -- Rank is moved to param 5
            fertilizer = 0 -- Fertilizer isn't used in the seed event
          else
            -- In fertilizer event, fertilizer takes param 1, with seed moving to 5
            fertilizer = tonumber(params[1]) 
            gardenlog.vars.seed = tonumber(params[5])
            gardenlog.vars.rank = '0' -- Rank isn't used in the fertilizer event
          end
          
          if gardenlog.vars.seed > 0 then
            gardenlog.vars.seed_name = res.items[gardenlog.vars.seed].en
          else
            gardenlog.vars.seed_name = 'None'
          end
          gardenlog.vars.seed = tostring(gardenlog.vars.seed)
          
        else
          gardenlog.vars.seed = ''
          gardenlog.vars.seed_name = 'None'
        end
        
        if fertilizer > 0 then
          gardenlog.vars.fertilizer_name = res.items[fertilizer].en
        else
          gardenlog.vars.fertilizer_name = 'None'
        end
        gardenlog.vars.fertilizer = tostring(fertilizer)
        
        if gardenlog.settings.mode ~= lib.mode.PASSIVE then
          lib.updateBox(gardenlog, gardenlog.vars.location_items)
        end
      
      else
        gardenlog.vars.rank = 0
        gardenlog.vars.seed = ''
        gardenlog.vars.seed_name = 'None'
        gardenlog.vars.fertilizer = ''
        gardenlog.vars.fertilizer_name = 'None'
        gardenlog.vars.node = ''
      end
      
      -- Grab the rank of the location
      -- Display a new, blank box
    elseif id == 0x02A then
      local message_packet = packets.parse('incoming', data)
      if (message_packet['Message ID'] == 39157) and (gardenlog.vars.location ~= '') then
        local item_id = message_packet['Param 1']
        local item = res.items[item_id]
        
        local new_item = {
          location = gardenlog.vars.location,
          rank = tostring(gardenlog.vars.rank),
          slot = tostring(gardenlog.vars.slot),
          id = tostring(item_id),
          name = item.en
        }
        
        table.insert(gardenlog.vars.location_items, new_item)
        
        if (gardenlog.vars.location == 'Pond Dredger') or (gardenlog.vars.location == 'Coastal Net') then
          gardenlog.vars.slot = gardenlog.vars.slot + 1
        end

        if gardenlog.settings.mode >= lib.mode.PASSIVE then
          local simple_string = gardenlog.buildSimpleString(new_item)
          lib.fileAppend(gardenlog.file.simple, simple_string)
          
          if gardenlog.settings.mode == lib.mode.CAPTURE then
            lib.fileAppend(gardenlog.file.capture.simple, simple_string)
          end
        end
        
        if gardenlog.settings.mode ~= lib.mode.PASSIVE then
          lib.updateBox(gardenlog, gardenlog.vars.location_items)
        end
      elseif
        (gardenlog.settings.mode ~= lib.mode.PASSIVE) and (gardenlog.vars.location ~= '')
        and ((message_packet['Message ID'] == 7349)
        or (message_packet['Message ID'] == 7364)
        or (message_packet['Message ID'] == 7376))
      then
        -- Redisplay the box for the last location interacted with
        lib.updateBox(gardenlog, gardenlog.vars.location_items)
      end
    end
  end
end

-- Starts logging to a new log file
---------------------------------------------------------------------
gardenlog.startCapture = function()
  gardenlog.setupZone(windower.ffxi.get_info().zone)
  gardenlog.file.capture.simple = lib.fileOpen(gardenlog.vars.capture_root.. gardenlog.vars.my_name.. '.log')
end

-- Stops logging to a capture file
---------------------------------------------------------------------
gardenlog.stopCapture = function()
  -- Stubbed
end

---------------------------------------------------------------------------------
-- INITIALIZE
---------------------------------------------------------------------------------
gardenlog.initialize = function()
  ---------------------------------------------------------------------------------
  -- DISPLAY COLORS AND LOG HEADERS
  ---------------------------------------------------------------------------------

  gardenlog.color = {}
  gardenlog.color.log = { -- Preformatted character codes for log colors.
    SYSTEM          = lib.color[gardenlog.settings.color.system][1],
    LOCATION        = lib.color[gardenlog.settings.color.location][1],
    RANK            = lib.color[gardenlog.settings.color.rank][1],
    SLOT            = lib.color[gardenlog.settings.color.slot][1],
    ITEM_ID         = lib.color[gardenlog.settings.color.item_id][1],
    ITEM_NAME       = lib.color[gardenlog.settings.color.item_name][1],
    SEED            = lib.color[gardenlog.settings.color.seed][1],
    SEED_NAME       = lib.color[gardenlog.settings.color.seed_name][1],
    FERTILIZER      = lib.color[gardenlog.settings.color.fertilizer][1],
    FERTILIZER_NAME = lib.color[gardenlog.settings.color.fertilizer_name][1],
    NODE            = lib.color[gardenlog.settings.color.node][1],
  }
  gardenlog.color.box = { -- \\cs(#,#,#) values for Windower text boxes
    SYSTEM          = lib.color[gardenlog.settings.color.system][2],
    LOCATION        = lib.color[gardenlog.settings.color.location][2],
    RANK            = lib.color[gardenlog.settings.color.rank][2],
    SLOT            = lib.color[gardenlog.settings.color.slot][2],
    ITEM_ID         = lib.color[gardenlog.settings.color.item_id][2],
    ITEM_NAME       = lib.color[gardenlog.settings.color.item_name][2],
    SEED            = lib.color[gardenlog.settings.color.seed][2],
    SEED_NAME       = lib.color[gardenlog.settings.color.seed_name][2],
    FERTILIZER      = lib.color[gardenlog.settings.color.fertilizer][2],
    FERTILIZER_NAME = lib.color[gardenlog.settings.color.fertilizer_name][2],
    NODE            = lib.color[gardenlog.settings.color.node][2],
  }

  ---------------------------------------------------------------------------------
  -- VARIABLES AND TEMPLATES
  ---------------------------------------------------------------------------------

  gardenlog.vars = {}
  gardenlog.vars.my_name = windower.ffxi.get_player().name
  gardenlog.vars.show_box = gardenlog.settings.show_box
  
  gardenlog.vars.current_zone = 0
  gardenlog.vars.in_garden = false
  gardenlog.vars.location = ''
  gardenlog.vars.rank = 0
  gardenlog.vars.slot = 0
  gardenlog.vars.seed = ''
  gardenlog.vars.seed_name = 'None'
  gardenlog.vars.fertilizer = ''
  gardenlog.vars.fertilizer_name = 'None'
  gardenlog.vars.node = ''

  gardenlog.file = T{}
  gardenlog.file.capture = T{}
  gardenlog.file.simple = lib.fileOpen(gardenlog.settings.file_path.. gardenlog.vars.my_name ..'.log')

  gardenlog.template = {}
  gardenlog.template.ITEMS = ' ${location|%s} R:${rank|%d}'..  gardenlog.color.box.SYSTEM ..'${label_space|%s}[GL]\n'..
                             ' F: '..gardenlog.color.box.FERTILIZER.. '${fertilizer|%s} '..
                                     gardenlog.color.box.FERTILIZER_NAME.. '(${fertilizer_name|%s})\n'..
                                     '${items|%s}\n'
  gardenlog.template.ITEMS_GROVE_VEIN = ' ${location|%s} R:${rank|%d}'..  gardenlog.color.box.SYSTEM ..'${label_space|%s}[GL]\n'..
                                        ' N: '..gardenlog.color.box.NODE.. '${node|%s}\n'.. gardenlog.color.box.SYSTEM..
                                        ' F: '..gardenlog.color.box.FERTILIZER.. '${fertilizer|%s} '..
                                                gardenlog.color.box.FERTILIZER_NAME.. '(${fertilizer_name|%s})\n'..
                                        '${items|%s}\n'                            
  gardenlog.template.ITEMS_FURROW = ' ${location|%s} R:${rank|%d}'..  gardenlog.color.box.SYSTEM ..'${label_space|%s}[GL] \n'..
                                    ' S: '.. gardenlog.color.box.SEED ..'${seed|%s} '..
                                    gardenlog.color.box.SEED_NAME ..'(${seed_name|%s})'.. 
                                    gardenlog.color.box.SYSTEM .. ' + F: '..
                                    gardenlog.color.box.FERTILIZER.. '${fertilizer|%s} '..
                                    gardenlog.color.box.FERTILIZER_NAME.. '(${fertilizer_name|%s}) \n'..
                                    '${items|%s}\n'
  gardenlog.template.LOG = '{ location="%s", rank=%s, slot=%s, item_id=%s, item_name="%s", fertilizer_id=%s, fertilizer_name="%s"},\n'
  gardenlog.template.LOG_GROVE_VEIN = '{ location="%s", rank=%s, node=%s, slot=%s, item_id=%s, item_name="%s", fertilizer_id=%s, fertilizer_name="%s"},\n'
  gardenlog.template.LOG_FURROW = '{ location="%s", rank=%s, slot=%s, item_id=%s, item_name="%s", seed_id=%s, seed_name="%s", fertilizer_id=%s, fertilizer_name="%s"},\n'

  gardenlog.vars.boxes = {}
  gardenlog.vars.test_box_info = {
    [1] = {
      slot = '1',
      id = '12345',
      name = "Super Moogle Ball"
    }
  }

  lib.checkLibVer(gardenlog)
  
  ---------------------------------------------------------------------------------
  -- EVENTS
  ---------------------------------------------------------------------------------
  windower.register_event('zone change', function(new, old)
    gardenlog.setupZone(new, old)
  end)
  
  if not capture then
    windower.register_event('addon command', gardenlog.command)
  end
  
  windower.register_event('incoming chunk', gardenlog.checkChunk)
  gardenlog.setupZone(windower.ffxi.get_info().zone)
end

if not capture then
  gardenlog.settings = config.load(gardenlog.defaults)
  gardenlog.initialize()
else
  return gardenlog
end


