
require 'luau'
require 'strings'
res = require('resources')
packets = require('packets')
pack = require('pack')
bit = require 'bit'
texts  = require('texts')
files = require('files')
chat = require('chat')

-------------------------------------------

lib = {}
lib.version = '006'
lib.date = '2020/02/27'

lib.color = {
   [1] = {string.char(0x1F,   1), '\\cs(255, 255, 255)'},
   [2] = {string.char(0x1F,  17), '\\cs(230, 255, 255)'},
   [3] = {string.char(0x1F,  20), '\\cs(255, 200, 230)'},
   [4] = {string.char(0x1F,   2), '\\cs(255, 180, 185)'},
   [5] = {string.char(0x1F,   3), '\\cs(255, 150, 150)'},
   [6] = {string.char(0x1F, 123), '\\cs(255, 115, 170)'},
   [7] = {string.char(0x1F,  39), '\\cs(255,  60,  90)'},
   [8] = {string.char(0x1F, 129), '\\cs(255, 255, 215)'},
   [9] = {string.char(0x1F,  53), '\\cs(225, 220, 185)'},
  [10] = {string.char(0x1F,  63), '\\cs(255, 255, 185)'},
  [11] = {string.char(0x1F,  36), '\\cs(255, 255,  90)'},
  [12] = {string.char(0x1F,   8), '\\cs(255, 205, 255)'},
  [13] = {string.char(0x1F,   4), '\\cs(255, 150, 255)'},
  [14] = {string.char(0x1E,  72), '\\cs(250,  60, 255)'},
  [15] = {string.char(0x1F, 200), '\\cs(190,  90, 255)'},
  [16] = {string.char(0x1E,   3), '\\cs(150, 150, 255)'},
  [17] = {string.char(0x1E,  71), '\\cs(115, 170, 255)'},
  [18] = {string.char(0x1F, 207), '\\cs(150, 175, 255)'},
  [19] = {string.char(0x1F,   7), '\\cs(200, 160, 255)'},
  [20] = {string.char(0x1F,  30), '\\cs(205, 255, 255)'},
  [21] = {string.char(0x1F,   6), '\\cs(170, 255, 235)'},
  [22] = {string.char(0x1F,   5), '\\cs(90,  255, 255)'},
  [23] = {string.char(0x1E,  83), '\\cs(65,  255, 210)'},
  [24] = {string.char(0x1F, 158), '\\cs(30,  255,  70)'},
  [25] = {string.char(0x1F, 160), '\\cs(155, 155, 195)'},
  [26] = {string.char(0x1E,  65), '\\cs(60,   60, 110)'},
}

lib.mode = {
  OFF     = 0,
  INFO    = 1,
  PASSIVE = 2,
  ACTIVE  = 3,
  CAPTURE = 4
}

-- ==================================================
-- ==    Packet Formatting Functions               ==
-- == Shamelessly stolen from Arcon's PacketViewer ==
-- ==================================================
do
    -- Precompute hex string tables for lookups, instead of constant computation.
    local top_row = '        |  0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F      | 0123456789ABCDEF\n    ' .. '-':rep((16+1)*3 + 2) .. '  ' .. '-':rep(16 + 6) .. '\n'

    local chars = {}
    for i = 0x00, 0xFF do
        if i >= 0x20 and i < 0x7F then
            chars[i] = i:char()
        else
            chars[i] = '.'
        end
    end
    chars[0x5C] = '\\\\'
    chars[0x25] = '%%'

    local line_replace = {}
    for i = 0x01, 0x10 do
        line_replace[i] = '    %%%%3X |' .. ' %.2X':rep(i) .. ' --':rep(0x10 - i) .. '  %%%%3X | ' .. '%%s\n'
    end
    local short_replace = {}
    for i = 0x01, 0x10 do
        short_replace[i] = '%s':rep(i) .. '-':rep(0x10 - i)
    end

    -- Receives a byte string and returns a table-formatted string with 16 columns.
    string.hexformat_file = function(str, byte_colors)
        local length = #str
        local str_table = {}
        local from = 1
        local to = 16
        for i = 0, ((length - 1)/0x10):floor() do
            local partial_str = {str:byte(from, to)}
            local char_table = {
                [0x01] = chars[partial_str[0x01]],
                [0x02] = chars[partial_str[0x02]],
                [0x03] = chars[partial_str[0x03]],
                [0x04] = chars[partial_str[0x04]],
                [0x05] = chars[partial_str[0x05]],
                [0x06] = chars[partial_str[0x06]],
                [0x07] = chars[partial_str[0x07]],
                [0x08] = chars[partial_str[0x08]],
                [0x09] = chars[partial_str[0x09]],
                [0x0A] = chars[partial_str[0x0A]],
                [0x0B] = chars[partial_str[0x0B]],
                [0x0C] = chars[partial_str[0x0C]],
                [0x0D] = chars[partial_str[0x0D]],
                [0x0E] = chars[partial_str[0x0E]],
                [0x0F] = chars[partial_str[0x0F]],
                [0x10] = chars[partial_str[0x10]],
            }
            local bytes = (length - from + 1):min(16)
            str_table[i + 1] = line_replace[bytes]
                :format(unpack(partial_str))
                :format(short_replace[bytes]:format(unpack(char_table)))
                :format(i, i)
            from = to + 1
            to = to + 0x10
        end
        return '%s%s':format(top_row, table.concat(str_table))
    end
