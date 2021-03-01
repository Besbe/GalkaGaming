require 'luau'
require 'strings'
res = require('resources')
packets = require('packets')
pack = require('pack')
bit = require 'bit'

_addon.name = 'PriceLog'
_addon.version = '0.2.0'
_addon.author = 'ibm2431'
_addon.commands = {'pricelog'}

my_name = windower.ffxi.get_player().name
my_zone = res.zones[windower.ffxi.get_info().zone].en
my_npc = ''

files = require('files')
file = T{}
file.simple = files.new('data/'.. my_name ..'/logs/simple.log', true)
file.raw = files.new('data/'.. my_name ..'/logs/raw.log', true)

local resale_database = {}
if files.exists('data/'.. my_name ..'/database.lua') then
  resale_database = require('data/'.. my_name ..'/database')
  file.database = files.new('data/'.. my_name ..'/database.lua', true)
else
  file.database = files.new('data/'.. my_name ..'/database.lua')
end

prices = resale_database or {}
new_items = false
checked_unseen = false
write_scheduled = false

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

-- Sets up tables and files for use in the current zone
--------------------------------------------------
function setup_zone(zone)
	local current_zone = res.zones[zone].en;
	file.simple = files.new('data/'.. my_name ..'/simple/'.. current_zone ..'.log', true)
	file.raw = files.new('data/'.. my_name ..'/raw/'.. current_zone ..'.log', true)
	write_full_table()
end

-- Checks to see if the current zone table had new prices
-- and if so, rewrites the entire price database
--------------------------------------------------
function write_full_table()
  if new_items then
    -- Lua can't natively sort by key, so we need to get a sorted table of keys first.
    -- We also get to go through the prices table twice because of this.
    -- This is on top of the O for sorting.
    local sorted_item_ids = {}
    for id, _ in pairs(prices) do
      table.insert(sorted_item_ids, id)
    end
    table.sort(sorted_item_ids) -- We now have a sorted table of keys...

    local table_to_write = "local resale_database =\n{\n" -- Start up the table.
    for _, id in ipairs(sorted_item_ids) do
      -- Now we can use ipairs to guarantee the pairs are gone through in order.
      local item = prices[id]
      table_to_write = table_to_write .. format_table_entry(id, item['name'], item['price'], item['char'], item['zone'], item['npc'])
    end
    table_to_write = table_to_write .. "}\nreturn resale_database"
    file.database:write(table_to_write)
    new_items = false
    write_scheduled = false
    checked_unseen = false
    windower.add_to_chat(7, "[PriceLog] New items saved to database!")
  end
end

-- Checks to see if a price should be added to the database
-- and does so if the item has not been seen before
--------------------------------------------------
function add_to_database(id, name, price)
  if not prices[id] then
    prices[id] = {
      ['id'] = id,
      ['name'] = name,
      ['price'] = price,
      ['char'] = my_name,
      ['zone'] = my_zone,
      ['npc'] = my_npc
    }
    windower.add_to_chat(7, "[PriceLog] Added: ".. id .. " (".. name ..") - ".. price .."g")
    new_items = true
    if not write_scheduled then
      coroutine.schedule(function() write_full_table() end, 45)
      write_scheduled = true
    end
  end
end

-- Returns a string representing an entry for the lua database
--------------------------------------------------
function format_table_entry(item_id, item_name, price, char, zone, npc)
  if not char then char = '' end
  if not zone then zone = '' end
  if not npc then npc = '' end
	return string.format(
    "    [%d] = {id=%d, name=\"%s\", price=%d, char=\"%s\", zone=\"%s\", npc=\"%s\"},\n",
    item_id,
    item_id,
    string.gsub(item_name, '"', '\"'),
    price,
    char,
    zone,
    npc
  )
end

-- Checks the current inventory for any unseen items
--------------------------------------------------
function check_for_unseen()
	local unseen_list = ''
	local inventory = windower.ffxi.get_items(0)
	for _, inv_item in ipairs(inventory) do
		local id = inv_item['id']
		if id and id > 0 then
			local item = res.items[id]
			if (not item.flags['No NPC Sale']) and (not prices[id]) then
				unseen_list = unseen_list .. item['en'] .. ", "
			end
		end
	end
	if unseen_list ~= '' then
		windower.add_to_chat(7, "[PriceLog] Unseen: " .. unseen_list)
	end
	checked_unseen = true
end

-- Checks incoming chunks for price response and log them
--------------------------------------------------
function check_incoming_chunk(id, data, modified, injected, blocked)
  local update_packet = packets.parse('incoming', data)
  local raw_header = ""
  local mob
  local mob_name
  local log_string = "Incoming: "
  if (id == 0x03D) then
    local type = 1
    if update_packet['Type'] then
      type = update_packet['Type']
    end
    
    if type == 0 then -- Make sure this is a price response and not sale finalization
      local index = update_packet['Inventory Index']
      local item_id = windower.ffxi.get_items(0, index)['id']
      local item = res.items[item_id]

      log_string = log_string .. '0x03D (Price Response), '
      log_string = log_string .. 'Item: ' .. item_id .. ' (' .. item['en'] ..')'
      log_string = log_string .. ' Price: ' .. update_packet['Price']
      log_string = log_string .. ' Character: ' .. my_name
      log_string = log_string .. ' Zone: ' .. my_zone
      log_string = log_string .. ' NPC: ' .. my_npc

      if not checked_unseen then
        check_for_unseen()
      end

      add_to_database(item_id, item['en'], update_packet['Price'])
      file.simple:append(log_string .. "\n\n")
      file.raw:append(log_string .. '\n'.. data:hexformat_file() .. '\n')
    end
  end
end

-- Checks outgoing chunks for NPC pokes to track NPC being talked to
--------------------------------------------------
function check_outgoing_chunk(id, data, modified, injected, blocked)
  local packet = packets.parse('outgoing', data)
  if (id == 0x01A) then
    local mob = windower.ffxi.get_mob_by_id(packet['Target'])
    if mob then
      my_npc = mob.name
    end
  end
end

-- Keeps track of current zone so we don't ping get_info every time
--------------------------------------------------
windower.register_event('zone change', function(new, old)
  my_zone = res.zones[new].en
end)

windower.register_event('zone change', function(new, old)
  setup_zone(new)
end)

windower.register_event('incoming chunk', check_incoming_chunk)
windower.register_event('outgoing chunk', check_outgoing_chunk)
setup_zone(windower.ffxi.get_info().zone)
