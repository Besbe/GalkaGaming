require('capture-lib')

pv = pv or {}
pv.info = {
  name = 'PacketViewer',
  log_name = 'PV',
  box_name = 'PV',
  version = '001',
  date = '2019/11/11',
  lib_version = '006',
  author = 'Arcon',
  commands = {'pv'},
  key = 'pv',
  folder = 'packetviewer/'
}

if not capture then
  _addon.name = pv.info.name
  _addon.version = pv.info.version
  _addon.date = pv.info.date
  _addon.lib_version = pv.info.lib_version
  _addon.author = pv.info.author
  _addon.commands = pv.info.commands
end

-- ------------------------------------------------------------------------------
-- DEFAULT USER SETTINGS
-- ------------------------------------------------------------------------------

pv.defaults = {}
pv.defaults = {}

pv.defaults.file_path = 'data/packetviewer/'
pv.defaults.mode = lib.mode.ACTIVE

pv.defaults.tracker = {}
pv.defaults.tracker.pos = {}
pv.defaults.tracker.pos.x = 0
pv.defaults.tracker.pos.y = 0
pv.defaults.tracker.text = {}
pv.defaults.tracker.text.font = 'Consolas'
pv.defaults.tracker.text.size = 10
pv.defaults.tracker.text.alpha = 255
pv.defaults.tracker.text.red = 255
pv.defaults.tracker.text.green = 255
pv.defaults.tracker.text.blue = 255
pv.defaults.tracker.bg = {}
pv.defaults.tracker.bg.alpha = 192
pv.defaults.tracker.bg.red = 0
pv.defaults.tracker.bg.green = 0
pv.defaults.tracker.bg.blue = 0
pv.defaults.tracker.padding = 5
pv.defaults.display = {}
pv.defaults.display.pos = {}
pv.defaults.display.pos.x = 0
pv.defaults.display.pos.y = 0
pv.defaults.display.text = {}
pv.defaults.display.text.font = 'Consolas'
pv.defaults.display.text.size = 10
pv.defaults.display.text.alpha = 255
pv.defaults.display.text.red = 255
pv.defaults.display.text.green = 255
pv.defaults.display.text.blue = 255
pv.defaults.display.bg = {}
pv.defaults.display.bg.alpha = 192
pv.defaults.display.bg.red = 0
pv.defaults.display.bg.green = 0
pv.defaults.display.bg.blue = 0
pv.defaults.display.padding = 5

pv.defaults.pv_mode = 'hybrid'
pv.defaults.Show = {}
pv.defaults.Show.Known = true
pv.defaults.Show.Unknown = true
pv.defaults.Show.Junk = true
pv.defaults.CheckConst = true
pv.defaults.LogChat = true
pv.defaults.LogFields = false
pv.defaults.LogTimestamp = true

pv.defaults.color = T{}
pv.defaults.color.system    = 19

-- Replace these with proper colors later
pv.colors = {}
pv.colors['hexborder'] =   '\\cs(0,255,0)'
pv.colors['gray'] =        '\\cs(102,102,102)'
pv.colors[0] =             '\\cs(204,204,0)'
pv.colors[1] =             '\\cs(51,153,255)'
pv.colors[2] =             '\\cs(51,255,153)'
pv.colors[3] =             '\\cs(153,51,255)'
pv.colors[4] =             '\\cs(255,51,153)'
pv.colors[5] =             '\\cs(153,255,51)'
pv.colors[6] =             '\\cs(255,153,51)'
pv.colors[7] =             '\\cs(255,255,102)'
pv.colors[8] =             '\\cs(255,102,255)'
pv.colors[9] =             '\\cs(102,255,255)'
pv.colors[10] =            '\\cs(102,102,255)'
pv.colors[11] =            '\\cs(102,255,102)'
pv.colors[12] =            '\\cs(255,102,102)'
pv.colors[13] =            '\\cs(255,204,153)'
pv.colors[14] =            '\\cs(204,255,153)'
pv.colors[15] =            '\\cs(255,153,204)'
pv.colors[16] =            '\\cs(153,204,255)'
pv.colors[17] =            '\\cs(204,153,255)'
pv.colors[18] =            '\\cs(153,255,204)'

