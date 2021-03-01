
require('capture-lib')

npcl = npcl or {}
npcl.info = {
  name = 'NPCLogger',
  log_name = 'NPCL',
  box_name = 'NPCL',
  version = '001',
  date = '2020/03/02',
  lib_version = '006',
  author = 'ibm2431',
  commands = {'npclogger', 'npcl'},
  key = 'npcl',
  folder = 'npclogger/'
}

if not capture then
  _addon.name = npcl.info.name
  _addon.version = npcl.info.version
  _addon.date = npcl.info.date
  _addon.lib_version = npcl.info.lib_version
  _addon.author = npcl.info.author
  _addon.commands = npcl.info.commands
end

-- ------------------------------------------------------------------------------
-- DEFAULT USER SETTINGS
-- ------------------------------------------------------------------------------

npcl.defaults = T{}

npcl.defaults.mode = lib.mode.ACTIVE
npcl.defaults.file_path = 'data/npclogger/'

npcl.defaults.verbosity = 1 -- when NPCL npcl.displays NPC notice to chatlog
                            -- 0: Never, 1: When NPC not in database, 2: When NPC first seen during session
npcl.defaults.widescan_verbosity = 1 -- bitmask of what widescan-related messages to npcl.display
                                     -- 0: Never, 1: New information captured, 2: No new information, 4: Widescanned
-- message_color, the chatlog color code that messages are npcl.displayed in
npcl.defaults.message_color = 7
npcl.defaults.remind_widescan = true -- npcl.displays a message a short time after a zone to remind to WS
npcl.defaults.auto_ws_mode = 1 -- 1: When seeing mob we lack WS for, 2: Auto-timed (30s)
npcl.defaults.show_bar = false -- shows the NPCL info bar

npcl.defaults.debug_box = T{}
npcl.defaults.debug_box.pos   = T{}
npcl.defaults.debug_box.pos.x = windower.get_windower_settings().x_res*1/3
npcl.defaults.debug_box.pos.y = windower.get_windower_settings().y_res-17
npcl.defaults.debug_box.text       = {}
npcl.defaults.debug_box.text.size  = 11
npcl.defaults.debug_box.text.font  = 'Consolas'
npcl.defaults.debug_box.text.alpha = 255
npcl.defaults.debug_box.text.red   = 255
npcl.defaults.debug_box.text.green = 255
npcl.defaults.debug_box.text.blue  = 255

npcl.defaults.debug_box.bg = T{}
npcl.defaults.debug_box.bg.red   = 30
npcl.defaults.debug_box.bg.green = 30
npcl.defaults.debug_box.bg.blue  = 60
npcl.defaults.debug_box.bg.alpha = 230

npcl.defaults.color = T{}
npcl.defaults.color.system    = 19

npcl.settings = {}

--[[
OLD COMPARISON FUNCTIONS, THESE WILL NEED TO BE HEAVILY REWRITTEN
--]]

--[[
-- Reads an NPC SQL file and loads their values into a Lua table
--------------------------------------------------
npcl.loadSqlIntoTable = function(zone)
  local id, name, polutils_name, r, x, y, z, flag, speed, speedsub, animation, animationsub, namevis, status, flags, look, name_prefix, required_expansion, widescan
  local npc_capture_string = "(%d+),(.*),(.*),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,']+),([^,']+),([^,']+),([^,]+),([^,']+),([^,]+),([^,]+)"
  local mob_capture_string = "(%d+),(.*),(.*),(%d+),([^,]+),([^,]+),([^,]+),(%d+)"
  
  local lines = files.readlines("data/".. npcl.vars.my_name .."/current_sql/".. zone ..".sql")
  local loaded_npc = {}
  local num_loaded_npcs = 1
  
  for _,v in pairs(lines) do
    if (v) then
      v = string.gsub(v, ",'", ",")
      v = string.gsub(v, "',", ",")
      loaded_npc = {}
      _, _, id, name, polutils_name, r, x, y, z, flag, speed, speedsub, animation, animationsub, namevis, status, flags, look, name_prefix, required_expansion, widescan = string.find(v, npc_capture_string)
      if flag then -- Is an NPC
        if (id) then
          loaded_npc['id'] = tonumber(id)
          loaded_npc['name'] = name
          loaded_npc['polutils_name'] = polutils_name
          loaded_npc['r'] = tonumber(r)
          loaded_npc['x'] = tonumber(x)
          loaded_npc['y'] = tonumber(y)
          loaded_npc['z'] = tonumber(z)
          loaded_npc['flag'] = tonumber(flag)
          loaded_npc['speed'] = speed
          loaded_npc['speedsub'] = speedsub
          loaded_npc['animation'] = tonumber(animation)
          loaded_npc['animationsub'] = tonumber(animationsub)
          loaded_npc['namevis'] = tonumber(namevis)
          loaded_npc['status'] = tonumber(status)
          loaded_npc['flags'] = tonumber(flags)
          loaded_npc['look'] = look
          loaded_npc['name_prefix'] = tonumber(name_prefix)
          loaded_npc['widescan'] = widescan
          loaded_npc['order'] = num_loaded_npcs
          npcl.vars.ordered_sql_ids[num_loaded_npcs] = tonumber(id)
          npcl.vars.loaded_sql_npcs[tonumber(id)] = loaded_npc
          num_loaded_npcs = num_loaded_npcs + 1
        end
      else -- Was a mob spawn.
        _, _, id, name, polutils_name, group, x, y, z, r = string.find(v, mob_capture_string)
        if (id) then
          loaded_npc['id'] = tonumber(id)
          loaded_npc['name'] = name
          loaded_npc['polutils_name'] = polutils_name
          loaded_npc['r'] = tonumber(r)
          loaded_npc['x'] = tonumber(x)
          loaded_npc['y'] = tonumber(y)
          loaded_npc['z'] = tonumber(z)
          loaded_npc['group'] = tonumber(group)
          npcl.vars.ordered_sql_ids[num_loaded_npcs] = tonumber(id)
          npcl.vars.loaded_sql_npcs[tonumber(id)] = loaded_npc
          num_loaded_npcs = num_loaded_npcs + 1
        end
      end
    end
  end
  npcl.vars.num_sql_npcs = num_loaded_npcs
end
--]]

