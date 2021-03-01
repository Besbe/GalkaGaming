
require('capture-lib')

actionview = actionview or {}
actionview.info = {
  name = 'ActionView',
  log_name = 'AView',
  box_name = 'AV',
  version = '007',
  date = '2020/05/18',
  lib_version = '006',
  author = 'ibm2431',
  commands = {'actionview','actview','aview'},
  key = 'actionview',
  folder = 'actionview/'
}

if not capture then
  _addon.name = actionview.info.name
  _addon.version = actionview.info.version
  _addon.date = actionview.info.date
  _addon.lib_version = actionview.info.lib_version
  _addon.author = actionview.info.author
  _addon.commands = actionview.info.commands
end

-- ------------------------------------------------------------------------------
-- DEFAULT USER SETTINGS
-- ------------------------------------------------------------------------------

actionview.defaults = T{}

actionview.defaults.mode = lib.mode.ACTIVE
actionview.defaults.file_path = 'data/actionview/'

actionview.defaults.show_box = true -- shows the actionview info box
actionview.defaults.auto_hide = true -- when an event finishes, auto-hide the box after 5 seconds
actionview.defaults.auto_hide_time = 4 -- the number of seconds before hiding the box after event
actionview.defaults.mobs_only = true

actionview.defaults.category = T{}
actionview.defaults.category[1]  = false
actionview.defaults.category[2]  = false
actionview.defaults.category[3]  = true
actionview.defaults.category[4]  = true
actionview.defaults.category[5]  = false
actionview.defaults.category[6]  = true
actionview.defaults.category[7]  = false
actionview.defaults.category[8]  = false
actionview.defaults.category[9]  = false
actionview.defaults.category[10] = false
actionview.defaults.category[11] = true
actionview.defaults.category[12] = false
actionview.defaults.category[13] = true
actionview.defaults.category[14] = true
actionview.defaults.category[15] = true

actionview.defaults.box = T{}
actionview.defaults.box.max_num = 3
actionview.defaults.box.spacing = 8
actionview.defaults.box.pos   = T{}
actionview.defaults.box.pos.x = 465
actionview.defaults.box.pos.y = 540
actionview.defaults.box.text       = {}
actionview.defaults.box.text.size  = 11
actionview.defaults.box.text.font  = 'Consolas'
actionview.defaults.box.text.alpha = 255
actionview.defaults.box.text.red   = 255
actionview.defaults.box.text.green = 255
actionview.defaults.box.text.blue  = 255

actionview.defaults.box.bg = T{}
actionview.defaults.box.bg.red   = 30
actionview.defaults.box.bg.green = 30
actionview.defaults.box.bg.blue  = 60
actionview.defaults.box.bg.alpha = 230

actionview.defaults.color = T{}
actionview.defaults.color.name      = 24 -- Red Lotus Blade
actionview.defaults.color.id        = 22 -- 34
actionview.defaults.color.actor     = 12 -- 01234567 (Name)
actionview.defaults.color.animation = 20 -- 3
actionview.defaults.color.category  = 11 -- 3
actionview.defaults.color.message   = 25 -- 185
actionview.defaults.color.system    = 19

---------------------------------------------------------------------------------
-- COMMANDS
---------------------------------------------------------------------------------
actionview.help_text = {
  ['capture'] = "Starts or stops a capture: start | stop",
  ['box_test'] = "Displays a test box. Call again to hide, and save setting.",
  ['color_test'] = "Displays the color codes used by the addon",
  ['mobs_only'] = "Limits action display to mobs: OFF | ON",
  ['mode'] = "Sets mode: OFF | INFO | PASSIVE | ACTIVE",
  ['save'] = "Immediately save pending database information",
  ['ver'] = "Shows addon (and library) version and date",
}