pv.byte_colors = list.range(0x200, '\\cr')
pv.byte_colors[1] = pv.colors.gray
pv.byte_colors[2] = pv.colors.gray
pv.byte_colors[3] = pv.colors.gray
pv.byte_colors[4] = pv.colors.gray

---------------------------------------------------------------------------------
-- COMMANDS
---------------------------------------------------------------------------------
pv.help_text = {
  ['always_widescan'] = "Auto-widescan in ALL zones: OFF | ON",
  ['aws']             = "Starts auto-widescan for the current zone (only)",
  ['capture']         = "Starts or stops a capture: start | stop",
  ['box_test']        = "Displays a test box. Call again to hide, and save setting.",
  ['color_test']      = "Displays the color codes used by the addon",
  ['info']            = "Toggles display of pv's info box",
  ['mobs_only']       = "Limits action display to mobs: OFF | ON",
  ['mode']            = "Sets mode: OFF | INFO | PASSIVE | ACTIVE",
  ['save']            = "Immediately save pending database information",
  ['sws']             = "Stops automatically widescanning for the current zone",
  ['ver']             = "Shows addon (and library) version and date",
  ['ws']              = "Manually injects an outgoing widescan packet"
}

pv.commands = {
  ['track'] = function(args)
    if args[1] == 'stop' or args[1] == 's' then
      pv.tracking = T{
          incoming = S{},
          outgoing = S{},
      }
      pv.tracker:hide()
      return
    elseif args[1] == 'pause' or args[1] == 'p' then
      pv.tracking.active = false
      return
    elseif args[1] == 'resume' or args[1] == 'r' then
      pv.tracking.active = true
      return
    elseif args[1] == 'hide' or args[1] == 'h' then
      pv.tracker:hide()
      return
    elseif args[1] == 'once' then
      pv.tracking.once = true
      args:remove(1)
    end
    repeat
      pv.parse_track_command(args)
    until not pv.direction_strings[args[1]]

    pv.tracking.filter = T{}
    for i = 1, args:length() / 2 do
      local key = args[i]
      local value = args[i + 1]
      value = value:number()
        or value == 'true' and true
        or value ~= 'false' and value
        or false
      pv.tracking.filter[key] = value
    end
    pv.tracker:clear()
    pv.tracker:show()
    pv.tracking.active = true
  end,
  ['eval'] = function(...)
    assert(loadstring(L{...}:concat(' ')))()
  end,
  ['show'] = function(args)
    if not (args[1] and args[2]) then
      error('Specify a category and value: //pv show <junk|known|unknown> <true|false>')
    end
    pv.settings.Show[args[1]:lower():capitalize()] = args[2] ~= 'false'
    config.save(pv.settings)
  end,
  ['scan'] = function(args)
    if not args[1] then
      error('Specify a command: //pv scan incoming|outgoing|both <val> or //pv scan start|stop')
      return
    end
    if not args[2] and pv.direction_strings[args[1]] then
      error('Specify an argument to scan for: //pv scan incoming|outgoing|both [known|unknown|hybrid] <val>')
      return
    end
    if args[1] == 'start' then
      pv.scan.active = true
    elseif args[1] == 'stop' then
      pv.scan.active = false
    elseif args[1] == 'mode' or args[1] == 'm' then
      pv.scan.mode = pv.mode_strings[args[2]] or pv.scan.mode
    else
      local dir = pv.direction_strings[args[1]]
      local mode = pv.mode_strings[args[2]]
      local arg = table.concat(args, ' ', mode and 3 or 2)
      mode = mode or 'hybrid'
      if tonumber(arg) then
          arg = tonumber(arg)
      end
      local pack_str
      if type(arg) == 'number' then
        if arg < 2^8 then
          pack_str = 'b'
        elseif arg < 2^16 then
          pack_str = 'H'
        elseif arg < 2^32 then
          pack_str = 'I'
        else
          error('Number too big to scan for.')
          return
        end
      else
        pack_str = 'A'
      end
      pv.scan.pack = pack_str
      pv.scan.value = pack_str:pack(arg)
      pv.scan.dir = dir
      pv.scan.mode = mode
      pv.scan.active = true
    end
  end,
  ['record'] = function (args)
    if args[1] == 'start' then
      recording = true
    elseif args[1] == 'stop' then
      recording = false
    else
      recording = not recording
    end
  end,
  ['help'] = function()
    lib.displayHelp(pv)
  end,
  ['log'] = function(args)
    if args[1] == 'stop' or args[1] == 's' then
      pv.logging = T{}
      return
    end

    pv.logging.output = args[1] and pv.output_strings[args[1]] or 'console'
    pv.logging.direction = args[2] and pv.direction_strings[args[2]] or 'both'
    pv.logging.mode = args[3] and pv.mode_strings[args[3]] or pv.settings.pv_mode
    local offset = 0
    if args[3] and pv.mode_strings[args[3]] then
      offset = 1
    end
    if not args[3 + offset] or args[3 + offset] == 'not' then
      pv.logging.filter = S(list.range(0x1FF)) - S(args:slice(4 + offset):map(tonumber))
    else
      pv.logging.filter = S(args:slice(3 + offset):map(tonumber))
    end
  end,
  ['display'] = function(args)
    if args[1] == 'show' or args[1] == 's' then
      pv.display:show()
    elseif args[1] == 'hide' or args[1] == 'h' then
      pv.display:hide()
    elseif args[1]:number() then
      pv.display_packet(args[1]:number())
    else
      error('Specify an argument to pv.display: //pv display <show|hide|#>')
    end
  end,  
  ['save'] = function()
    pv.settings:save('all')
  end,
  ['capture'] = function(args)
    lib.capture(pv, args)
  end,
}
pv.commands.t   = pv.commands.track
pv.commands.e   = pv.commands.eval
pv.commands.s   = pv.commands.scan
pv.commands.rec = pv.commands.record
pv.commands.l   = pv.commands.log
pv.commands.u   = pv.commands.display