--[[
-- Loads a table of NPC packets that NPC Logger logged itself.
--------------------------------------------------
npcl.loadNpcPacketTable = function(zone, into_main_table)
  local packet_table = {}
  if type(zone) == "string" then
    packet_table = require("data/".. npcl.vars.my_name .."/tables/".. zone)
  else
    packet_table = zone
  end
  packet_table = table.sort(packet_table)
  if (into_main_table) then
    for npc_id, npc_info in pairs(packet_table) do
      npcl.vars.logged_npcs[npc_id] = npc_info
      npcl.basic_npc_info[npc_id] = {}
      for field_name, field_value in pairs(npc_info) do
        npcl.basic_npc_info[npc_id][field_name] = field_value
      end
      if npc_info['look'] then
        npcl.vars.npc_looks[npc_id] = npc_info['look'] -- npc_looks has been removed
      end
      npcl.vars.npc_raw_names[npc_id] = npc_info['name']
      npcl.vars.npc_names[npc_id] = npc_info['polutils_name']
      npcl.vars.seen_masks[0x07][npc_id] = true
      npcl.vars.seen_masks[0x0F][npc_id] = true
      npcl.vars.seen_masks[0x57][npc_id] = true
      if npc_info['index'] then
        if not npcl.vars.index_info[npc_info.index] then
          npcl.vars.index_info = {
            id = npc_id,
            index = npc_info['index'],
          }
        else
          npcl.vars.index_info[npc_info.index].id = npc_id
        end
      end
    end
  else
    npcl.vars.loaded_table_npcs = packet_table
  end
end
--]]