actionview.commands = {
  ['capture'] = function(args)
    lib.capture(actionview, args)
  end,
  ['color_test'] = function()
    lib.colorTest(actionview)
  end,
  ['box_test'] = function ()
    lib.testBox(actionview)
  end,
  ['ver'] = function()
    lib.displayVer(actionview)
  end,
  ['mobs_only'] = function(args)
    lib.setToggle(actionview, 'mobs_only', args[1])
  end,
  ['mode'] = function(args)
    lib.setMode(actionview, args[1])
  end,  
  ['help'] = function()
    lib.displayHelp(actionview)
  end,
  ['save'] = function()
    actionview.writeDatabases(actionview.vars.current_zone)
    coroutine.close(actionview.vars.scheduled_write_coroutine)
  end,
}

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Checks for a valid command and executes it
--------------------------------------------------
actionview.command = function(cmd, ...)
  lib.command(actionview, cmd, ...)
end

-- Handles writing an event to the info box
--------------------------------------------------
actionview.writeBox = function(info)
  box = texts.new(actionview.template.all, actionview.settings.box)
  texts.pos(box, actionview.vars.box_positions[1].x, actionview.vars.box_positions[1].y)
  
  box.actor = actionview.color.box.ACTOR.. info.actor
  box.name = actionview.color.box.NAME.. lib.padRight(info.name, 35)
  box.category = actionview.color.box.CATEGORY.. lib.padRight(actionview.template.category[info.category], 5)
  box.id = actionview.color.box.ID.. lib.padLeft(info.id, 5)
  if info.animation then
    box.animation = actionview.color.box.ANIMATION.. lib.padLeft(info.animation, 4)
  else
    box.animation = actionview.color.box.ANIMATION.. 'None'
  end
  
  if info.message then
    box.message = actionview.color.box.MESSAGE.. lib.padLeft(info.message, 3)
  else
    box.message = actionview.color.box.MESSAGE.. 'None'
  end
  
  return box
end

-- Builds a colorized chatlog string
--------------------------------------------------
actionview.buildChatlogString = function(info)
  local chatlog_string = actionview.h.name .. actionview.h.category .. '%s '..
                         actionview.h.id .. '%s '.. actionview.h.animation .. '%s '..
                         actionview.h.message .. '%s'
  return string.format(chatlog_string, info.name, info.category, info.id, info.animation, info.message)
end

-- Builds a simple string for file logging
--------------------------------------------------
actionview.buildSimpleString = function(info)
  local simple_info = '[Actor: %s (%s)] %s > Cat: %s ID: %s Anim: %s Msg: %s'
  return string.format(simple_info, info.actor, info.actor_name, info.name, info.category, info.id, info.animation, info.message)
end

-- Checks if a mob ID belongs to a "mob" based on the current zone
---------------------------------------------------------------------
actionview.isMob = function(id)
  return (id >= actionview.vars.zone_start) and (id <= actionview.vars.zone_end)
end

-- Handles displaying information for an action
---------------------------------------------------------------------
actionview.checkAction = function(action)
  if actionview.settings.mode > lib.mode.OFF and actionview.settings.category[action.category] then
    if (not actionview.settings.mobs_only) or actionview.isMob(action.actor_id) then
      local result, str_info = actionview.parseAction(action)
      if result and (result.message ~= 84) then
        if actionview.settings.mode ~= lib.mode.PASSIVE then
          lib.updateBox(actionview, str_info)
          lib.msg(actionview, actionview.buildChatlogString(str_info))
        end
        
        if actionview.settings.mode >= lib.mode.PASSIVE then
          actionview.recordAction(result, str_info)
        end
      end
    end
  end
end