---------------------------------------------------------------------------------
-- METHODS
---------------------------------------------------------------------------------

-- Checks for a valid command and executes it
--------------------------------------------------
pv.command = function(cmd, ...)
  lib.command(pv, cmd, ...)
end

pv.cap = function(val, min, max)
    return val > max and max or val < min and min or val
end

do
    -- Precompute hex string tables for lookups, instead of constant computation.
    local top_row = ('    |  0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F      | 0123456789ABCDEF\n' .. '-':rep((16+1)*3 + 2) .. '  ' .. '-':rep(16 + 6) .. '\n'):enclose(pv.colors['hexborder'], '\\cr')

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
        line_replace[i] = pv.colors.hexborder .. '%%%%3X |' .. ' %%s%.2X':rep(i) .. pv.colors.gray .. ' --':rep(0x10 - i) .. pv.colors.hexborder .. '  %%%%3X | ' .. '%%%%%%%%s\n'
    end
    local short_replace = {}
    for i = 0x01, 0x10 do
        short_replace[i] = '%%s%s':rep(i) .. (i < 0x10 and pv.colors.gray .. '-':rep(0x10 - i) or '')
    end

    -- Receives a byte string and returns a table-formatted string with 16 columns.
    string.pv_hexformat = function(str)
        local length = #str
        local str_table = {}
        local from = 1
        local to = 16
        for i = 0, ((length - 1)/0x10):floor() do
            local partial_str = {str:byte(from, to)}
            local partial_col = pv.byte_colors:slice(from, to)
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
                :format(partial_col:unpack())
                :format(i, i)
                :format(short_replace[bytes]:format(unpack(char_table))
                :format(partial_col:unpack()))
            from = to + 1
            to = to + 0x10
        end
        return '%s%s\\cr':format(top_row, table.concat(str_table))
    end
