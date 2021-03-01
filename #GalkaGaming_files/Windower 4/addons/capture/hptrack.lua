require('capture-lib')

hptrack = hptrack or {}
hptrack.info = {
  name = 'HPTrack',
  log_name = 'HPT',
  box_name = 'HPT',
  version = '003',
  date = '2020/12/27',
  lib_version = '006',
  author = 'ibm2431',
  commands = {'hptrack','hpt'},
  key = 'hptrack',
  folder = 'hptrack/'
}

if not capture then
  _addon.name = hptrack.info.name
  _addon.version = hptrack.info.version
  _addon.date = hptrack.info.date
  _addon.lib_version = hptrack.info.lib_version
  _addon.author = hptrack.info.author
  _addon.commands = hptrack.info.commands
end

-- ------------------------------------------------------------------------------
-- DEFAULT USER SETTINGS
-- ------------------------------------------------------------------------------

hptrack.defaults = T{}

hptrack.defaults.mode = lib.mode.ACTIVE
hptrack.defaults.file_path = 'data/hptrack/'

hptrack.defaults.color = T{}
hptrack.defaults.color.system    = 19

hptrack.settings = {}

---------------------------------------------------------------------------------
-- COMMANDS
---------------------------------------------------------------------------------
hptrack.help_text = {
  ['mode']            = "Sets mode: OFF | INFO | PASSIVE | ACTIVE",
  ['ver']             = "Shows addon (and library) version and date",
}

hptrack.commands = {
  ['help'] = function()
    lib.displayHelp(hptrack)
  end,
  ['mode'] = function(args)
    lib.setMode(hptrack, args[1])
  end,  
  ['ver'] = function()
    lib.displayVer(hptrack)
  end,
}

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Checks for a valid command and executes it
--------------------------------------------------
hptrack.command = function(cmd, ...)
  lib.command(hptrack, cmd, ...)
end

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Processes a death _after_ we receive a defeated the X message.
---------------------------------------------------------------------
hptrack.processDeath = function(mob_id)
  local mob = hptrack.getMob(mob_id)
  mob.min_hp = mob.total_damage - mob.damage + 1
  mob.max_hp = mob.total_damage
  mob.method = 'I'
  local estimated_hp = hptrack.calculateIntervals(mob)
  if ((not estimated_hp) or (estimated_hp < mob.min_hp) or (estimated_hp > mob.max_hp)) and (mob.min_hp > 1) then
    mob.method = 'L'
    estimated_hp = math.floor(((mob.min_hp - 1) / (mob.starting_hpp - mob.hpp)) * 100)
  end
  
  local log_string = "[HP Track] Killed " .. mob.id .. " (".. mob.name .."): "
  log_string = log_string .. mob.min_hp .. "~" .. mob.max_hp .. "HP"
  if estimated_hp and (estimated_hp >= mob.min_hp and estimated_hp <= mob.max_hp) then
    log_string = log_string .. ", Est.HP: ".. estimated_hp .. " (Mthd: ".. mob.method.. ")"
  end
  
  if hptrack.settings.mode ~= lib.mode.PASSIVE then
    windower.add_to_chat(7, log_string)
  end
  
  if hptrack.settings.mode >= lib.mode.PASSIVE then
    lib.fileAppend(hptrack.file.simple, log_string .. "\n\n")
    
    if hptrack.settings.mode == lib.mode.CAPTURE then
      lib.fileAppend(hptrack.file.capture.simple, log_string .. "\n\n")
    end
  end
end