-- Parses an action and returns the appropriate IDs and strings based on its category
---------------------------------------------------------------------
actionview.parseAction = function(action)
  local result = {}
  
  local categories = {
    [1] = function(action)  return 'Melee Attack' end,                                           -- Melee Attack
    [2] = function(action)  return 'Ranged Attack' end,                                          -- Ranged Attack execution
    [3] = function(action)                                                                       -- WS or some damaging JAs
      local message = action.targets[1].actions[1].message
      if action.param >= 257 then
        return res.monster_abilities[action.param].en
      elseif message == 317 or message == 324 then
        return res.job_abilities[action.param].en
      else
        return res.weapon_skills[action.param].en
      end
    end,
    [4] = function(action)                                                                      -- Casted magic
      local spell = res.spells[action.param]
      if spell then 
        return spell.en
      else
        return ''
      end
    end,
    [5] = function(action)  return res.items[action.param].en end,                               -- Item Usage execution
    [6] = function(action)                                                                       -- Most job abilities; can include monster abilities
      if actionview.isMob(action.actor_id) then
        return res.monster_abilities[action.param].en
      else
        return res.job_abilities[action.param].en
      end
    end,
    [7] = function(action)  return res.weapon_skills[action.targets[1].actions[1].param].en end, -- TP Move Start "Players: add 768, compare abils.xml. Mobs: -256, mabils.xml"
    [8] = function(action)  return res.spells[action.targets[1].actions[1].param].en end,        -- Spell Start
    [9] = function(action)  return res.items[action.targets[1].actions[1].param].en end,         -- Item Usage initiation
    [11] = function(action)                                                                      -- Mob TP moves
      local ability = res.monster_abilities[action.param]
      if ability then 
        return ability.en 
      else
        return ''
      end
    end,
    [12] = function(action) return 'Ranged Attack (Start)' end,                                  -- Ranged Attack initiation
    [13] = function(action) return res.job_abilities[action.param].en end,                       -- Pet TP Moves
    [14] = function(action) return res.job_abilities[action.param].en end,                       -- Non-blinkable job abilities (Jigs, Sambas, Steps, Waltzes, Flourish)
    [15] = function(action) return res.job_abilities[action.param].en end                        -- Some RUN job abilities
  }
  result.category = action.category
  result.actor = action.actor_id
  
  result.id = action.param
  if action.targets and action.targets[1] then
    if action.targets[1].actions and action.targets[1].actions[1] then
      result.message = action.targets[1].actions[1].message
      result.animation = action.targets[1].actions[1].animation
      if action.category == 8 then
        result.id = action.targets[1].actions[1].param
      end
    end
  end
  
  local str_info = {}
  for k, v in pairs(result) do
    str_info[k] = tostring(v)
  end

  local names = categories[action.category]
  if names then
    result.name = names(action)
    if not result.name then
      result.name = 'Unknown Ability'
    end
  else
    result.name = 'Unknown Ability'
  end
  str_info.name = result.name

  result.actor_name = ''
  local mob = windower.ffxi.get_mob_by_id(action.actor_id)
  if mob and mob.name then
    result.actor_name = mob.name
  end
  str_info.actor_name = result.actor_name
  
  return result, str_info
end

-- Inserts an action into a category DB
---------------------------------------------------------------------
actionview.addActionToCategory = function(db, result)
  local category_db = db.category[result.category]
 
  if not category_db then
    db.category[result.category] = {
      info = {},
      _meta = {
        key = result.category,
        num = 0,
        loaded_num = 0,
      },
    }
    category_db = db.category[result.category]
  end
  if not category_db.info[result.id] then
    category_db._meta.num = category_db._meta.num + 1
    category_db.info[result.id] = {info = result}
    return true
  end
  
  return false
end