--[[
-- Compares two NPC tables and returns false if there's no differences.
-- If there is a difference, will return the first one as a string.
--------------------------------------------------
npcl.compareNpcs = function(sql_npc, npclogger_npc)
  local changed = false
  local changes = ''
  local keys = {'polutils_name', 'x', 'y', 'z', 'animation', 'animationsub', 'status', 'flags', 'namevis', 'name_prefix', 'look'}
  -- A list of flags to avoid printing changes for if changing from one
  -- flag in the list to another in the list.
  local ignore_flags = S{1, 6, 7, 8, 14, 16, 21, 22, 29}
  for _,v in pairs(keys) do
    if v == 'look' and npclogger_npc[v] then
      npclogger_npc[v] = "0x".. string.rpad(npclogger_npc[v], "0", 40)
    end

    if sql_npc[v] and (sql_npc[v] ~= npclogger_npc[v]) then
      changes = changes .. "'".. v .."': ".. sql_npc[v] .." changed to ".. npclogger_npc[v] .. " "
      changed = true
    end
  end
  if sql_npc['flag'] and (sql_npc['flag'] ~= npclogger_npc['flag']) then
    if (changed) then
      changes = changes .. "'flag': ".. sql_npc['flag'] .." changed to ".. npclogger_npc['flag'] .. " "
    elseif (not (ignore_flags[sql_npc.flag] and ignore_flags[sql_npc.flag)) then
      changes = changes .. "'flag': ".. sql_npc['flag'] .." changed to ".. npclogger_npc['flag'] .. " "
      changed = true
    end
  end
  if (changed) then
    if (sql_npc['r'] ~= npclogger_npc['r']) then
      changes = changes .. "'r': ".. sql_npc['r'] .." changed to ".. npclogger_npc['r'] .. " "
    end
    return changes
  else
    return changed
  end
end

-- Compares two loaded NPC tables (from target SQL, and NPC Logger's table).
--------------------------------------------------
npcl.compareNpcTables = function(compress_id_start, compress_id_end, changes_only)
  local npc_comparison = ''
  local moved_id_key = ''
  local sql_line = ''
  local k = 0
  if (not (compress_id_start or compress_id_end)) then
    compress_id_start, compress_id_end = 0, 0
  end
  for i = 1, (npcl.vars.num_sql_npcs - 1) do -- Force traversing in current SQL list order.
    k = npcl.vars.ordered_sql_ids[i]
    v = npcl.vars.loaded_sql_npcs[k]
    if (npcl.vars.loaded_table_npcs[k]) then
      npc_comparison = npcl.compareNpcs(npcl.vars.loaded_sql_npcs[k], npcl.vars.loaded_table_npcs[k])
      if (npc_comparison) then
        if (not ((v['id'] >= compress_id_start) and (v['id'] <= compress_id_end))) then
          npcl.file.compare:append("CHANGED: ".. k .."; ".. npc_comparison .."\n")
        end
        if v['flag'] then -- Is NPC
          sql_line = npcl.makeNpcSqlInsertString(npcl.vars.loaded_table_npcs[k])
        else -- Is Mob
          sql_line = npcl.makeMobSqlInsertString(npcl.vars.loaded_table_npcs[k])
        end
        if not changes_only then
          npcl.file.compare:append(sql_line .."\n")
        end
      else
        -- print("VERIFIED: ".. k.."; ".. npcl.vars.loaded_sql_npcs[k]['name'])
      end
    else
      npcl.file.compare:append("NOT FOUND: ".. k .."\n")
      --print("NOT FOUND: ".. k)
    end
  end
  npcl.file.compare:append("NEW NPCS: \n")
  -- Yes, we have to go through the new NPCs twice. The first time
  -- is to sort a list of keys, because Lua can't key sort.
  for k,v in pairs(npcl.vars.loaded_table_npcs) do
    if (not npcl.vars.loaded_sql_npcs[k]) then
      table.insert(npcl.vars.new_npcs, k)
    end
  end
  table.sort(npcl.vars.new_npcs)
  for _,v in pairs(npcl.vars.new_npcs) do
    if npcl.vars.loaded_table_npcs[v]['flag'] then -- Is NPC
      sql_line = npcl.makeNpcSqlInsertString(npcl.vars.loaded_table_npcs[v], true)
    else -- Is Mob
      sql_line = npcl.makeMobSqlInsertString(npcl.vars.loaded_table_npcs[v], true)
    end
    npcl.file.compare:append(sql_line .."\n")
    --print("ADDED: ".. k .."; ".. npcl.vars.loaded_table_npcs[k]['name'])
  end
end
--]]
--[[
-- Takes an NPC table and outputs and appropriate input statement
--------------------------------------------------
npcl.makeNpcSqlInsertString = function(npc, new_npc)
  if (new_npc) then
    npc["look"] = "0x".. string.rpad(npc["look"], "0", 40)
  end
  local sql_line = string.format(
    "INSERT INTO `npc_list` VALUES (%d,'%s','%s',%d,%.3f,%.3f,%.3f,%d,%d,%d,%d,%d,%d,%d,%d,%s,%d,%s,%d);",
    npc["id"],
    npc['name']:gsub("(['\"\\])", "\\%1"):gsub("%s", "_"),
    npc['polutils_name']:gsub("(['\"\\])", "\\%1"),
    npc["r"],
    npc["x"],
    npc["y"],
    npc["z"],
    npc["flag"],
    npc["speed"],
    npc["speedsub"],
    npc["animation"],
    npc["animationsub"],
    npc["namevis"],
    npc["status"],
    npc["flags"],
    npc["look"],
    npc["name_prefix"],
    'null',
    0
  )
  return sql_line
end

-- Takes a mob table and outputs and appropriate input statement
--------------------------------------------------
npcl.makeMobSqlInsertString = function(npc, new_npc)
  if new_npc and npc["look"] then
    npc["look"] = "0x".. string.rpad(npc["look"], "0", 40)
  end
  if not npc["group"] then
    npc["group"] = 0
  end
  local sql_line = string.format(
    "INSERT INTO `npc_list` VALUES (%d,'%s','%s',%d,%.3f,%.3f,%.3f,%d);",
    npc["id"],
    npc["name"]:gsub("(['\"\\])", "\\%1"):gsub("%s", "_"),
    npc["group"],
    npc["x"],
    npc["y"],
    npc["z"],
    npc["r"]
  )
  return sql_line
end
--]]

---------------------------------------------------------------------------------
-- COMMANDS
---------------------------------------------------------------------------------
npcl.help_text = {
  ['always_widescan'] = "Auto-widescan in ALL zones: OFF | ON",
  ['aws']             = "Starts auto-widescan for the current zone (only)",
  ['capture']         = "Starts or stops a capture: start | stop",
  ['box_test']        = "Displays a test box. Call again to hide, and save setting.",
  ['color_test']      = "Displays the color codes used by the addon",
  ['info']            = "Toggles display of NPCL's info box",
  ['mobs_only']       = "Limits action display to mobs: OFF | ON",
  ['mode']            = "Sets mode: OFF | INFO | PASSIVE | ACTIVE",
  ['save']            = "Immediately save pending database information",
  ['sws']             = "Stops automatically widescanning for the current zone",
  ['ver']             = "Shows addon (and library) version and date",
  ['ws']              = "Manually injects an outgoing widescan packet"
}

npcl.commands = {
  ['always_widescan'] = function(args)
    if args[1] then
      if string.lower(args[1]) == 'on' then
        npcl.vars.auto_widescanning = true
        npcl.vars.always_widescan = true
        npcl.doWidescan()
        npcl.display("Always auto-widescanning! (Persists across zones; packets sent when normally impossible!)")
      elseif string.lower(args[1]) == 'off' then
        npcl.vars.always_widescan = false
        npcl.display("Always Widescan: OFF")
      else
        npcl.display("Usage: //npcl always_widescan on|off")
      end
    else
      npcl.display("Usage: //npcl always_widescan on|off")
    end
  end,
  ['autowide'] = function()
    if not npcl.vars.auto_widescanning then
      npcl.display("Auto Widescan: ON")
      npcl.vars.auto_widescanning = true
    else
      npcl.display("Auto Widescan is already ON")
    end
  end,
  ['capture'] = function(args)
    lib.capture(npcl, args)
  end,
  ['color_test'] = function()
    lib.colorTest(npcl)
  end,
  ['box_test'] = function ()
    lib.testBox(npcl)
  end,
  ['help'] = function()
    lib.displayHelp(npcl)
  end,
  ['info'] = function(args)
    lib.setToggle(npcl, 'show_bar', args[1])
    if npcl.settings.show_bar then
      npcl.vars.debug.box:show()
    else
      npcl.vars.debug.box:hide()
    end
  end,
  ['mode'] = function(args)
    lib.setMode(npcl, args[1])
  end,  
  ['save'] = function()
    npcl.writeZoneDatabase(npcl.vars.current_zone)
    coroutine.close(npcl.vars.scheduled_write_coroutine)
  end,
  ['stopwide'] = function()
    npcl.display("Auto Widescan: OFF")
    npcl.vars.auto_widescanning = false
  end,
  ['ver'] = function()
    lib.displayVer(npcl)
  end,
  ['widescan'] = function()
    npcl.doWidescan(true)
  end,
}
npcl.commands.ws            = npcl.commands.widescan
npcl.commands.auto_widescan = npcl.commands.autowide
npcl.commands.aws           = npcl.commands.autowide
npcl.commands.stop_widescan = npcl.commands.stopwide
npcl.commands.sws           = npcl.commands.stopwide

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Checks for a valid command and executes it
--------------------------------------------------
npcl.command = function(cmd, ...)
  lib.command(npcl, cmd, ...)
end

-- Fetches basic NPC information from the client
----------------------------------------------
npcl.getBasicNpcInfo = function(npc_id, raw_name, look, packet)
  local name = ''
  local polutils_name = ''

  local npc = {}
  if raw_name ~= '' then
    npc.raw_name = raw_name
  end
  
  npc.look = look
  
  local mob = windower.ffxi.get_mob_by_id(npc_id)
  if mob and mob.name ~= '' then
    npc.polutils_name = mob.name
  end

  if npc.raw_name then
    -- This is a named mob using a hard-set model.
    -- Example: A friendly goblin in town, or a door.
    npc.type = 'Simple NPC'
    npc.name = npc.raw_name
    if not npc.polutils_name then
      npc.polutils_name = ''
    end
  elseif npc.polutils_name and (not npc.raw_name) then
    -- This is a named NPC whose appearance could be replicated by
    -- players if they wore the same equipment as the NPC.
    -- Example: Arpevion, T.K.
    npc.type = 'Equipped NPC'
    npc.name = npc.polutils_name
  elseif not npc.raw_name then
    -- We can't trust Windower's Model field, so we'll determine
    -- what kind of NPC this is by looking at the width of our
    -- own looks field for the NPC that we recorded previously.
    -- A fully-equipped-type model is 20 bytes, or 40 characters.
    if (string.len(npc.look) == 40) then
      -- This is an NPC used strictly in a CS, but doesn't have
      -- its own special appearance like storyline NPCs, so
      -- its appearance is built via equipment.
      -- Example: Filler NPCs walking around town during a CS,
      -- or unnamed Royal Knights who guard the king.
      npc.type = 'CS NPC'
      npc.name = 'csnpc'
    else
      -- This is a completely unnamed mob with a simple appearance.
      -- It's probably a decoration of some kind.
      -- Example: The special decorations in towns during festivals.
      npc.type = 'Decoration'
      npc.name = 'blank'
    end
    npc.polutils_name = '     '
  end
  
  if not npc.name then
    npc.name = ''
  end
  
  npc.index = packet['Index']
  npc.x = packet['X']
  npc.y = packet['Z'] -- Windower and DSP have these axis swapped vs each other
  npc.z = packet['Y']
  npc.r = packet['Rotation']
  
  -- Check if a mob is scannable
  npc.scannable = npcl.scannable(npc)
  if not npc.scannable then
    npc.level = 'X'
    npc.widescan = {
      index = npc.index,
      seen = 'X',
      level = 'X'
    }
  end
  
  return npc
end

-- Given a NPC and basic info, writes the basic information to the NPC
----------------------------------------------
npcl.setBasicNpcInfo = function(npc, basic_info)
  npc.raw_name = basic_info.raw_name
  npc.name = basic_info.name
  npc.polutils_name = basic_info.polutils_name
  npc.type = basic_info.type
  npc.look = basic_info.look
  npc.index = basic_info.index
  npc.x = basic_info.x
  npc.y = basic_info.y
  npc.z = basic_info.z
  npc.r = basic_info.r
  npc.scannable = basic_info.scannable
  
  if not basic_info.scannable then
    npc.level = basic_info.level
    npc.widescan = basic_info.widescan
  end
end

-- Returns a string of an NPC's basic info, to be printed when logging
----------------------------------------------
npcl.basicNpcInfoString = function(npc)
  return string.format(
    "NPC ID: %d\n  Name: %s\n  POLUtils_Name: %s\n  Type: %s\n  XYZR: %.3f, %.3f, %.3f, %d\n",
    npc.id,
    npc.name,
    npc.polutils_name,
    npc.type,
    npc.x,
    npc.y,
    npc.z,
    npc.r
  )
end

-- Builds string for raw logging
--------------------------------------------------
npcl.formatLogRaw = function(npc, mask, data)
  local info_string = npcl.basicNpcInfoString(npc)
  local hex_data = data:hexformat_file()
  local mask = string.lpad(mask:binary(), "0", 8)
  local log_string = '%s  Mask: %s\n%s\n':format(info_string, mask, hex_data)
  
  return log_string
end

-- Logs original packet data for an NPC into table
--------------------------------------------------
npcl.formatLogPacketToTable = function(npc, data)
  local log_string = ''
  
  log_string = log_string .. "    [".. tostring(npc.id) .."] = {"
  log_string = log_string .. string.format(
    "['id']=%d, ['name']=\"%s\", ['polutils_name']=\"%s\", ['type']=\"%s\", ['index']=%d, ['x']=%.3f, ['y']=%.3f, ['z']=%.3f, ['r']=%d, ['flag']=%d, ['speed']=%d, ['speedsub']=%d, ['animation']=%d, ['animationsub']=%d, ['namevis']=%d, ['status']=%d, ['flags']=%d, ['name_prefix']=%d, ['look']=\"%s\", ",
    npc.id,
    npc.name:gsub("(['\"\\])", "\\%1"):gsub("%s", "_"),
    npc.polutils_name:gsub("(['\"\\])", "\\%1"),
    npc.type,
    npc.index,
    npc.x,
    npc.y,
    npc.z,
    npc.r,
    npc.flag,
    npc.speed,
    npc.speedsub,
    npc.animation,
    npc.animationsub,
    npc.namevis,
    npc.status,
    npc.flags,
    npc.name_prefix,
    npc.look
  )
  log_string = log_string .. "['raw_packet']=\"".. data:hex() .."\""
  log_string = log_string .. "},\n"
  
  return log_string
end

-- Logs an NPC to memory, writes raw packet, and writes lua table
--------------------------------------------------
npcl.logNpc = function(npc, mask, data)
  npc.raw_packet = data:hex()

  if npc and npc.polutils_name then
    local log_raw = npcl.formatLogRaw(npc, mask, data)
    local log_table = npcl.formatLogPacketToTable(npc, data)
    
    lib.fileAppend(npcl.file.full, log_raw)
    lib.fileAppend(npcl.file.packet_table, log_table)
    
    if npcl.settings.mode == lib.mode.CAPTURE then
      lib.fileAppend(npcl.file.capture.full, log_raw)
      lib.fileAppend(npcl.file.capture.packet_table, log_table)
    end
    
    if npc.widescan.level and npc.name and (not npc.widescan.seen) and npc.scannable then
      npc.widescan.seen = npc.widescan.level
      local widescan_string = npcl.formatWidescanInfo(npc)
      lib.fileAppend(npcl.file.widescan, widescan_string)
      
      if npcl.settings.mode == lib.mode.CAPTURE then
        lib.fileAppend(npcl.file.capture.widescan, widescan_string)
      end
    end

    if npcl.settings.verbosity > 0 then
      if npc.new then
        npcl.scheduleDatabaseWrite()
        npcl.display("New: " .. npc.id .. " (".. npc.name ..")")
      elseif npcl.settings.verbosity == 2 then
        npcl.display("Log: " .. npc.id .. " (".. npc.name ..")")
      end
    end
  end
end

-- Handles padding a field for a database entry
-- Padding amount taken from fields.padding[field],
-- String wrapping from fields.always_string[field]
--------------------------------------------------
npcl.padField = function(field, value)
  local padding = fields.padding[field]
  if fields.always_string[field] then
    return lib.padRight("['".. field .."']=\"".. value .. "\",", padding)
  else
    return lib.padRight("['".. field .."']=".. value .. ",", padding)
  end
end

-- Returns a string representing an NPC, with its level,
-- to be written to the database/zone.lua file.
--------------------------------------------------
npcl.formatDatabaseEntry = function(npc)
  local database_entry = ''
  
  database_entry = database_entry .. "    [".. tostring(npc['id']) .."] = {"
  database_entry = database_entry .. string.format(
    "['id']=%d, %s %s %s %s ",
    npc['id'],
    npcl.padField('name', npc['name']:gsub("(['\"\\])", "\\%1"):gsub("%s", "_")),
    npcl.padField('polutils_name', npc['polutils_name']:gsub("(['\"\\])", "\\%1")),
    npcl.padField('type', npc['type']),
    npcl.padField('index', npc['index'])
  )

  if not npc.level then
    database_entry = database_entry .. npcl.padField('level', "'?'")
  else
    if type(npc.level) == 'string' then
      database_entry = database_entry .. npcl.padField('level', "'".. npc.level .."'")
    else
      database_entry = database_entry .. npcl.padField('level', npc.level)
    end
  end
  
  database_entry = database_entry .. string.format(
    " %s %s %s %s %s %s %s %s %s %s %s %s %s %s ['raw_packet']=\"%s\",",
    npcl.padField('x', string.format("%.3f", npc['x'])),
    npcl.padField('y', string.format("%.3f",npc['y'])),
    npcl.padField('z', string.format("%.3f",npc['z'])),
    npcl.padField('r', npc['r']),
    npcl.padField('flag', npc['flag']),
    npcl.padField('speed', npc['speed']),
    npcl.padField('speedsub', npc['speedsub']),
    npcl.padField('animation', npc['animation']),
    npcl.padField('animationsub', npc['animationsub']),
    npcl.padField('namevis', npc['namevis']),
    npcl.padField('status', npc['status']),
    npcl.padField('flags', npc['flags']),
    npcl.padField('name_prefix', npc['name_prefix']),
    npcl.padField('look', npc['look']),
    npc['raw_packet']
  )
  database_entry = database_entry .. "},\n"
  return database_entry
end

-- Schedules a write to the zone database
--------------------------------------------------
npcl.scheduleDatabaseWrite = function()
  if not npcl.vars.new_npcs_seen then
    npcl.vars.new_npcs_seen = true
  end
  if not npcl.vars.write_scheduled then
    npcl.vars.write_scheduled = true
    npcl.vars.debug.save_time = os.clock() + 60
    npcl.vars.scheduled_write_coroutine = coroutine.schedule(function() npcl.writeZoneDatabase(npcl.vars.current_zone) end, 60)
  end
end

-- Checks to see if new information we have on a NPC is worth writing
--------------------------------------------------
npcl.shouldUpdate = function(memory_npc_info, file_npc_info)
  if not file_npc_info then
    return true
  elseif memory_npc_info.level and (file_npc_info.level ~= memory_npc_info.level) then
    return true
  end
  return false
end

-- Checks to see if the current zone table had new npcs
-- and if so, rewrites the entire zone's database
--------------------------------------------------
npcl.writeZoneDatabase = function(zone_left)
  local zone_left_name = res.zones[zone_left].en
  local string_to_write = ''
  local old_zone_path = npcl.settings.file_path.. 'database/'.. zone_left_name
  npcl.file.old_zone = files.new(old_zone_path ..'.lua', true)
  if npcl.vars.new_npcs_seen then
    local table_to_write = {}
    local sorted_npc_ids = {}
    
    -- First make sure any NPCs currently in the file aren't lost between instances
    -- of NPCL by inserting new NPCs we have into a write table based off 
    -- of what the database is /right now/ (ie: from other instance)
    local file_zone_database = npcl.loadDatabase(old_zone_path)
    local melded, updated_npcs = lib.meldDatabases(npcl.db.main.npc_info, file_zone_database, npcl.shouldUpdate)
    
    if updated_npcs > 0 then
      -- For the love of Altana, convert NPCL to use lib's nice database writing function
      -- Lua can't natively sort by key, so we need to build a sorted table of IDs first.
      for k, _ in pairs(melded) do
        table.insert(sorted_npc_ids, k)
      end
      table.sort(sorted_npc_ids) -- We now have a sorted table of keys...

      string_to_write = "local zone_database =\n{\n" -- Start up the table string.
      for _, id in ipairs(sorted_npc_ids) do
        -- Now we can use ipairs to guarantee the pairs are gone through in order.
        local npc = melded[id]
        if npc and npc['raw_packet'] then -- Make sure this wasn't an almost empty entry from Widescan.
          string_to_write = string_to_write .. npcl.formatDatabaseEntry(npc)
        end
      end
      string_to_write = string_to_write .. "}\nreturn zone_database"
      npcl.file.old_zone:write(string_to_write)
    end
    
    if npcl.settings.mode == lib.mode.CAPTURE then
      local capture_old_zone_path = npcl.vars.capture_root.. 'database/'.. zone_left_name
      npcl.file.capture.old_zone = files.new(capture_old_zone_path ..'.lua', true)
      local capture_zone_database = npcl.loadDatabase(capture_old_zone_path)
      local capture_melded, capture_updated_npcs = lib.meldDatabases(npcl.db.capture.npc_info, capture_zone_database, npcl.shouldUpdate)
      if capture_updated_npcs > 0 then
        sorted_npc_ids = {}
        -- For the love of Altana, convert NPCL to use lib's nice database writing function
        -- Lua can't natively sort by key, so we need to build a sorted table of IDs first.
        for k, _ in pairs(capture_melded) do
          table.insert(sorted_npc_ids, k)
        end
        table.sort(sorted_npc_ids) -- We now have a sorted table of keys...

        string_to_write = "local zone_database =\n{\n" -- Start up the table string.
        for _, id in ipairs(sorted_npc_ids) do
          -- Now we can use ipairs to guarantee the pairs are gone through in order.
          local npc = capture_melded[id]
          if npc and npc['raw_packet'] then -- Make sure this wasn't an almost empty entry from Widescan.
            string_to_write = string_to_write .. npcl.formatDatabaseEntry(npc)
          end
        end
        string_to_write = string_to_write .. "}\nreturn zone_database"
        npcl.file.capture.old_zone:write(string_to_write)
      end
      npcl.db.capture.npc_info = capture_melded
      updated_npcs = capture_updated_npcs
    end
    
    npcl.db.main.npc_info = melded
    
    if updated_npcs > 0 then
      npcl.display("New NPC information saved to database! (".. updated_npcs .." NPCs)")
    else
      npcl.display("No new NPC information to write!")
    end
    
    npcl.vars.new_npcs_seen = false
    npcl.vars.write_scheduled = false
  else
    npcl.display("No new information to write.")
	end
  npcl.vars.debug.save_time = 0
  npcl.vars.debug.box.save_time = npcl.vars.debug.save_time
end

-- Returns a copy of a NPCL database file, to be loaded as our memory
-------------------------------------------------- 
npcl.loadDatabase = function(path)
  local memory = {}
  local database = {}
  local npc_indexes = {}
  
  npcl.file.database = files.new(path ..'.lua', true)
  if npcl.file.database:exists(path ..'.lua') then
    package.loaded[path] = nil
    database = require(path)
    for id, npc in pairs(database) do
      memory[id] = {}
      for key, value in pairs(npc) do
        if key == 'npc_type' then
          memory[id]['type'] = value
        else
          memory[id][key] = value
        end
      end
      
      if npc.level and (npc.level ~= '?') then
        memory[id].widescan = {
          checked = true,
          seen = npc.level,
          level = npc.level
        }
      end
      if npc.index then
        npc_indexes[npc.index] = { id = id }
      end
    end
  end
  return memory, npc_indexes
end

-- Sets up tables and files for use in the current zone
--------------------------------------------------
npcl.setupZone = function(zone, zone_left)
  npcl.vars.current_zone = zone
  local zone_name = res.zones[zone].en
  npcl.file.packet_table = lib.fileOpen(npcl.settings.file_path.. npcl.vars.my_name ..'/tables/'.. zone_name ..'.lua')
  npcl.file.full         = lib.fileOpen(npcl.settings.file_path.. npcl.vars.my_name ..'/logs/'.. zone_name ..'.log')
  npcl.file.widescan     = lib.fileOpen(npcl.settings.file_path.. npcl.vars.my_name ..'/widescan/'.. zone_name ..'.log')
  
  if zone_left and npcl.vars.new_npcs_seen then
    npcl.writeZoneDatabase(zone_left)
  end
  
  npcl.db.main.npc_info, npcl.db.main.index_info = npcl.loadDatabase(npcl.settings.file_path.. 'database/'.. zone_name, zone)
  npcl.db.main.widescan.num_new = 0
  npcl.db.main.widescan.new = {}
  
  if npcl.settings.mode == lib.mode.CAPTURE then
    npcl.db.capture.npc_info, npcl.db.capture.index_info = npcl.loadDatabase(npcl.vars.capture_root.. 'database/'.. zone_name, zone)
    npcl.db.capture.widescan.num_new = 0
    npcl.db.capture.widescan.new = {}
    npcl.file.capture.packet_table = lib.fileOpen(npcl.vars.capture_root.. 'tables/'.. zone_name ..'.lua')
    npcl.file.capture.full         = lib.fileOpen(npcl.vars.capture_root.. 'logs/'.. zone_name ..'.log')
    npcl.file.capture.widescan     = lib.fileOpen(npcl.vars.capture_root.. 'widescan/'.. zone_name ..'.log')
  end
  
  npcl.vars.new_npcs_seen = false
  npcl.vars.write_scheduled = false
  
  if npcl.vars.auto_widescanning and not npcl.vars.always_widescan then
    npcl.vars.auto_widescanning = false
    --npcl.display("Auto Widescan: OFF")
  end
  
  if not npcl.vars.always_widescan and npcl.settings.remind_widescan then
    coroutine.schedule(
      function()
        if not npcl.vars.auto_widescanning then 
          npcl.display("Auto Widescan is OFF")
        end
      end, 15)
  end
end

-- Sends an outgoing widescan packet, manual is passed in as
-- true depending on if the user used //npcl ws
--------------------------------------------------
npcl.doWidescan = function(manual)
  if manual or npcl.vars.auto_widescanning then
    packets.inject(npcl.vars.widescan_packet)
    if bit.band(npcl.settings.widescan_verbosity, 4) >= 1 then
      npcl.display("Widescanned!")
    end
    npcl.vars.debug.ws_time = os.clock() + 10
    coroutine.schedule(function()
      npcl.vars.scan_scheduled = false
      local db = {}
      if npcl.settings.mode == lib.mode.CAPTURE then
        db = npcl.db.capture
      else
        db = npcl.db.main
      end
      if db.widescan.num_new > 0 then
        if bit.band(npcl.settings.widescan_verbosity, 1) >= 1 then
          npcl.display("New Widescan information! (".. db.widescan.num_new .." NPCs)")
        end
        npcl.scheduleDatabaseWrite()
        npcl.db.main.widescan.num_new = 0
        npcl.db.main.widescan.new = {}
        
        if npcl.settings.mode == lib.mode.CAPTURE then
          npcl.db.capture.widescan.num_new = 0
          npcl.db.capture.widescan.new = {}
        end
      else
        if bit.band(npcl.settings.widescan_verbosity, 2) >= 1 then
          npcl.display("No new Widescan information.")
        end
      end
      npcl.vars.debug.ws_time = 0
    end, 10) -- Enforce a 10s widescan cooldown
  end
  
  if not manual and npcl.vars.auto_widescanning and (npcl.settings.auto_ws_mode == 2) then
    npcl.vars.scan_scheduled = true
    npcl.vars.debug.ws_auto = 20
    coroutine.schedule(function()
      npcl.vars.debug.ws_auto = 0
      npcl.doWidescan()
    end, 20)
  end
end


-- Determines if an NPC would show up on widescan
--------------------------------------------------
npcl.scannable = function(npc)
  if npc['look'] == '00003400' then
    return false -- "Invisible model" NPCs, like ???, do not show on widescan
  end
  
  if (npc['polutils_name'] == 'NPC') or (npc['polutils_name'] == '     ') then
    return false -- Likewise, NPCs without real client names aren't intended to be on widescan
  end
  
  -- Fill this function out with more exclusion rules later
  
  return true
end

-- Prints a message to the chatlog
--------------------------------------------------
npcl.display = function(message)
  windower.add_to_chat(npcl.settings.message_color, "[NPCL] ".. message)
end

-- Handles a mob update packet
--------------------------------------------------
npcl.handleMobUpdate = function(data)
  local packet = packets.parse('incoming', data)

  local mask = packet['Mask']
  if npcl.db.main.seen_masks[mask] then -- Make sure this is an NPC update mask we care about, we can check either DB
    local npc_id = packet['NPC']
    
    local saw_mask = true
    local new_for = {}
    if npcl.settings.mode == lib.mode.CAPTURE then
      saw_mask = npcl.db.capture.seen_masks[mask][npc_id]
      new_for = npcl.db.capture
    else
      saw_mask = npcl.db.main.seen_masks[mask][npc_id]
      new_for = npcl.db.main
    end
    
    local raw_name = ''
    local npc = { id = npc_id }
    if not saw_mask then
      if packet['Name'] ~= '' and not npc.raw_name and (not (mask == 0x57)) then
        npc.raw_name = lib.handleNpcRawName(packet['Name']) -- Valid raw name we haven't seen yet is set.
        npc.name = npc.raw_name
        raw_name = npc.raw_name
      end
      if (mask == 0x57) or (mask == 0x0F) or (mask == 0x07) then
        npc.flag         = lib.byteStringToInt(string.sub(data:hex(), (0x18*2)+1, (0x1C*2)))
        npc.speed        = tonumber(string.sub(data:hex(), (0x1C*2)+1, (0x1D*2)), 16)
        npc.speedsub     = tonumber(string.sub(data:hex(), (0x1D*2)+1, (0x1E*2)), 16)
        npc.animation    = tonumber(string.sub(data:hex(), (0x1F*2)+1, (0x20*2)), 16)
        npc.animationsub = tonumber(string.sub(data:hex(), (0x2A*2)+1, (0x2B*2)), 16)
        npc.namevis      = tonumber(string.sub(data:hex(), (0x2B*2)+1, (0x2C*2)), 16)
        npc.status       = tonumber(string.sub(data:hex(), (0x20*2)+1, (0x21*2)), 16)
        npc.flags        = lib.byteStringToInt(string.sub(data:hex(), (0x21*2)+1, (0x25*2)))
        npc.name_prefix  = tonumber(string.sub(data:hex(), (0x27*2)+1, (0x28*2)), 16)

        local look = ''
        if mask == 0x57 then -- Equipped model.
          look = string.sub(data:hex(), (0x30*2)+1, (0x44*2))
        elseif (mask == 0x0F) or (mask == 0x07) then -- Basic/standard NPC model.
          look = string.sub(data:hex(), (0x30*2)+1, (0x34*2))
        end
        
        -- Cross link any previously encountered widescan information
        npc.index = packet['Index']
        local index_db = {}
        
        if npcl.settings.mode == lib.mode.CAPTURE then
          index_db = npcl.db.capture.index_info
        else
          index_db = npcl.db.main.index_info
        end
        
        if not index_db[npc.index] then
          index_db[npc.index] = {id = npc.id}
        end
        local index_info = index_db[npc.index]
  
        if index_info.level then
          npc.widescan = {
            id = npc.id,
            index = npc.index,
            level = index_info.level
          }
          npc.level = index_info.level
          index_info.id = npc.id
        elseif not npc.widescan then
          npc.widescan = {id = npc.id}
        end
        
        if (not new_for.npc_info[npc_id]) or (new_for.npc_info[npc_id] and (not new_for.npc_info[npc_id].polutils_name)) then
          coroutine.schedule(function()
            local basic_info = npcl.getBasicNpcInfo(npc_id, raw_name, look, packet)
            npcl.setBasicNpcInfo(new_for.npc_info[npc_id], basic_info)
            if npcl.settings.mode == lib.mode.CAPTURE then
              -- new_for is the capture db; we need to clone the basic information to the main DB
              npcl.setBasicNpcInfo(npcl.db.main.npc_info[npc_id], basic_info)
            end
          end, 2.4)
          coroutine.schedule(function()
            if npcl.vars.auto_widescanning and (npcl.settings.auto_ws_mode == 1) then
              if npc.scannable and (not npc.widescan.checked) then
                npc.widescan.checked = true
                if (not npc.widescan.seen) and (not npcl.vars.scan_scheduled) then
                  npcl.vars.scan_scheduled = true
                  npcl.doWidescan()
                end
              end
            end
          end, 3)
        end
        
        -- Add NPC to our main and capture databases
        if not npcl.db.main.npc_info[npc_id] then
          npcl.db.main.npc_info[npc_id] = npc
          npcl.db.main.npc_info[npc_id].new = true
        end
        npcl.db.main.seen_masks[mask][npc_id] = true
        
        if npcl.settings.mode == lib.mode.CAPTURE then
          if not npcl.db.capture.npc_info[npc_id] then
            npcl.db.capture.npc_info[npc_id] = npc
            npcl.db.capture.npc_info[npc_id].new = true
          end
          npcl.db.capture.seen_masks[mask][npc_id] = true
        end

        coroutine.schedule(function() npcl.logNpc(npc, packet['Mask'], data) end, 3.3)
      end
    end
  end
end

-- Writes a mob's widescan info to a table log
--------------------------------------------------
npcl.formatWidescanInfo = function(npc)
  local log_string = "    [".. tostring(npc.id) .."] = {"

  local level = npc.widescan.level
  if level and npc.name then
    log_string = log_string .. string.format(
      "['id']=%d, ['name']=\"%s\", ['index']=%d, ['level']=%d",
      npc.id,
      npc.name:gsub("(['\"\\])", "\\%1"):gsub("%s", "_"),
      npc.index,
      level
    )
    log_string = log_string .. "},\n"
  end
  return log_string
end

-- Handles an incoming widescan packet
--------------------------------------------------
npcl.handleWidescanUpdate = function(data)
  local packet = packets.parse('incoming', data)
  local index, name, level = packet["Index"], packet["Name"], packet["Level"]
  
  local db = {}
  if npcl.settings.mode == lib.mode.CAPTURE then
    db = npcl.db.capture
  else
    db = npcl.db.main
  end
  
  if not db.index_info[index] then
    db.index_info[index] = {}
  end
  local index_npc = db.index_info[index]
  
  if not name then -- We should fix DSP.
    name = ''
  end
  
  index_npc.index = index
  index_npc.level = level
  index_npc.name  = name
  
  local npc_id = index_npc.id
  if npc_id then
    local npc = db.npc_info[npc_id]
    
    if not npc.widescan then
      npc.widescan = { id = npc_id }
    end
    if not npc.widescan.seen then
      npc.widescan.index = index
      npc.widescan.name = name
      npc.widescan.id = npc_id

      if (not npc.level) or (npc.level ~= level) then
        npc.level = level
        if not db.widescan.new[npc_id] then
          db.widescan.new[npc_id] = true
          db.widescan.num_new = db.widescan.num_new + 1
          npcl.scheduleDatabaseWrite()
        end
      end
      npc.widescan.level = level
      npc.widescan.seen = level
      
      local widescan_string = npcl.formatWidescanInfo(npc)
      
      lib.fileAppend(npcl.file.widescan, widescan_string)
      if npcl.settings.mode == lib.mode.CAPTURE then
        lib.fileAppend(npcl.file.capture.widescan, widescan_string)
      end
    end
  end
end

-- Checks incoming chunks for NPC or widescan packets and handles them
--------------------------------------------------
npcl.checkChunk = function(id, data, modified, injected, blocked)
  if npcl.settings.mode ~= lib.mode.OFF then
    if id == 0x00E then
      npcl.handleMobUpdate(data)
    elseif (id == 0xF4) then
      npcl.handleWidescanUpdate(data)
    end
  end
end

-- The prerender event to run when capture calls a prerender
--------------------------------------------------
npcl.preRender = function()
  if npcl.settings.show_bar then
    if npcl.vars.debug.save_time > 0 then
      npcl.vars.debug.box.save_time = lib.padRight(tostring(((npcl.vars.debug.save_time - os.clock()) % 60):floor()), 2)
    end
    if npcl.vars.debug.ws_time > 0 then
      npcl.vars.debug.box.ws_time = lib.padRight(tostring(((npcl.vars.debug.ws_time - os.clock()) % 60):floor()), 2)
    end
    if npcl.vars.debug.ws_auto > 0 then
      npcl.vars.debug.box.ws_auto = lib.padRight(tostring(((npcl.vars.debug.ws_auto - os.clock()) % 60):floor()), 2)
    end
    
    if not info then
      local mob = windower.ffxi.get_mob_by_target('t')
      if mob and mob.id > 0 then
        local npc = nil
        if npcl.settings.mode == lib.mode.CAPTURE then
          npc = npcl.db.capture.npc_info[mob.id]
        else
          npc = npcl.db.main.npc_info[mob.id]
        end

        npcl.vars.debug.box.npc_id = '\\cs(100,255,100)'.. mob.id ..'\\cr'
        if npc and npc.widescan and npc.widescan.seen then
          npcl.vars.debug.box.npc_level = '\\cs(100,255,100)'.. lib.padRight(tostring(npc.widescan.seen), 3) ..'\\cr'
        else
          --if npc.widescan.checked then
            --npcl.vars.debug.box.npc_level = '\\cs(100,255,100)X  \\cr' -- Only use this if we know we checked when the mob was up!
          --else
            npcl.vars.debug.box.npc_level = '\\cs(255,100,100)?  \\cr'
          --end
        end
      else
        --npcl.vars.debug.box.npc_id = ' -None- '
        npcl.vars.debug.box.npc_id =' -None- '
        npcl.vars.debug.box.npc_level = '-  '
      end
    end
  end
end

-- Starts a capture
---------------------------------------------------------------------
npcl.startCapture = function()
  npcl.db.capture = {
    index_info = {},
    npc_info = {},
    seen_masks = {
      [0x57] = {},
      [0x07] = {},
      [0x0F] = {}
    },
    widescan = {
      num_new = 0,
      new = {},
      seen = {},
      checked = {}
    },
  }
  npcl.setupZone(windower.ffxi.get_info().zone)
end

-- Stops a capture
---------------------------------------------------------------------
npcl.stopCapture = function()
  npcl.writeZoneDatabase(npcl.vars.current_zone)
  coroutine.close(npcl.vars.scheduled_write_coroutine)
end

---------------------------------------------------------------------------------
-- INITIALIZE
---------------------------------------------------------------------------------
npcl.initialize = function()
  ---------------------------------------------------------------------------------
  -- DISPLAY COLORS AND LOG HEADERS
  ---------------------------------------------------------------------------------

  npcl.color = {}
  npcl.color.log = { -- Preformatted character codes for log colors.
    SYSTEM       = lib.color[npcl.settings.color.system][1],
  }
  npcl.color.box = { -- \\cs(#,#,#) values for Windower text boxes
    SYSTEM       = lib.color[npcl.settings.color.system][2],
  }

  ---------------------------------------------------------------------------------
  -- VARIABLES AND TEMPLATES
  ---------------------------------------------------------------------------------

  npcl.vars = {}
  npcl.vars.my_name = windower.ffxi.get_player().name

  npcl.vars.widescan_packet = packets.new('outgoing', 0xF4, {['Flags'] = 1})

  npcl.vars.loaded_sql_npcs = {}
  npcl.vars.loaded_table_npcs = {}
  npcl.vars.ordered_sql_ids = {}
  npcl.vars.num_sql_npcs = 0

  npcl.vars.new_npcs = {}

  npcl.file = T{}
  npcl.file.capture = T{}
  npcl.file.compare = files.new(npcl.settings.file_path.. npcl.vars.my_name ..'/logs/comparison.log', true)

  npcl.vars.new_npcs_seen = false
  npcl.vars.write_scheduled = false
  npcl.vars.current_zone = 0
  npcl.vars.always_widescan = false
  npcl.vars.scan_scheduled = false
  npcl.vars.scheduled_write_coroutine = false -- Coroutine.

  npcl.vars.debug = {
    box = texts.new(),
    ws_time = 0,
    ws_auto = 0,
    save_time = 0,
    settings = npcl.settings.debug_box
  }

  local box_text
  if info then
    if (npcl.settings.auto_ws_mode == 2) then
      box_text = '[NPCL] Save: ${save_time|%2d}s AutoWS: ${ws_auto|%2d} WSCool: ${ws_time|%2d}'
    else
      box_text = '[NPCL] Save: ${save_time|%2d} WS: ${ws_time|%2d}'
    end
  else
    if (npcl.settings.auto_ws_mode == 2) then
      box_text = '[NPCL] Mob: ${npc_id|%s} Level: ${npc_level|%s} Save: ${save_time|%2d}s AutoWS: ${ws_auto|%2d} WSCool: ${ws_time|%2d}'
    else
      box_text = '[NPCL] Mob: ${npc_id|%s} Level: ${npc_level|%s} Save: ${save_time|%2d} WS: ${ws_time|%2d}'
    end
  end
  npcl.vars.debug.box = texts.new(box_text, npcl.vars.debug.settings)
  npcl.vars.debug.box.save_time = '0 '
  npcl.vars.debug.box.ws_time = '0 '
  npcl.vars.debug.box.ws_auto = '0 '
  npcl.vars.debug.box.npc_id = 0
  npcl.vars.debug.box.npc_level = '?'

  if npcl.settings.show_bar then
    npcl.vars.debug.box:show()
  end

  fields = {
    ['always_string'] = {
      ['name'] = true,
      ['polutils_name'] = true,
      ['type'] = true,
      ['look'] = true,
    },
    ['padding'] = {
      ['name'] = 35,
      ['polutils_name'] = 55,
      ['type'] = 24,
      ['index'] = 14,
      ['level'] = 14,
      ['x'] = 15,
      ['y'] = 15,
      ['z'] = 15,
      ['r'] = 10,
      ['flag'] = 16,
      ['speed'] = 13,
      ['speedsub'] = 16,
      ['animation'] = 17,
      ['animationsub'] = 20,
      ['namevis'] = 16,
      ['status'] = 14,
      ['flags'] = 18,
      ['name_prefix'] = 20,
      ['look'] = 52,
    }
  }

  npcl.db = {
    main = {
      index_info = {},
      npc_info = {},
      seen_masks = {
        [0x57] = {},
        [0x07] = {},
        [0x0F] = {}
      },
      widescan = {
        num_new = 0,
        new = {},
        seen = {},
        checked = {}
      },
    }
  }

  ---------------------------------------------------------------------------------
  -- EVENTS
  ---------------------------------------------------------------------------------
  if not capture then
    windower.register_event('addon command', npcl.command)

    windower.register_event('prerender', function()
      if frame%10 == 0 then
        npcl.preRender()
        frame = 0
      end
      frame = frame + 1
    end)

    frame = 0
  end
  
  windower.register_event('zone change', function(new, old)
    npcl.setupZone(new, old)
  end)

  npcl.setupZone(windower.ffxi.get_info().zone)
  windower.register_event('incoming chunk', npcl.checkChunk)
end

if not capture then
  npcl.settings = config.load(npcl.defaults)
  npcl.initialize()
else
  return npcl
end