-- Parses an action and returns the appropriate mobs that were damaged
---------------------------------------------------------------------
hptrack.parseAction = function(action)
  local test = function(action)
    local result = {}
    for _, target in pairs(action.targets) do
      local mob_id = target.id
      result[mob_id] = {
        dmg = 0
      }
      for i, effect in pairs(target.actions) do
        local msg = hptrack.msg_types[action.category][effect.message]
        if msg and effect.param then
          result[mob_id].msg_type = msg[1]
          if msg[2] ~= 0 then
            result[mob_id].dmg = result[mob_id].dmg + (effect.param * msg[2])
          end
        end
        
        local add_effect_message = effect.add_effect_message
        --[[
        if add_effect_message then
          add_effect_message = hptrack.add_effect_types[action.category][add_effect_message]
          if add_effect_message then
            result[mob_id].dmg = result[mob_id].dmg + (effect.param * add_effect_message[2])
          end
        end
        --]]
        
        --[[
        result[mob_id] = { msg_type = hptrack.msg_types[1][effect.message]}
        if effect.message ~= 15 then
          result[mob_id].dmg = effect.param
        else -- Missed
          result[mob_id].dmg = 0
        end
        --]]
        
        if effect.spike_effect_param then
          if not result[action.actor_id] then
            result[action.actor_id] = {
              msg_type = 'Spikes / Counter',
              dmg = effect.spike_effect_param
            }
          else
            result[action.actor_id].dmg = result[action.actor_id].dmg + effect.spike_effect_param
          end
        end
        
        
      end
    end
    return result
  end
  if hptrack.msg_types[action.category] then
    local result = test(action)
    if result then
      for mob_id, r in pairs(result) do
        if r.dmg ~= 0 then
          hptrack.dealDamage(mob_id, r.dmg)
        end
      end
      return result
    end
  elseif action.message == 6 then
    local mob_id = action['Target']
    hpTrack.processDeath(mob_id)
  end
end

-- Ensures a mob entry exists, and if not, initiates one.
-- Returns the mob's entry in either case.
--------------------------------------------------
hptrack.getMob = function(id)
  if not hptrack.db.mobs[id] then
    local mob = windower.ffxi.get_mob_by_id(id)
    if mob then
      hptrack.db.mobs[id] = {
        ['id'] = id,
        ['intervals'] = {},
        ['total_damage'] = 0,
        ['process_damage'] = {},
        ['processing_hpp'] = {},
        ['hpp'] = mob.hpp,
        ['last_hpp'] = mob.hpp,
        ['starting_hpp'] = mob.hpp,
        ['name'] = mob.name,
        ['buffered_damage'] = 0,
        ['buffered_gap'] = 0,
      }
    end
  end
  return hptrack.db.mobs[id]
end

-- Queue damage sources to be processed.
-- Since multiple sources of damage can occur before a HPP updated
-- occurs, we need to process them in batches
--------------------------------------------------
function hptrack.dealDamage(id, damage)
  local mob = hptrack.getMob(id)

  mob.damage = damage
  mob.total_damage = mob.total_damage + damage
  if mob.update_first and mob.hpp > 0 then
    -- The mob's new HPP came before this damage packet did
    mob.buffered_damage = mob.buffered_damage + damage
    hptrack.processDamage(mob)
  else
    -- We haven't received the HPP update for this damage yet
    mob.damage_first = true
    mob.buffered_damage = mob.buffered_damage + damage
  end
end

-- Handles combining action packets with HPP update packets
--------------------------------------------------
hptrack.processDamage = function(mob)
  local percent_gap = mob.buffered_gap
  if mob.hpp > 0 then
    if percent_gap > 1 then
      local new_interval_slice = {
        ['percent_gap'] = percent_gap,
        ['damage'] = mob.buffered_damage
      }
      table.insert(mob.intervals, new_interval_slice)
      mob.buffered_damage = 0
      mob.buffered_gap = 0
      mob.update_first = false
      mob.damage_first = false
    end
    --[[
    local running_hpp = mob.starting_hpp - mob.hpp
    if running_hpp > 1 then
      local running_interval_slice = {
        ['percent_gap'] = running_hpp,
        ['damage'] = mob.total_damage
      }
      table.insert(mob.intervals, running_interval_slice)
    end
    --]]
  end
end

-- Determines the estimated HP per percent
--------------------------------------------------
function hptrack.calculateIntervals(mob)
  local total_hpp_values = 0
  local total_intervals = 0
  local one_hpp = 0
  local total_dmgs = 0
  local total_hpps = 0
  for _, interval in ipairs(mob.intervals) do
    total_intervals = total_intervals + 1
    
    --one_hpp = interval.damage / interval.percent_gap
    --total_hpp_values = total_hpp_values + one_hpp

    total_dmgs = total_dmgs + interval.damage
    total_hpps = total_hpps + interval.percent_gap
  end
  if total_intervals > 0 then
    -- return math.floor((total_hpp_values / total_intervals) * 100)
    return math.floor((total_dmgs / total_hpps) * 100)
  else
    return false
  end
end