end

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
    string.pv_hexformat_file = function(str, byte_colors)
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

-- Returns true if the
pv.filter_settings = function(field)
    return field.label:startswith('_junk') and pv.settings.Show.Junk
        or field.label:startswith('_unknown') and pv.settings.Show.Unknown
        or pv.settings.Show.Known
end

-- Main packet tracker handler
-- Gets packet information, displays the packet in the track text box.
pv.track_packet = function(dir, id, data, modified, injected, blocked)
    if pv.tracking.once then
        pv.tracking.once = false
    end

    local packet = packets.parse(dir, data)
    if not pv.tracking.filter:empty() then
        for value, key in pv.tracking.filter:it() do
            if packet[key] ~= value then
                return
            end
        end
    end

    local fields = packets.fields(dir, id, data)

    -- Determine pv.colors for the respective bytes.
    -- Only necessary if the fields are different from the previously calculated.
    packet._lines = L{}
    -- Reset display pv.settings.
    pv.tracker:clear()
    packet._lines:append('')

    pv.byte_colors = list.range(#data + 1, '\\cr')
    pv.byte_colors[1] = pv.colors.gray
    pv.byte_colors[2] = pv.colors.gray
    pv.byte_colors[3] = pv.colors.gray
    pv.byte_colors[4] = pv.colors.gray

    pv.tracking.fields = fields

    if fields then
        local pos = 5
        -- Hack to display pv.colors somewhat correctly for bit fields
        local bitoffset = 0
        local coloroffset = 0
        local color = pv.colors[1]

        -- Process individual fields
        for field, index in fields:it() do
            local filter_pass = pv.filter_settings(field)
            local color = filter_pass and pv.colors[index % #pv.colors] or pv.colors.gray

            -- Set the color of the relevant bytes
            local from = (field.index / 8):floor() + 1
            local to = ((field.index + field.length) / 8):ceil()
            for i = from, to do
                if pv.byte_colors[i] == '\\cr' then
                    pv.byte_colors[i] = color
                end
            end
            pv.byte_colors[to + 1] = '\\cr'

            -- Add the line to the tracker
            if filter_pass then
                packet._lines:append('%s: %s${%s|-}%s\\cr':format(field.label, color, field.label, (field.fn and '${_f_%s}':format(field.label) or '')))
            end
        end

        -- Check for const violations
        if pv.settings.CheckConst then
            for field in fields:it() do
                if field.const and field.const ~= packet[field.label] then
                    print('Const violation found in %s packet 0x%.3X, field %s: %s ≠ %s':format(packet._dir, packet._id, field.label, tostring(packet[field.label]), tostring(field.const)))
                end
            end
        end

        for field in fields:filter(pv.filter_settings):filter(boolean._exists .. table.get-{'fn'}):it() do
            local val = field.fn(packet[field.label], packet._raw)
            if val ~= nil then
                packet['_f_' .. field.label] = ' (' .. tostring(val) .. ')'
            end
        end

        for field in fields:filter(pv.filter_settings):filter(string.startswith-{'data'} .. table.get-{'ctype'}):it() do
            packet[field.label] = '…'
        end
    end

    for line in packet._lines:it() do
        pv.tracker:append('\n' .. line)
    end

    pv.tracking.byte_colors = pv.byte_colors
    if not pv.tracking.byte_colors then
        pv.tracking.byte_colors = list.range(4, pv.colors['gray'])
    end

    -- Determine various display-related values.
    packet._hexid = '0x%.3X':format(id)
    packet._hextable = packet._raw:pv_hexformat(pv.tracking.byte_colors) -- The fully colored hex table

    packet._display_padding = ' ':rep(packet._id:log(10):floor() - packet._size:log(10):floor() + 2)
    packet._time = os.date('%H:%M:%S')

    pv.tracker:update(packet)

    if recording then
        pv.saved_packets:append(packet)
        if pv.display:visible() then
            pv.display_packet(displayed)
        end
    end
end

-- Main packet logger handler
-- Gets packet data and decides whether and where to log it.
do
    local mods = {
        [true] = {
            [true] = ' (Injected, Blocked)',
            [false] = ' (Injected)',
        },
        [false] = {
            [true] = ' (Blocked)',
            [false] = '',
        },
    }
    local dirs = {incoming = 'Incoming', outgoing = 'Outgoing'}

    local header_str = '%s packet 0x%.3X%s:'

    pv.log_packet = function(dir, id, data, modified, injected, blocked)
        local name = packets.data[dir][id].name
        if not force and (pv.logging.mode ~= 'hybrid' and (pv.logging.mode == 'known' and name == 'Unknown' or pv.logging.mode == 'unknown' and name ~= 'Unknown')) then
            return
        end

        local mod_str = mods[injected][blocked]
        local header = header_str:format(dirs[dir], id, mod_str)

        if pv.logging.output == 'chatlog' then
            log(header .. ' ' .. data:hex(' '))
        elseif pv.logging.output == 'console' then
            print(header .. ' ' .. data:hex(' '))
        elseif pv.logging.output == 'file' then
            local hex_data = data:pv_hexformat_file()

            local field_data = ''
            if pv.settings.LogFields then
                local fields = packets.fields(dir, id, data)

                if fields then
                    field_data = '\n'
                    local packet = packets.parse(dir, data)

                    for field in fields:filter(pv.filter_settings):it() do
                        field_data = field_data .. '%s: %s%s\n':format(field.label, tostring(packet[field.label]), field.fn and ' (%s)':format(field.fn(packet[field.label], data)) or '')
                    end
                end
            end

            local timestamp = pv.settings.LogTimestamp and '[%s] ':format(os.date('%Y-%m-%d %X')) or ''

            if pv.settings.mode == lib.mode.CAPTURE then
              pv.write_packet_to_file(pv.file.capture.full, '%s%s\n%s%s\n':format(timestamp, header, hex_data, field_data), 'full')
              pv.write_packet_to_file(pv.file.capture[dir], '%s%s\n%s%s\n':format(timestamp, 'Packet 0x%.3X%s':format(id, mod_str), hex_data, field_data), dir)
              pv.write_packet_to_file(files.new(pv.vars.capture_root.. '%s/0x%.3X.log':format(dir, id), true), '%s%s\n%s%s\n':format(timestamp, mod_str, hex_data, field_data), dir.. '_'.. id)
            elseif pv.settings.mode >= lib.mode.INFO then
              pv.write_packet_to_file(pv.file.full, '%s%s\n%s%s\n':format(timestamp, header, hex_data, field_data), 'full')
              pv.write_packet_to_file(pv.file[dir], '%s%s\n%s%s\n':format(timestamp, 'Packet 0x%.3X%s':format(id, mod_str), hex_data, field_data), dir)
              pv.write_packet_to_file(files.new(pv.settings.file_path.. '%s/%s/0x%.3X.log':format(pv.vars.my_name, dir, id), true), '%s%s\n%s%s\n':format(timestamp, mod_str, hex_data, field_data), dir.. '_'.. id)
            end
        end
    end
end

-- Uses coroutines to only append to a file twice a second, to avoid lagging out
-- the client with constant file appends
pv.write_packet_to_file = function(file_stream, string, stream_id)
  if not pv.write_strings[stream_id] then
    pv.write_strings[stream_id] = ''
  end
  
  if not pv.write_lock[stream_id] then -- Make sure we don't try to push into a string that might about to be emptied
    pv.write_strings[stream_id] = pv.write_strings[stream_id] .. string
    
    if not pv.write_scheduled[stream_id] then
      pv.write_scheduled[stream_id] = true
      coroutine.schedule(function() pv.write_to_file(file_stream, stream_id) end, 0.5)
    end
  else
    -- Try again in a little bit
    coroutine.schedule(function() pv.write_packet_to_file(file_stream, string, stream_id) end, 0.1)
  end
end

pv.write_to_file = function(file_stream, stream_id)
  pv.write_lock[file_stream] = true
  local to_write = pv.write_strings[stream_id]
  pv.write_strings[stream_id] = ''
  pv.write_scheduled[stream_id] = false
  
  file_stream:append(to_write)
  pv.write_lock[file_stream] = false
end

-- Main packet scanner handler
pv.scan_packet = function(dir, id, data, modified, injected, blocked)
    local mode = packets.raw_fields[dir][id] and 'known' or 'unknown'
    if pv.scan.mode ~= 'hybrid' and pv.scan.mode ~= mode then
        return
    end

    local from, to = data:sub(5):find(pv.scan.value, pos, true)
    if not from then
        return
    end
    from = from + 3

    print('Match found for %s in %s packet %u (0x%.3X) at byte %u (0x%.2X).':format(tostring(pv.scan.value:unpack(pv.scan.pack)), dir, id, id, from, from))
end

-- Called on every packet, both incoming and outgoing. Further filtering done inside based on packet category and mode.
pv.register_packet = function(dir, id, data, modified, injected, blocked)
    -- This part is executed if a certain packet is currently being tracked.
    if pv.tracking.active and pv.tracking[dir]:contains(id) and (pv.tracking.once == nil or pv.tracking.once == true) then
        pv.track_packet(dir, id, data, modified, injected, blocked)
    end

    -- This part is executed if a certain packet matches the current logging critera.
    if pv.logging.output and (pv.logging.direction == 'both' or dir == pv.logging.direction) and pv.logging.filter:contains(id) then
        pv.log_packet(dir, id, data, modified, injected, blocked)
    end

    -- Run the scanner on each packet.
    if pv.scan.active and pv.scan.value then
        pv.scan_packet(dir, id, data, modified, injected, blocked)
    end
end

pv.display_packet = function(index)
    if index > pv.saved_packets.n then
        if pv.saved_packets.n == 0 then
            error('No packets recorded.')
        else
            error('Only %u packet%s recorded.':format(pv.saved_packets.n, pv.saved_packets.n > 1 and 's' or ''))
        end

        return
    end

    local packet = pv.saved_packets[index]
    packet._current = index
    packet._total = pv.saved_packets.n

    pv.display:clear()
    for line in packet._lines:it() do
        pv.display:appendline(line)
    end

    pv.display:update(packet)
    pv.display:show()

    displayed = index
end

pv.parse_track_command = function(args)
    if args:length() < 2 then
        error('Specify a packet direction and ID to track: //pv track <<i> <ids>|<o> <ids>> [filters ...]')
        return
    end

    local direction = pv.direction_strings[args:remove(1)]
    if not direction then
        error('Specify a packet direction and ID to track: //pv track <<i> <ids>|<o> <ids>> [filters ...]')
        return
    end

    local ids = args:remove(1):split('|')
    if not ids:all(string.number) then
        error('Specify a packet direction and ID to track: //pv track <<i> <ids>|<o> <ids>> [filters ...]')
        return
    end

    pv.tracking[direction] = S(ids:map(string.number))
end

-- Starts a capture
---------------------------------------------------------------------
pv.startCapture = function()
  pv.file.capture = T{}
  pv.file.capture.full = files.new(pv.vars.capture_root ..'full.log', true)
  pv.file.capture.incoming = files.new(pv.vars.capture_root ..'incoming.log', true)
  pv.file.capture.outgoing = files.new(pv.vars.capture_root ..'outgoing.log', true)
end

-- Stops a capture
---------------------------------------------------------------------
pv.stopCapture = function()
  pv.logging = T{}
end

---------------------------------------------------------------------------------
-- INITIALIZE
---------------------------------------------------------------------------------
pv.initialize = function()
  pv.mode_strings = T{
      known   = 'known',
      unknown = 'unknown',
      hybrid  = 'hybrid',
      both    = 'hybrid',
      k       = 'known',
      u       = 'unknown',
      h       = 'hybrid',
      b       = 'hybrid',
  }

  pv.output_strings = T{
      console = 'console',
      chatlog = 'chatlog',
      log     = 'chatlog',
      file    = 'file',
      con     = 'console',
      c       = 'console',
      l       = 'chatlog',
      f       = 'file',
  }

  pv.direction_strings = T{
      incoming    = 'incoming',
      ['in']      = 'incoming',
      i           = 'incoming',
      outgoing    = 'outgoing',
      out         = 'outgoing',
      o           = 'outgoing',
      both        = 'both',
      b           = 'both',
      all         = 'both',
      a           = 'both',
  }

  pv.in_set = S{'i', 'in', 'incoming'}
  pv.out_set = S{'o', 'out', 'outgoing'}

  ---------------------------------------------------------------------------------
  -- DISPLAY COLORS AND LOG HEADERS
  ---------------------------------------------------------------------------------

  pv.color = {}
  pv.color.log = { -- Preformatted character codes for log colors.
    SYSTEM       = lib.color[pv.settings.color.system][1],
  }
  pv.color.box = { -- \\cs(#,#,#) values for Windower text boxes
    SYSTEM       = lib.color[pv.settings.color.system][2],
  }

  ---------------------------------------------------------------------------------
  -- VARIABLES AND TEMPLATES
  ---------------------------------------------------------------------------------

  -- Create files for output
  pv.vars = {}
  pv.vars.my_name = windower.ffxi.get_player().name
  pv.file = T{}
  pv.file.full = files.new(pv.settings.file_path.. pv.vars.my_name ..'/full.log', true)
  pv.file.incoming = files.new(pv.settings.file_path.. pv.vars.my_name ..'/incoming.log', true)
  pv.file.outgoing = files.new(pv.settings.file_path.. pv.vars.my_name ..'/outgoing.log', true)

  -- Write schedulers and strings to write
  pv.write_strings = T{}
  pv.write_scheduled = T{}
  pv.write_lock = T{}

  -- Text box setup
  pv.text_base_string = L{
      'ID:   ${_id|-} (${_hexid|0xXXX})    Name:     ${_name|-}',
      'Size: ${_size|-} bytes${_display_padding|  }    Received: ${_time|-}',
      '',
      '${_hextable}'
      }:concat('\n')
  pv.display_base_string = L{
      'ID:   ${_id|-} (${_hexid|0xXXX})    Name:     ${_name|-}',
      'Size: ${_size|-} bytes${_display_padding|  }    Received: ${_time|-}',
      '\\cs(255,0,0)#${_current}/#${_total}\\cr',
      '${_hextable}'
      }:concat('\n')

  pv.tracker = texts.new(pv.text_base_string, pv.settings.tracker, pv.settings)
  pv.display = texts.new(pv.display_base_string, pv.settings.display, pv.settings)

  -- Running data
  pv.tracking = T{
      incoming = S{},
      outgoing = S{},
  }
  pv.logging = T{}
  pv.scan = T{
      active = true,
      mode = 'unknown',
      value = nil,
  }

  pv.saved_packets = L{}

  ---------------------------------------------------------------------------------
  -- EVENTS
  ---------------------------------------------------------------------------------
  
  windower.register_event('incoming chunk', pv.register_packet+{'incoming'})
  windower.register_event('outgoing chunk', pv.register_packet+{'outgoing'})
  
  if not capture then
    windower.register_event('addon command', pv.command)
  end

  --[[
  windower.register_event('addon command', function(command, ...)
      command = command or 'help'
      args = L{...}



  end)
  --]]

  -- Scroll through display packets
  windower.register_event('mouse', function(type, x, y, delta)
      if type == 10 and pv.display:hover(x, y) then
          local index = pv.cap(displayed - delta, 1, pv.saved_packets.n)
          pv.display_packet(index)
      end
  end)

end

if not capture then
  pv.settings = config.load(pv.defaults)
  pv.initialize()
else
  return pv
end

--[[
This code is in the public domain.
]]