-- Inserts an action into a zone mob DB
---------------------------------------------------------------------
actionview.addActionToMobList = function(db, result)
  local zone_db = db.zone[actionview.vars.current_zone]
  
  if not zone_db then
    db.zone[actionview.vars.current_zone] = {
      info = {},
      _meta = {
        key = actionview.vars.current_zone,
        num = 0,
        loaded_num = 0,
        parent = true,
      }
    }
    zone_db = db.zone[actionview.vars.current_zone]
  end

  local mob_key = result.actor_name ..'-'.. tostring(result.actor)
  local mob_db = zone_db.info[mob_key]
  if not mob_db then
    zone_db.info[mob_key] = {
      info = {},
      _meta = {
        key = mob_key,
        parent = true,
        num = 0
      }
    }
    mob_db = zone_db.info[mob_key]
  end

  local cat_db = mob_db.info[result.category]
  if not cat_db then
    mob_db.info[result.category] = {
      info = {},
      _meta = {
        key = result.category,
        num = 0,
        parent = true
      }
    }
    cat_db = mob_db.info[result.category]
  end

  if not cat_db.info[result.id] then
    cat_db.info[result.id] = {info = result}
    zone_db._meta.num = zone_db._meta.num + 1
    mob_db._meta.num = mob_db._meta.num + 1
    cat_db._meta.num = cat_db._meta.num + 1
    return true
  end
  
  return false
end

-- Logs the result of a parsed action into various internal tables and files
---------------------------------------------------------------------
actionview.recordAction = function(result, str_info)
  local new_ability = actionview.addActionToCategory(actionview.db.data, result)
  local new_mob_ability = actionview.addActionToMobList(actionview.db.data, result)

  local simple_string = actionview.buildSimpleString(str_info)
  lib.fileAppend(actionview.file.simple, simple_string .. "\n\n")

  if actionview.settings.mode == lib.mode.CAPTURE then
    new_ability = actionview.addActionToCategory(actionview.db.data.capture, result)
    new_mob_ability = actionview.addActionToMobList(actionview.db.data.capture, result)
    lib.fileAppend(actionview.file.capture.simple, simple_string .. "\n\n")
  end
  
  if new_ability or new_mob_ability then
    actionview.scheduleDatabaseWrite()
  end
end

-- Schedules a write to the zone and category databases
--------------------------------------------------
actionview.scheduleDatabaseWrite = function()
  if not actionview.vars.new_db_info then
    actionview.vars.new_db_info = true
  end
  if not actionview.vars.write_scheduled then
    actionview.vars.write_scheduled = true
    actionview.vars.scheduled_write_coroutine = coroutine.schedule(function() 
      actionview.writeDatabases(actionview.vars.current_zone)
    end, 30)
  end
end

-- Checks to see if the current zone table had new npcs
-- and if so, rewrites the zone and category databases
--------------------------------------------------
actionview.writeDatabases = function(zone_left)
  local had_new = false
  if actionview.vars.new_db_info then
    local zone_left_name = res.zones[zone_left].en
    local string_to_write = ''
    local old_zone_path = actionview.settings.file_path..'zone/'.. zone_left_name ..'.lua'
    actionview.file.old_zone = files.new(old_zone_path, true)
    
    if actionview.db.data.zone[zone_left]._meta.num > actionview.db.data.zone[zone_left]._meta.loaded_num then
      had_new = true
      actionview.db.data.zone[zone_left]._meta.parent = true
      lib.writeDatabase(actionview, actionview.db.data.zone, zone_left, actionview.file.old_zone)
      actionview.db.data.zone[zone_left]._meta.loaded_num = actionview.db.data.zone[zone_left]._meta.num 
    end
    
    -- Write the zone database for a capture
    if actionview.settings.mode == lib.mode.CAPTURE then
      local capture_zone_path = actionview.vars.capture_root..'zone/'.. zone_left_name ..'.lua'
      actionview.file.capture.old_zone = files.new(capture_zone_path, true)

      if actionview.db.data.capture.zone[zone_left]._meta.num > actionview.db.data.capture.zone[zone_left]._meta.loaded_num then
        had_new = true
        actionview.db.data.capture.zone[zone_left]._meta.parent = true
        lib.writeDatabase(actionview, actionview.db.data.capture.zone, zone_left, actionview.file.capture.old_zone)
        actionview.db.data.capture.zone[zone_left]._meta.loaded_num = actionview.db.data.capture.zone[zone_left]._meta.num 
      end
    end
    
    for i = 1, 15 do
      if actionview.db.data.category[i]._meta.num > actionview.db.data.category[i]._meta.loaded_num then
        had_new = true
        lib.writeDatabase(actionview, actionview.db.data.category, i, actionview.file.category[i])
        actionview.db.data.category[i]._meta.loaded_num = actionview.db.data.category[i]._meta.num
      end
      
      -- Write the category databases for a capture
      if actionview.settings.mode == lib.mode.CAPTURE then
        if actionview.db.data.capture.category[i]._meta.num > actionview.db.data.capture.category[i]._meta.loaded_num then
          had_new = true
          lib.writeDatabase(actionview, actionview.db.data.capture.category, i, actionview.file.capture.category[i])
          actionview.db.data.capture.category[i]._meta.loaded_num = actionview.db.data.category[i]._meta.num
        end
      end
    end
  end
  
  if actionview.settings.mode ~= lib.mode.PASSIVE then
    if had_new then
      lib.msg(actionview, 'Databases saved!')
    else
      lib.msg(actionview, 'No new information to write.')
    end
  end
  
  actionview.vars.write_scheduled = false