-- Inserts HP data into a database
---------------------------------------------------------------------
hptrack.addHPToMobList = function(db, mob)
  local zone_db = db.zone[hptrack.vars.current_zone]
  local mob_id = mob.id
  local mob_name = mob.name:gsub("(['\"\\])", "\\%1")
  if not zone_db then
    db.zone[hptrack.vars.current_zone] = {
      info = {},
      _meta = {
        key = hptrack.vars.current_zone,
        num = 0,
        loaded_num = 0,
        parent = true,
      }
    }
    zone_db = db.zone[hptrack.vars.current_zone]
  end

  local group_db = zone_db.info[mob_name]
  if not group_db then
    zone_db.info[mob_name] = {
      info = {},
      _meta = {
        key = mob_name,
        parent = true,
        num = 0
      }
    }
    group_db = zone_db.info[mob_name]
  end

  local mob_db = group_db.info[mob_id]
  if not mob_db then
    group_db.info[mob_id] = {
      info = {},
      _meta = {
        key = mob_id,
        num = 0,
        parent = true
      }
    }
    mob_db = group_db.info[mob_id]
  end

  local hp_hash = tostring(mob.min) .. '-'.. tostring(mob.max)
  if not mob_db.info[hp_hash] then
    mob_db.info[hp_hash] = {info = mob}
    zone_db._meta.num = zone_db._meta.num + 1
    group_db._meta.num = group_db._meta.num + 1
    mob_db._meta.num = mob_db._meta.num + 1
    return true
  end
  
  return false
end

-- Sets up tables and files for use in the current zone
--------------------------------------------------
function hptrack.setupZone(zone, zone_left)
  local zone_name = res.zones[zone].en
  
  hptrack.file.simple = lib.fileOpen(hptrack.settings.file_path..'simple/'.. zone_name ..'.log')
  
  if hptrack.settings.mode == lib.mode.CAPTURE then
    hptrack.file.capture.simple = lib.fileOpen(hptrack.vars.capture_root ..'simple/'.. zone_name ..'.log')
  end
end

-- Checks an incoming chunk for a spawn packet
------------------------------------------------
function hptrack.checkChunk(id, data, modified, injected, blocked)
  if id == 0x00E then
    local packet = packets.parse('incoming', data)
    local mask = packet['Mask']
    if mask == 7 then
      local mob = hptrack.getMob(packet['NPC'])
      local packet_hpp = packet['HP %']
      
      if mob and mob.hpp and packet_hpp > 0 then
        mob.last_hpp = mob.hpp
        mob.hpp = packet_hpp
        mob.buffered_gap = mob.buffered_gap + (mob.last_hpp - mob.hpp)
        if mob.damage_first then
          -- The action packet came before this update packet, so we
          -- can go ahead and process the Damage/HP% interval
          hptrack.processDamage(mob)
        else
          -- This update packet is coming before the damage, we want to
          -- buffer the very next damage to be applied to this new hpp loss
          mob.update_first = true
        end
      end
    end
  elseif (id == 0x029) then -- Action Message Packet (Not to be confused with an Action)
    local action_message = packets.parse('incoming', data)
    if (action_message['Message'] == 6) then -- Mob defeated
      local defeated_id = action_message['Target']
      hptrack.processDeath(defeated_id)
      hptrack.db.mobs[defeated_id] = nil
    end
  end
end

-- Starts logging to a new log file
---------------------------------------------------------------------
hptrack.startCapture = function()
  hptrack.setupZone(windower.ffxi.get_info().zone)
end

-- Stops logging to a capture file
---------------------------------------------------------------------
hptrack.stopCapture = function()
  -- Stubbed
end