end

-- ======================
-- == Helper Functions ==
-- ======================

-- Converts a string in base base to a number.
--------------------------------------------------
lib.toDec = function(numstr, base)
    -- Create a table of allowed values according to base and how much each is worth.
    local digits = {}
    local val = 0
    for c in ('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'):gmatch('.') do
        digits[c] = val
        val = val + 1
        if val == base then
            break
        end
    end
    
    local index = base^(#numstr-1)
    local acc = 0
    for c in numstr:gmatch('.') do
        acc = acc + digits[c]*index
        index = index/base
    end
    
    return acc
end

-- Converts a byte string to a proper integer keeping endianness into account
--------------------------------------------------
lib.byteStringToInt = function(x)
  x = lib.toDec(x, 16)
  x = bit.bswap(x)
  return x
end

-- Pads a string to the left
--------------------------------------------------
lib.padLeft = function(str, length, char)
  local padded = string.rep(char or ' ', length - #str) .. str
  return padded
end

-- Pads a string to the right
--------------------------------------------------
lib.padRight = function(str, length, char)
  local padded = str .. string.rep(char or ' ', length - #str)
  return padded
end

-- Checks an NPC's "raw name" (from packet) and ensures
-- we don't write "unwritable" ASCII characters to our files
--------------------------------------------------
lib.handleNpcRawName = function(name)
  local name_bytes = {name:byte(1, #name)}
  local byte_string = '_MLFRMD_ASCII:'
  local malformed_ascii = false
  for _, byte_value in ipairs(name_bytes) do
    byte_string = byte_string .. byte_value .. '_'
    if (byte_value <= 31) or (byte_value >= 127) then
      malformed_ascii = true
    end
  end
  if malformed_ascii then
    return byte_string
  else
    return name
  end
end

-- Given a format table, pre-builds the string for it
---------------------------------------------------------------------
lib.buildFormatString = function(format)
  local entry_string = '    '
  if format._key.type == '%s' then
    entry_string = entry_string .. '[\'%s\']%s = {' -- _key.field, padding_length (_key.width - length)
  else
    entry_string = entry_string .. '[%s]%s = {' -- _key.field, padding_length (_key.width - length)
  end
  for i = 1, format._num do
    if format[i].type ~= '%s' then
      entry_string = entry_string .. '[\''.. format[i].field..'\']='.. format[i].type ..', %s' -- padding_length (_key.width - length)
    else
      entry_string = entry_string .. '[\''.. format[i].field..'\']="'.. format[i].type ..'", %s' -- padding_length (_key.width - length)
    end
  end
  
  entry_string = entry_string .. '},\n'
  return entry_string
end

-- Pre-builds all the DB formatting strings for an addon, assigning them to their table
---------------------------------------------------------------------
lib.formatDatabaseStrings = function(addon)
  for k, v in pairs(addon.db.format) do
    v.format_string = lib.buildFormatString(v)
  end
end

-- Formats a single non-nested table into a string
---------------------------------------------------------------------
lib.formatDatabaseEntry = function(info, format, indent)
  if not indent then indent = 0 end
  local format_args = {
    [1] = tostring(info[format._key.field]):gsub("(['\"\\])", "\\%1"),
  }
  format_args[2] = string.rep(' ', format._key.width - #format_args[1])
  for i = 1, format._num do
    local value = info[format[i].field]
    if format[i].type ~= '%s' then
      value = tostring(value)
    end
    value = value:gsub("(['\"\\])", "\\%1")
    format_args[(i * 2) + 1] = value
    format_args[(i * 2) + 2] = string.rep(' ', format[i].width - #value)
  end
  return string.rep(' ', indent).. string.format(format.format_string, unpack(format_args))
end

-- Formats an entire database table, with recursion for subtables
---------------------------------------------------------------------
lib.formatDatabaseTable = function(db, key, indent, format_type)
  if not indent then indent = 0 end
  local db_string = ''
  if type(key) == 'string' then
    db_string = db_string .. '[\''.. key:gsub("(['\"\\])", "\\%1") ..'\'] = {\n'
  else
    db_string = db_string .. '['.. tostring(key) ..'] = {\n'
  end
  
  local sorted_ids = {} -- Lua can't natively sort by key.
  local data = db.info
  for id, _ in pairs(data) do
    table.insert(sorted_ids, id)
  end
  table.sort(sorted_ids) -- But we now have a sorted table of keys...
  
  for _, k in ipairs(sorted_ids) do -- Now we can use ipairs to guarantee traversal order.
    local v = data[k]
    local string_v = ''
    if db._meta and db._meta.parent then
      string_v = lib.formatDatabaseTable(data[k], k, indent + 4, format_type)
    else
      return lib.formatDatabaseEntry(data, format_type, indent - 4)
    end
    db_string = db_string .. string_v
  end
  db_string = db_string .. string.rep(' ', indent).. '},\n'

  return string.rep(' ', indent).. db_string
end

-- Writes a lua database table with the specified file handle
--------------------------------------------------
lib.writeDatabase = function(addon, db_table, key, file_stream, format)
  local string_to_write = "local database =\n{\n"
  string_to_write = string_to_write .. lib.formatDatabaseTable(db_table[key], key, 4, db_table._meta.format)
  string_to_write = string_to_write .. "}\nreturn database"
  file_stream:write(string_to_write)
end

-- Handles opening, or creating, a file object. Returns it.
--------------------------------------------------
lib.fileOpen = function(path)
  local file = {
    stream = files.new(path, true),
    locked = false,
    scheduled = false,
    buffer = ''
  }
  return file
end

-- Handles writing to a file (gently)
--------------------------------------------------
lib.fileAppend = function(file, text)
  if not file.locked then
    file.buffer = file.buffer .. text
    if not file.scheduled then
      file.scheduled = true
      coroutine.schedule(function() lib.fileWrite(file) end, 0.5)
    end
  else
    coroutine.schedule(function() lib.fileAppend(file, text) end, 0.1)
  end
end

-- Writes to a file and empties the buffer
--------------------------------------------------
lib.fileWrite = function(file)
  file.locked = true
  local to_write = file.buffer
  file.buffer = ''
  file.scheduled = false
  file.stream:append(to_write)
  file.locked = false
end

-- Recursively steps through a table and moves all tables
-- into a info table
--------------------------------------------------
lib.loadTable = function(db_table)
  local info = {}
  local nested = false
  local num, total_num = 0, 0
  if type(db_table) == 'table' then
    for k, v in pairs(db_table) do
      if type(v) == 'table' then
        nested = true
      end
      info[k], num = lib.loadTable(v)
      total_num = total_num + num
    end
    return {
      ['info'] = info,
      ['_meta'] = {
        num = total_num,
        parent = nested
      }
    }, total_num
  else
    return db_table, 1
  end
end

-- Given a path, will return the specified database
--------------------------------------------------
lib.loadDatabase = function(path)
  local database = {}
  
  local file_stream = files.new(path ..'.lua', true)
  if file_stream:exists(path) then
    package.loaded[path] = nil
    database = require(path)
  end
  local loaded_db = lib.loadTable(database)
  return loaded_db
end

-- Given a two databases to compare, will meld database A into database B
-- and return a combined database. Will return the number of of new information
-- added by A during this process.
-- Optionally takes a comparison function to determine if a database entry "should"
-- be updated.
--------------------------------------------------
lib.meldDatabases = function (db_a, db_b, comparison)
  local meld = {}
  local updated_info = 0
  if not comparison then
    comparison = function(a, b)
      return false
    end
  end

  for k_a, v_a in pairs(db_a) do
    local v_b = db_b[k_a]
    local should_update = comparison(v_a, v_b)

    if (not v_b) or should_update then
      meld[k_a] = v_a
      updated_info = updated_info + 1
    end
    if should_update then
      db_b[k_a] = nil -- If we're updating, be sure to remove from DB B so don't write same info
    end
  end
  
  if updated_info > 0 then
    for k_b, v_b in pairs(db_b) do
      meld[k_b] = v_b
    end
    return meld, updated_info
  else
    return db_b, 0
  end
end

-- Handles testing addon colors
--------------------------------------------------
lib.colorTest = function(addon)
  if not addon.vars.color_testing then
    addon.vars.color_testing = lib.performColorTest(addon.settings.box)
    if addon.vars.color_testing then
      addon.vars.color_testing:show()
    end
  else
    addon.vars.color_testing:hide()
    addon.vars.color_testing = false
  end
end

-- Spits out the colors and codes used by addons in the capture suite
-- Will print colors directly to the chatlog and a box
-- Returns the box so you can hide or show it
--------------------------------------------------
lib.performColorTest = function(box_settings)
  local chatlog_line = ''
  local box_text = ' '
  for code = 1, 16 do
    chatlog_line = chatlog_line .. lib.color[code][1].. string.format("%02d ", code)
    box_text = box_text .. lib.color[code][2].. string.format("%02d ", code) .. '\\cr'
  end
  windower.add_to_chat(1, chatlog_line)
  box_text = box_text .. '\n '
  
  chatlog_line = ''
  for code = 17, 26 do
    chatlog_line = chatlog_line .. lib.color[code][1].. string.format("%02d ", code)
    box_text = box_text .. lib.color[code][2].. string.format("%02d ", code) .. '\\cr'
  end
  windower.add_to_chat(1, chatlog_line)
  
  if box_settings then
    local color_box = texts.new(box_text, box_settings)
    texts.pos(color_box, windower.get_windower_settings().x_res*1/3, windower.get_windower_settings().y_res*2/3)
    return color_box
  end
  return false
end

-- Displays a print out of the commands of an associated addon
--------------------------------------------------
lib.displayHelp = function(addon)
  lib.msg(addon, ' == '.. addon.info.name.. ' Commands ==')
  for command, text in pairs(addon.help_text) do
    lib.msg(addon, command .. ': '.. text)
  end
end

-- Changes the mode of an addon
--------------------------------------------------
lib.setMode = function(addon, new_mode)
  if not new_mode then new_mode = '' end
  
  new_mode = string.upper(new_mode)
  mode_setting = lib.mode[new_mode]
  if mode_setting then
    addon.settings.mode = mode_setting
  end
  if mode_setting then
    lib.msg(addon, 'Mode: '.. new_mode)
    if capture then
      capture.settings[addon.info.key] = addon.settings
      config.save(capture.settings)
    else
      config.save(addon.settings)
    end
  else
    lib.msg(addon, 'Unknown mode: '.. new_mode ..'. Ignored.')
  end
end

-- Sets, or toggles, an ON/OFF setting for an addon
--------------------------------------------------
lib.setToggle = function(addon, setting, arg)
  local new_mode = nil
  if setting and (addon.settings[setting] ~= nil) then
    if arg then
      arg = string.upper(arg)
      if arg == 'ON' then
        new_mode = true
      elseif arg == 'OFF' then
        new_mode = false
      else
        lib.msg(addon, 'ERROR - Unknown mode for \''.. setting ..'\': '.. arg.. '. Ignored.')
      end
    else
      new_mode = not addon.settings[setting]
    end
    
    if new_mode ~= nil then
      if new_mode then
        lib.msg(addon, setting.. ': ON')
      else
        lib.msg(addon, setting.. ': OFF')
      end
      addon.settings[setting] = new_mode
      if capture then
        capture.settings[addon.info.key] = addon.settings
        config.save(capture.settings)
      else
        config.save(addon.settings)
      end
    end
  else
    lib.msg(addon, 'ERROR - Unknown setting: '.. setting)
  end
end

-- Handles a capture command
---------------------------------------------------------------------
lib.capture = function(addon, args)
  if args[1] then
    local toggle = string.lower(args[1])
    if toggle == 'start' then
      lib.startCapture(addon)
    elseif toggle == 'stop' then
      lib.stopCapture(addon)
    else
      lib.msg(addon, "Usage: //".. addon.info.commands[#addon.info.commands] .." capture [start | stop]")
    end
  else
    lib.msg(addon, "Usage: //".. addon.info.commands[#addon.info.commands] .." capture [start | stop]")
  end
end

-- Starts a capture
---------------------------------------------------------------------
lib.startCapture = function(addon, file_root)
  if not (addon.settings.mode == lib.mode.CAPTURE) then
    addon.vars.previous_mode = addon.settings.mode
    addon.settings.mode = lib.mode.CAPTURE
    
    if not file_root then
      local date = os.date('*t')
      file_root = addon.settings.file_path.. '%.4u-%.2u-%.2u_%.2u-%.2u/%s/'.. addon.info.folder ..'/'
      file_root = file_root:format(date.year, date.month, date.day, date.hour, date.min, addon.vars.my_name)
    end
    addon.vars.capture_root = file_root
    
    addon.startCapture()
    --lib.msg(addon, 'Capture started. ('.. addon.info.name ..' v'.. addon.info.version ..')')
  else
    lib.msg(addon, 'Capture already in progress!')
  end
end

-- Stops a capture
---------------------------------------------------------------------
lib.stopCapture = function(addon, silent)
  addon.stopCapture()
  if addon.settings.mode == lib.mode.CAPTURE then
    if not silent then
      lib.msg(addon, 'Capture stopped.')
    end
    addon.settings.mode = addon.vars.previous_mode
  else
    if not silent then
      lib.msg(addon, 'Capture wasn\'t started yet!')
    end
  end
end

-- Displays a system message for an addon
--------------------------------------------------
lib.msg = function(addon, message)
  windower.add_to_chat(1, addon.color.log.SYSTEM .. '['.. addon.info.log_name .. '] '.. message)
end

-- Changes the mode of an addon
--------------------------------------------------
lib.checkLibVer = function(addon)
  if lib.version ~= addon.info.lib_version then
    lib.msg(addon, 'LIBRARY WARNING - Expected: v'.. addon.info.lib_version ..'. Current: v'.. lib.version)
  end
end

-- Displays addon version information
--------------------------------------------------
lib.displayVer = function(addon)
  lib.msg(addon, addon.info.name.. ': v'.. addon.info.version .. ' ['.. addon.info.date ..']')
  lib.msg(addon, 'Library: v'.. lib.version .. ' ['.. lib.date ..'] (Expected: v'.. addon.info.lib_version .. ')')
end

-- Handles taking a command, checking if it is valid.
-- Executes if so, but displays error if not.
--------------------------------------------------
lib.command = function(addon, command, ...)
  local args = T{...}
  local result = addon.commands[command]
  if result then
    result(args)
  else
    lib.msg(addon, 'ERROR - Unknown command: '.. command)
    lib.msg(addon, 'Try //'.. addon.info.commands[#addon.info.commands] ..' help')
  end
end

-- Updates an info box with a table of information
--------------------------------------------------
lib.updateBox = function(addon, info)
  if addon.vars.show_box then
    if info then
      if #addon.vars.boxes == addon.settings.box.max_num then
        local removed_box = table.remove(addon.vars.boxes, #addon.vars.boxes)
        removed_box:hide()
        texts.destroy(removed_box)
        removed_box = nil
      end
      for i = 1, #addon.vars.boxes do
        texts.pos(addon.vars.boxes[i], addon.vars.box_positions[i + 1].x, addon.vars.box_positions[i + 1].y)
      end
      new_box = addon.writeBox(info)
      
      table.insert(addon.vars.boxes, 1, new_box)
      new_box:show()
      if addon.settings.auto_hide and not addon.vars.hide_ticking then
        coroutine.schedule(function() lib.updateBox(addon) end, addon.settings.auto_hide_time + 0.2)
        addon.vars.hide_ticking = true
      end
    elseif addon.settings.auto_hide and #addon.vars.boxes > 0 then
      if not addon.vars.in_event then
        local removed_box = table.remove(addon.vars.boxes, #addon.vars.boxes)
        removed_box:hide()
        texts.destroy(removed_box)
        removed_box = nil
        
        if #addon.vars.boxes == 0 then
          addon.vars.hide_ticking = false
        else
          coroutine.schedule(function() lib.updateBox(addon) end, addon.settings.auto_hide_time + 0.2)
        end
      else
        coroutine.schedule(function() lib.updateBox(addon) end, addon.settings.auto_hide_time + 0.2)
      end
    end
  end
end

-- Displays a test box that can be used to display / update box settings
--------------------------------------------------
lib.testBox = function(addon, info)
  if not addon.vars.testing_box then
    info = addon.vars.test_box_info
    addon.vars.testing_box = addon.writeBox(info)
    addon.vars.testing_box:show()
  else
    local test_x, test_y = texts.pos(addon.vars.testing_box)
    addon.settings.box.pos.x = test_x
    addon.settings.box.pos.y = test_y
    
    if capture then
      capture.settings[addon.info.key] = addon.settings
      config.save(capture.settings)
    else
      config.save(addon.settings)
    end
    addon.vars.testing_box:hide()
    addon.vars.testing_box = nil
    addon.vars.initial_x = addon.settings.box.pos.x
    addon.vars.initial_y = addon.settings.box.pos.y
    addon.vars.box_positions = {
      [1] = {x = addon.vars.initial_x, y = addon.vars.initial_y}
    }
    for i = 2, 10 do
      addon.vars.box_positions[i] = {
        x = addon.vars.initial_x,
        y = addon.vars.initial_y - (((addon.settings.box.text.size + addon.settings.box.spacing) * 4) * (i - 1))
      }
    end
  end
end