end

-- Prepares master databases for all action categories
--------------------------------------------------
actionview.prepareCategoryDatabases = function()
  actionview.file.category = {}
  actionview.file.capture.category = {}
  for i = 1, 15 do
    local path = actionview.settings.file_path.. 'category/'.. actionview.template.category[tostring(i)]
    actionview.file.category[i] = files.new(path .. '.lua', true)
    
    if actionview.file.category[i]:exists(path) then
      actionview.db.data.category[i] = lib.loadDatabase(path).info[i]
      actionview.db.data.category[i]._meta.loaded_num = actionview.db.data.category[i]._meta.num
    else
      actionview.db.data.category[i] = {
        info = {},
        _meta = {
          key = i,
          num = 0,
          loaded_num = 0,
          parent = true
        }
      }
    end
    
    -- Prepare category databases for a capture
    if actionview.settings.mode == lib.mode.CAPTURE then
      local capture_path = actionview.vars.capture_root.. 'category/'.. actionview.template.category[tostring(i)]
      actionview.file.capture.category[i] = files.new(capture_path .. '.lua', true)
      actionview.db.data.capture.category[i] = {
        info = {},
        _meta = {
          key = i,
          num = 0,
          loaded_num = 0,
          parent = true
        }
      }
    end
  end
end

-- Loads a zone database into memory
--------------------------------------------------
actionview.prepareZoneDatabase = function(zone)
  local current_zone = res.zones[zone].en
  local path = actionview.settings.file_path.. 'zone/'.. current_zone

  actionview.file.zone = files.new(path .. '.lua', true)
  if actionview.file.zone:exists(path) then
    actionview.db.data.zone[zone] = lib.loadDatabase(path).info[zone]
    actionview.db.data.zone[zone]._meta.loaded_num = actionview.db.data.zone[zone]._meta.num
  end
  
  if actionview.settings.mode == lib.mode.CAPTURE then
    local capture_path = actionview.vars.capture_root.. 'zone/'.. current_zone
    actionview.file.capture.zone = files.new(capture_path .. '.lua', true)
    if actionview.file.capture.zone:exists(path) then
      actionview.db.data.capture.zone[zone] = lib.loadDatabase(capture_path).info[zone]
      actionview.db.data.capture.zone[zone]._meta.loaded_num = actionview.db.data.capture.zone[zone]._meta.num
    end
  end
end

-- Starts a capture
---------------------------------------------------------------------
actionview.startCapture = function(file_root)
  actionview.db.data.capture = {
    category = {
      _meta = {}
    },
    zone = {
      _meta = {
        num = 0,
        loaded_num = 0,
      }
    }
  }

  actionview.db.data.capture.zone._meta.format = actionview.db.format.ABILITY
  actionview.db.data.capture.category._meta.format = actionview.db.format.ABILITY
  actionview.prepareCategoryDatabases()
  actionview.setupZone(windower.ffxi.get_info().zone)