---------------------------------------------------------------------------------
-- INITIALIZE
---------------------------------------------------------------------------------
hptrack.initialize = function()
  ---------------------------------------------------------------------------------
  -- DISPLAY COLORS AND LOG HEADERS
  ---------------------------------------------------------------------------------

  hptrack.color = {}
  hptrack.color.log = { -- Preformatted character codes for log colors.
    SYSTEM       = lib.color[hptrack.settings.color.system][1],
  }
  hptrack.color.box = { -- \\cs(#,#,#) values for Windower text boxes
    SYSTEM       = lib.color[hptrack.settings.color.system][2],
  }

  ---------------------------------------------------------------------------------
  -- VARIABLES AND TEMPLATES
  ---------------------------------------------------------------------------------

  hptrack.vars = {}
  hptrack.vars.my_name = windower.ffxi.get_player().name
  hptrack.db = {}
  hptrack.db.mobs = {}
  hptrack.vars.current_zone = 0

  hptrack.msg_types = {
    [1] = {
      [1] = {'Melee Attack', 1},
      [15] = {'(Miss) Melee Attack', 0},
      [67] = {'Melee Attack (Crit)', 1},
      
    },
    [2] = {
      [352] = {'Ranged Attack', 1},
      [353] = {'Ranged Attack (Crit)', 1},
      [354] = {'(Miss) Ranged Attack', 0},
      [576] = {'Ranged Attack (Squarely)', 1},
      [577] = {'Ranged Attack (Truestrike)', 1},
    },
    [3] = {
      [102] = {'JA (Recover)', -1},
      [103] = {'WS (Recover', -1},
      --[135] = {'WS', 1},
      --[142] = {'WS (Stat Down)', 1},
      --[159] = {'WS (Status Recover)', -1},
      [185] = {'WS', 1},
      --[186] = {'WS (Stat Down)', 1},
      [187] = {'WS (HP Drain)', 1},
      [188] = {'(Miss) WS', 0},
      [189] = {'WS (No Effect)', 0},
      --[194] = {'WS (Status)', 1},
      [197] = {'WS (Resisted)', 1},
      --[224] = {'WS (Recover MP)', -1},
      --[225] = {'WS (MP Drain)', 1},
      --[226] = {'WS (TP Drain)', 1},
      [238] = {'WS (Recover)', -1},
      [263] = {'AOE (Recovery)', -1},
      [264] = {'AOE Damage', 1},
      [317] = {'JA Hit', 1},
      [318] = {'JA (Recover)', -1},
      [323] = {'JA (No Effect)', 0},
      [324] = {'(Miss) JA', 0},
      [379] = {'JA (Magic Burst)', 1},
      [539] = {'WS (Recover)', -1},
    },
    [4] = {
      [2] = {'Magic Damage', 1},
      [7] = {'Magic (Recovery)', -1},
      [227] = {'Magic (Drain)', 1},
      [252] = {'Magic (Burst)', 1},
      [262] = {'Magic (Burst)', 1},
      [263] = {'AOE (Recovery)', -1},
      [264] = {'AOE Damage', 1},
      [274] = {'Magic (Burst Drain)', 1},
      [648] = {'Meteor', 1},
      [650] = {'Meteor (Burst)', 1},
      [651] = {'Meteor (Recover)', -1},
    },
    [6] = {
      [110] = {'Ability Dmg', 1},
      [263] = {'AOE (Recovery)', -1},
      [264] = {'AOE Damage', 1},
    }
  }
  
  hptrack.add_effect_types = {
    [3] = {
      [288] = {'SC: Light', 1},
      [289] = {'SC: Darkness', 1},
      [290] = {'SC: Gravitation', 1},
      [291] = {'SC: Fragmentation', 1},
      [292] = {'SC: Distortion', 1},
      [293] = {'SC: Fusion', 1},
      [294] = {'SC: Compression', 1},
      [295] = {'SC: Liquefaction', 1},
      [296] = {'SC: Induration', 1},
      [297] = {'SC: Reverberation', 1},
      [298] = {'SC: Transfixion', 1},
      [299] = {'SC: Scission', 1},
      [300] = {'SC: Detonation', 1},
      [301] = {'SC: Impaction', 1},
      [302] = {'SC: Cosmic Elucidation', 1},
      [767] = {'SC: Radiance', 1},
      [768] = {'SC: Umbra', 1},
    }
  }

  hptrack.file = T{}
  hptrack.file.capture = T{}
  hptrack.file.simple = lib.fileOpen(hptrack.settings.file_path.. hptrack.vars.my_name ..'/logs/simple.log')

  lib.checkLibVer(hptrack)
  
  ---------------------------------------------------------------------------------
  -- EVENTS
  ---------------------------------------------------------------------------------
  windower.register_event("action", function(action)
    local result = hptrack.parseAction(action)
  end)

  windower.register_event('zone change', function(new, old)
    hptrack.setupZone(new, old)
  end)
  
  if not capture then
    windower.register_event('addon command', hptrack.command)
  end
  
  windower.register_event('incoming chunk', hptrack.checkChunk)
  hptrack.setupZone(windower.ffxi.get_info().zone)
end

if not capture then
  hptrack.settings = config.load(hptrack.defaults)
  hptrack.initialize()
else
  return hptrack
end