end

-- Stops a capture
---------------------------------------------------------------------
actionview.stopCapture = function()
--[[
  actionview.writeDatabases(actionview.vars.current_zone)
  coroutine.close(actionview.vars.scheduled_write_coroutine)
--]]
end

-- Sets up tables and files for use in the current zone
--------------------------------------------------
actionview.setupZone = function(zone)
  actionview.vars.current_zone = zone
  local current_zone = res.zones[zone].en
  actionview.prepareZoneDatabase(zone)

  actionview.vars.zone_start = bit.lshift(zone, 12) + 0x1000000
  actionview.vars.zone_end = actionview.vars.zone_start + 1024 -- Full block of NPCs and mobs
  
  actionview.file.simple = lib.fileOpen(actionview.settings.file_path..'simple/'.. current_zone ..'.log')
  
  if actionview.settings.mode == lib.mode.CAPTURE then
    actionview.file.capture.simple = lib.fileOpen(actionview.vars.capture_root ..'simple/'.. current_zone ..'.log')
  end
end

---------------------------------------------------------------------------------
-- INITIALIZE
---------------------------------------------------------------------------------
actionview.initialize = function()
  ---------------------------------------------------------------------------------
  -- DISPLAY COLORS AND LOG HEADERS
  ---------------------------------------------------------------------------------

  actionview.color = {}
  actionview.color.log = { -- Preformatted character codes for log colors.
    ID        = lib.color[actionview.settings.color.id][1],
    NAME      = lib.color[actionview.settings.color.name][1],
    ACTOR     = lib.color[actionview.settings.color.actor][1],
    ANIMATION = lib.color[actionview.settings.color.animation][1],
    CATEGORY  = lib.color[actionview.settings.color.category][1],
    MESSAGE   = lib.color[actionview.settings.color.message][1],
    SYSTEM    = lib.color[actionview.settings.color.system][1],
  }
  actionview.color.box = { -- \\cs(#,#,#) values for Windower text boxes
    ID        = lib.color[actionview.settings.color.id][2],
    NAME      = lib.color[actionview.settings.color.name][2],
    ACTOR     = lib.color[actionview.settings.color.actor][2],
    ANIMATION = lib.color[actionview.settings.color.animation][2],
    CATEGORY  = lib.color[actionview.settings.color.category][2],
    MESSAGE   = lib.color[actionview.settings.color.message][2],
    SYSTEM    = lib.color[actionview.settings.color.system][2],
  }

  actionview.h = { -- Headers for log string. ex: NPC:
    id    = actionview.color.log.SYSTEM .. 'ID: '  .. actionview.color.log.ID,
    name  = actionview.color.log.NAME .. '%s'.. actionview.color.log.SYSTEM .. ' > ',
    animation     = actionview.color.log.SYSTEM .. 'Anim: '.. actionview.color.log.ANIMATION,
    category      = actionview.color.log.SYSTEM .. 'Cat: ' .. actionview.color.log.CATEGORY,
    message       = actionview.color.log.SYSTEM .. 'Msg: ' .. actionview.color.log.MESSAGE,
  }

  ---------------------------------------------------------------------------------
  -- VARIABLES AND TEMPLATES
  ---------------------------------------------------------------------------------

  actionview.template = {
    all = ' ${name|%s} '.. actionview.color.box.SYSTEM .. ' [AV]\n'..
          actionview.color.box.SYSTEM ..' Actor: ${actor|%s}\n'..
          actionview.color.box.SYSTEM ..' C: ${category|%s}'..
          actionview.color.box.SYSTEM ..' ID: ${id|%s}'.. 
          actionview.color.box.SYSTEM ..'  Anim: ${animation|%s}'..
          actionview.color.box.SYSTEM ..'  Msg: ${message|%s}',
    category = {
      ['1']  = 'Melee', -- Melee Attack
      ['2']  = 'RA',    -- Ranged Attack execution
      ['3']  = 'WS-JA', -- WS or some damaging JAs; "ability IDs are unshifted, WS IDs shifted to +768"
      ['4']  = 'MA',    -- Casted magic
      ['5']  = 'Item',  -- Item Usage execution
      ['6']  = 'JA',    -- Most job abilities
      ['7']  = 'TP-St', -- TP Move Start "Players: add 768, compare abils.xml. Mobs: -256, mabils.xml"
      ['8']  = 'MA-St', -- Spell Start
      ['9']  = 'Itm-S', -- Item Usage initiation
      ['10'] = 'Unkwn', -- Unknown category
      ['11'] = 'Mb-TP', -- Mob TP moves
      ['12'] = 'RA-St', -- Ranged Attack initiation
      ['13'] = 'Pt-TP', -- Pet TP Moves
      ['14'] = 'Nb-JA', -- Non-blinkable job abilities (Jigs, Sambas, Steps, Waltzes, Flourish)
      ['15'] = 'RN-JA'  -- Some RUN job abilities
    }
  }

  actionview.vars = {}
  actionview.vars.my_name = windower.ffxi.get_player().name

  actionview.vars.show_box = actionview.settings.show_box
  -- I really should not have to do this, but assigning box positions based off
  -- of settings.box.pos.y directly will cause settings.box.pos.y to CHANGE
  -- when I move a box that was previously assigned in that y position.
  actionview.vars.initial_x = actionview.settings.box.pos.x
  actionview.vars.initial_y = actionview.settings.box.pos.y
  actionview.vars.in_event = false
  actionview.vars.hide_ticking = false
  actionview.vars.color_testing = false

  actionview.vars.box_positions = {
    [1] = {x = actionview.vars.initial_x, y = actionview.vars.initial_y}
  }
  for i = 2, 10 do
    actionview.vars.box_positions[i] = {
      x = actionview.vars.initial_x,
      y = actionview.vars.initial_y - (((actionview.settings.box.text.size + actionview.settings.box.spacing) * 4) * (i - 1))
    }
  end

  actionview.vars.boxes = {}
  actionview.vars.test_box_info = {
    category = '7',
    id = '1234',
    name = 'Moogle\'s Supernova Explosion',
    actor = '12345678 (Test Moogle)',
    animation = '1234',
    message = '123'
  }

  actionview.db = {}
  actionview.db.data = {
    category = {
      _meta = {}
    },
    zone = {
      _meta = {}
    }
  }
  actionview.db.format = {
    ['ABILITY'] = {
      _key = {field = 'id', type = '%d', width = 4},
      _num = 5,
      [1] = {ord = 1, field = 'name',      type = '%s', width = 30},
      [2] = {ord = 2, field = 'category',  type = '%d', width =  2},
      [3] = {ord = 3, field = 'id',        type = '%d', width =  4},
      [4] = {ord = 4, field = 'animation', type = '%d', width =  4},
      [5] = {ord = 5, field = 'message',   type = '%d', width =  3},
    }
  }

  actionview.file = T{}
  actionview.file.capture = T{}
  actionview.file.simple = lib.fileOpen(actionview.settings.file_path.. actionview.vars.my_name ..'/logs/simple.log')

  lib.checkLibVer(actionview)
  lib.formatDatabaseStrings(actionview)
  actionview.db.data.zone._meta.format = actionview.db.format.ABILITY
  actionview.db.data.category._meta.format = actionview.db.format.ABILITY
  actionview.prepareCategoryDatabases()
  
  windower.register_event('zone change', function(new, old) actionview.setupZone(new) end)
  windower.register_event('action', actionview.checkAction)
  if not capture then
    windower.register_event('addon command', actionview.command)
  end
  actionview.setupZone(windower.ffxi.get_info().zone)
end

if not capture then
  actionview.settings = config.load(actionview.defaults)
  actionview.initialize()
else
  return actionview
end

