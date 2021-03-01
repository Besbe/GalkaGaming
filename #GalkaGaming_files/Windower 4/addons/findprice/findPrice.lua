--[[
Copyright © 2013-2015, Giuliano Riccio
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.
* Neither the name of findAll nor the
names of its contributors may be used to endorse or promote products
derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Giuliano Riccio BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

_addon.name    = 'findPrice'
_addon.author  = 'Zohno (findAll), ibm2431 (price mod)'
_addon.version = '1.20210117'
_addon.commands = {'findall'}

require('chat')
require('lists')
require('logger')
require('sets')
require('tables')
require('strings')
require('pack')

file  = require('files')
slips = require('slips')
config = require('config')
texts = require('texts')
res = require('resources')

-- FINDPRICE SPECIFIC START
require('capture-lib')
priceLog = {}
priceLog.notified = {}

require 'luau'
require 'strings'
packets = require('packets')
pack = require('pack')
bit = require 'bit'

findPrice = T{}
local resale_database = {}
if file.exists('data/price_database.lua') then
  resale_database = require('data/price_database')
  findPrice.database = file.new('data/price_database.lua', true)
else
  findPrice.database = file.new('data/price_database.lua')
end
prices = resale_database or {}

price_search = false

acceptable_npcs =
{
  ['Challoux'] = true,
  ['Caiphimonride'] = true,
  ['Curio Vendor Moogle'] = true,
}
-- FINDPRICE SPECIFIC END


defaults = {}
defaults.Track = ''
defaults.Tracker = {}
defaults.KeyItemDisplay = true

settings = config.load(defaults)

tracker = texts.new(settings.Track, settings.Tracker, settings)

do
    config.register(settings, function(settings)
        tracker:text(settings.Track)
        tracker:visible(settings.Track ~= '' and windower.ffxi.get_info().logged_in)
    end)

    local bag_ids = res.bags:rekey('english'):key_map(string.lower):map(table.get-{'id'})

    local variable_cache = S{}
    tracker:register_event('reload', function()
        for variable in tracker:it() do
            local bag_name, search = variable:match('(.*):(.*)')

            local bag = bag_name == 'all' and 'all' or bag_ids[bag_name:lower()]
            if not bag and bag_name ~= 'all' then
                warning('Unknown bag: %s':format(bag_name))
            else
                if not S{'$freespace', '$usedspace', '$maxspace'}:contains(search:lower()) then
                    local items = S(res.items:name(windower.wc_match-{search})) + S(res.items:name_log(windower.wc_match-{search}))
                    if items:empty() then
                        warning('No items matching "%s" found.':format(search))
                    else
                        variable_cache:add({
                            name = variable,
                            bag = bag,
                            type = 'item',
                            ids = items:map(table.get-{'id'}),
                            search = search,
                        })
                    end
                else
                    variable_cache:add({
                        name = variable,
                        bag = bag,
                        type = 'info',
                        search = search,
                    })
                end
            end
        end
    end)

    do
        local update = T{}

        local search_bag = function(bag, ids)
            return bag:filter(function(item)
                return type(item) == 'table' and ids:contains(item.id)
            end):reduce(function(acc, item)
                return type(item) == 'table' and item.count + acc or acc
            end, 0)
        end

        local last_check = 0

        windower.register_event('prerender', function()
            if os.clock() - last_check < 0.25 then
                return
            end
            last_check = os.clock()

            local items = T{}
            for variable in variable_cache:it() do
                if variable.type == 'info' then
                    local info
                    if variable.bag == 'all' then
                        info = {
                            max = 0,
                            count = 0
                        }
                        for bag_info in T(windower.ffxi.get_bag_info()):it() do
                            info.max = info.max + bag_info.max
                            info.count = info.count + bag_info.count
                        end
                    else
                        info = windower.ffxi.get_bag_info(variable.bag)
                    end

                    update[variable.name] =
                        variable.search == '$freespace' and (info.max - info.count)
                        or variable.search == '$usedspace' and info.count
                        or variable.search == '$maxspace' and info.max
                        or nil
                elseif variable.type == 'item' then
                    if variable.bag == 'all' then
                        for id in bag_ids:it() do
                            if not items[id] then
                                items[id] = T(windower.ffxi.get_items(id))
                            end
                        end
                    else
                        if not items[variable.bag] then
                            items[variable.bag] = T(windower.ffxi.get_items(variable.bag))
                        end
                    end

                    update[variable.name] = variable.bag ~= 'all' and search_bag(items[variable.bag], variable.ids) or items:reduce(function(acc, bag)
                        return acc + search_bag(bag, variable.ids)
                    end, 0)
                end
            end

            if not update:empty() then
                tracker:update(update)
            end
        end)
    end
end

zone_search            = windower.ffxi.get_info().logged_in
first_pass             = true
item_names             = T{}
key_item_names         = T{}
global_storages        = T{}
storages_path          = 'data/'
storages_order_tokens  = L{'temporary', 'inventory', 'wardrobe', 'wardrobe 2', 'safe', 'safe 2', 'storage', 'locker', 'satchel', 'sack', 'case'}
-- This is to maintain sorting order. I don't know why this was done, but omitting this will sort the bags arbitrarily, which (I guess) was not intended
storages_order         = S(res.bags:map(string.gsub-{' ', ''} .. string.lower .. table.get-{'english'})):sort(function(name1, name2)
    local index1 = storages_order_tokens:find(name1)
    local index2 = storages_order_tokens:find(name2)

    if not index1 and not index2 then
        return name1 < name2
    end

    if not index1 then
        return false
    end

    if not index2 then
        return true
    end

    return index1 < index2
end)
storage_slips_order    = L{'slip 01', 'slip 02', 'slip 03', 'slip 04', 'slip 05', 'slip 06', 'slip 07', 'slip 08', 'slip 09', 'slip 10', 'slip 11', 'slip 12', 'slip 13', 'slip 14', 'slip 15', 'slip 16', 'slip 17', 'slip 18', 'slip 19', 'slip 20', 'slip 21', 'slip 22', 'slip 23', 'slip 24', 'slip 25', 'slip 26', 'slip 27', 'slip 28'}
merged_storages_orders = storages_order + storage_slips_order + L{'key items'}

function search(query, export)
    update_global_storage()
    update()
    if query:length() == 0 then
        return
    end

    local character_set    = S{}
    local character_filter = S{}
    local terms            = ''

    for _, query_element in ipairs(query) do
        local char = query_element:match('^([:!]%a+)$')
        if char then
            if char:sub(1, 1) == '!' then
                character_filter:add(char:sub(2):lower():gsub("^%l", string.upper))
            else
                character_set:add(char:sub(2):lower():gsub("^%l", string.upper))
            end
        else
            terms = query_element
        end
    end

    if character_set:length() == 0 and terms == '' then
        return
    end

    local new_item_ids = S{}
    local new_key_item_ids = S{}

    for character_name, storages in pairs(global_storages) do
        for storage_name, storage in pairs(storages) do
            if storage_name == 'key items' then
                for id, quantity in pairs(storage) do
                    id = tostring(id)

                    if key_item_names[id] == nil then
                        new_key_item_ids:add(id)
                    end
                end
            elseif storage_name ~= 'gil' then
                for id, quantity in pairs(storage) do
                    id = tostring(id)

                    if item_names[id] == nil then
                        new_item_ids:add(id)
                    end
                end
            end
            coroutine.yield()
        end
    end

    for id,_ in pairs(new_item_ids) do
        local item = res.items[tonumber(id)]
      if item then
            item_names[id] = {
                ['name'] = item.name,
                ['long_name'] = item.name_log
            }
        end
    end

    for id,_ in pairs(new_key_item_ids) do
        local key_item = res.key_items[tonumber(id)]
      if key_item then
            key_item_names[id] = {
                ['name'] = key_item.name,
                ['long_name'] = key_item.name
            }
        end
    end
    

    local results_items     = S{}
    local results_key_items = S{}
    local terms_pattern     = ''

    if terms ~= '' then
        terms_pattern = terms:escape():gsub('%a', function(char) return string.format("[%s%s]", char:lower(), char:upper()) end)
    end

    for id, names in pairs(item_names) do
        if terms_pattern == '' or item_names[id].name:find(terms_pattern)
            or item_names[id].long_name:find(terms_pattern)
        then
            results_items:add(id)
        end
    end
    
    if settings.KeyItemDisplay then
          for id in pairs(key_item_names) do
               if terms_pattern == '' or key_item_names[id].name:match(terms_pattern) then
                    results_key_items:add(id)
               end
          end
     end

    -- FINDPRICE SPECIFIC START
    if price_search then
      log('Searching for new prices for: '..query:concat(' '))
    else
    -- FINDPRICE SPECIFIC END
      log('Searching: '..query:concat(' '))
    -- FINDPRICE SPECIFIC START
    end
    -- FINDPRICE SPECIFIC END

    local no_results   = true
    local sorted_names = global_storages:keyset():sort()
                                                 :reverse()

    if windower.ffxi.get_info().logged_in then
        sorted_names = sorted_names:append(sorted_names:remove(sorted_names:find(windower.ffxi.get_player().name)))
                               :reverse()
    end

    local export_file

    if export ~= nil then
        export_file = io.open(windower.addon_path..'data/'..export, 'w')

        if export_file == nil then
            error('The file "'..export..'" cannot be created.')
        else
            export_file:write('"char";"storage";"item";"quantity"\n')
        end
    end

    local total_quantity = 0
    
    for _, character_name in ipairs(sorted_names) do
        if (character_set:length() == 0 or character_set:contains(character_name)) and not character_filter:contains(character_name) then
            local storages = global_storages[character_name]

            for _, storage_name in ipairs(merged_storages_orders) do
                local results = L{}
                
                local new_price_item = false -- FINDPRICE SPECIFIC

                if storage_name~= 'gil' and storages[storage_name] ~= nil then
                    for id, quantity in pairs(storages[storage_name]) do
                        if storage_name == 'key items' and results_key_items:contains(id) then
                            if not price_search then -- FINDPRICE SPECIFIC
                                if terms_pattern ~= '' then
                                    total_quantity = total_quantity + quantity
                                    results:append(
                                        (character_name..'/'..storage_name..':'):color(259)..' '..
                                        key_item_names[id].name:gsub('('..terms_pattern..')', ('%1'):color(258))..
                                        (quantity > 1 and ' '..('('..quantity..')'):color(259) or '')
                                    )
                                else
                                    results:append(
                                        (character_name..'/'..storage_name..':'):color(259)..' '..key_item_names[id].name..
                                        (quantity > 1 and ' '..('('..quantity..')'):color(259) or '')
                                    )
                                end

                                if export_file ~= nil then
                                    export_file:write('"'..character_name..'";"'..storage_name..'";"'..key_item_names[id].name..'";"'..quantity..'"\n')
                                end

                                no_results = false
                            end -- FINDPRICE SPECIFIC
                        elseif storage_name ~= 'key items' and results_items:contains(id) then
                            -- FINDPRICE SPECIFIC START
                            local found_price = prices[tonumber(id)]
                            local findprice_item = res.items[tonumber(id)]
                            local can_sell = not findprice_item.flags['No NPC Sale']
                            local not_acceptable = true
                            if found_price and acceptable_npcs[found_price.npc] then
                              not_acceptable = false
                            end
                            if can_sell and not_acceptable then
                              new_price_item = true
                            else
                              new_price_item = false
                            end
                            
                            if new_price_item or (not price_search) then
                            -- FINDPRICE SPECIFIC END
                              if terms_pattern ~= '' then
                                  total_quantity = total_quantity + quantity
                                  results:append(
                                      (character_name..'/'..storage_name..':'):color(259)..' '..
                                      item_names[id].name:gsub('('..terms_pattern..')', ('%1'):color(258))..
                                      (item_names[id].name:match(terms_pattern) and '' or ' ['..item_names[id].long_name:gsub('('..terms_pattern..')', ('%1'):color(258))..']')..
                                      (quantity > 1 and ' '..('('..quantity..')'):color(259) or '')
                                  )
                              else
                                  results:append(
                                      (character_name..'/'..storage_name..':'):color(259)..' '..item_names[id].name..
                                      (quantity > 1 and ' '..('('..quantity..')'):color(259) or '')
                                  )
                              end

                              if export_file ~= nil then
                                  export_file:write('"'..character_name..'";"'..storage_name..'";"'..item_names[id].name..'";"'..quantity..'"\n')
                              end

                              no_results = false
                            -- FINDPRICE SPECIFIC START
                            end
                            -- FINDPRICE SPECIFIC END
                        end
                    end

                    results:sort()

                    for i, result in ipairs(results) do
                        log(result)
                    end
                end
                coroutine.yield()
            end
        end
    end

    if total_quantity > 0 then
        log('Total: ' .. total_quantity)
    end

    if export_file ~= nil then
        export_file:close()
        log('The results have been saved to "'..export..'"')
    end

    if no_results then
        if terms ~= '' then
            if character_set:length() == 0 and character_filter:length() == 0 then
              -- FINDPRICE SPECIFIC START
              if price_search then
                log('You have no new items that match \''..terms..'\'.')
              else
              -- FINDPRICE SPCIFIC END
                log('You have no items that match \''..terms..'\'.')
              -- FINDPRICE SPECIFIC START
              end
              -- FINDPRICE SPCIFIC END
            else
              -- FINDPRICE SPECIFIC START
              if price_search then
                log('You have no new items that match \''..terms..'\' on the specified characters.')
              else
              -- FINDPRICE SPCIFIC END
                log('You have no items that match \''..terms..'\' on the specified characters.')
              -- FINDPRICE SPECIFIC START
              end
              -- FINDPRICE SPCIFIC END
            end
        else
            log('You have no items on the specified characters.')
        end
    end
    
    price_search = false -- FINDPRICE SPECIFIC
end

function get_local_storage()
    local items    = windower.ffxi.get_items()
    local storages = {}

    if not items then
        return false
    end

    storages.gil = items.gil

    for _, storage_name in ipairs(storages_order) do
        storages[storage_name] = T{}

        for _, data in ipairs(items[storage_name]) do
            if type(data) == 'table' then
        if data.id ~= 0 then
          local id = tostring(data.id)
          storages[storage_name][id] = (storages[storage_name][id] or 0) + data.count
        end
      end
        end
    end

    local slip_storages = slips.get_player_items()

    for _, slip_id in ipairs(slips.storages) do
        local slip_name     = 'slip '..tostring(slips.get_slip_number_by_id(slip_id)):lpad('0', 2)
        storages[slip_name] = T{}

        for _, id in ipairs(slip_storages[slip_id]) do
            storages[slip_name][tostring(id)] = 1
        end
    end
    
    local key_items= windower.ffxi.get_key_items()
    
    storages['key items'] = T{}
    
    for _, id in ipairs(key_items) do
        storages['key items'][tostring(id)] = 1
    end

    return storages
end

function encase_key(key)
    if type(key) == 'number' then
        return '['..tostring(key)..']'
    elseif type(key) == 'string' then
        return '["'..key..'"]'
    else
        return tostring(key)
    end
end

function make_table(tab,tab_offset)
    -- Won't work for circular references or keys containing double quotes
    local offset = " ":rep(tab_offset)
    local ret = "{\n"
    for i,v in pairs(tab) do
        ret = ret..offset..encase_key(i)..' = '
        if type(v) == 'table' then
            ret = ret..make_table(v,tab_offset+2)..',\n'
        else
            ret = ret..tostring(v)..',\n'
        end
    end
    return ret..offset..'}'
end

function update()
    if not windower.ffxi.get_info().logged_in then
        print('You have to be logged in to use this addon.')
        return false
    end

    if zone_search == false then
        notice('findPrice has not detected a fully loaded inventory yet.')
        return false
  end

    local player_name   = windower.ffxi.get_player().name
    local self_storage  = file.new(storages_path..'\\'..player_name..'.lua')

    if not self_storage:exists() then
        self_storage:create()
    end
    
  local local_storage = get_local_storage()

  if local_storage then
    global_storages[player_name] = local_storage
  else
    return false
  end
    
    self_storage:write('return '..make_table(local_storage,0)..'\n')
    
    -- FINDPRICE SPECIFIC START
    checked_unseen = false
    priceLog.check_for_unseen()
    -- FINDPRICE SPECIFIC END
    
    collectgarbage()
    return true
end


function update_global_storage()
    local player_name   = windower.ffxi.get_player().name
    
    global_storages = T{} -- global_storages[server str][character_name str][inventory_name str][item_id num] = count num
    
    for _,f in pairs(windower.get_dir(windower.addon_path.."\\"..storages_path)) do
        if f:sub(-4) == '.lua' and f:sub(1,-5) ~= player_name then
            local success,result = pcall(dofile,windower.addon_path..'\\'..storages_path..'\\'..f)
            if success then
                global_storages[f:sub(1,-5)] = result
            else
                warning('Unable to retrieve updated item storage for %s.':format(f:sub(1,-5)))
            end
        end
    end
end


-- FINDPRICE SPECIFIC START

my_name = windower.ffxi.get_player().name
my_zone = res.zones[windower.ffxi.get_info().zone].en
my_npc = ''

new_items = false
checked_unseen = false
write_scheduled = false

fields = {
  ['always_string'] = {
    ['name'] = true,
    ['char'] = true,
    ['zone'] = true,
    ['npc'] = true,
  },
  ['padding'] = {
    ['id'] = 13,
    ['name'] = 34,
    ['price'] = 17,
    ['char'] = 20,
    ['zone']= 33,
    ['npc'] = 30,
  }
}

-- Sets up tables and files for use in the current zone
--------------------------------------------------
priceLog.setup_zone = function(zone)
  local current_zone = res.zones[zone].en
  my_zone = current_zone
  findPrice.simple = file.new('data/'.. my_name ..'/simple/'.. current_zone ..'.log', true)
  findPrice.raw = file.new('data/'.. my_name ..'/raw/'.. current_zone ..'.log', true)
  priceLog.write_full_table()
  priceLog.notified = {}
end

priceLog.loadDatabase = function(path)
  local memory = {}
  local database = {}
  
  priceLog.toLoad = files.new(path ..'.lua', true)
  if priceLog.toLoad:exists(path ..'.lua') then
    package.loaded[path] = nil
    database = require(path)
    for k, v in pairs(database) do
      memory[k] = v
    end
  end
  return memory
end

priceLog.shouldUpdate = function(memory_price_info, file_price_info)
  if not file_price_info then
    return true
  elseif acceptable_npcs[memory_price_info.npc] and (not acceptable_npcs[file_price_info.npc]) then
    return true
  end
  return false
end

-- Checks to see if the current zone table had new prices
-- and if so, rewrites the entire price database
--------------------------------------------------
priceLog.write_full_table = function()
  local file_database = priceLog.loadDatabase('data/price_database')
  local prices, updated_npcs = lib.meldDatabases(prices, file_database, priceLog.shouldUpdate)
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
      table_to_write = table_to_write .. priceLog.format_table_entry(id, item['name'], item['price'], item['char'], item['zone'], item['npc'])
    end
    table_to_write = table_to_write .. "}\nreturn resale_database"
    findPrice.database:write(table_to_write)
    new_items = false
    write_scheduled = false
    windower.add_to_chat(7, "[FindPrice] New items saved to database!")
  end
  checked_unseen = false
end

-- Checks to see if a price should be added to the database
-- and does so if the item has not been seen before
--------------------------------------------------
priceLog.add_to_database = function(id, name, price)
  local item = prices[id]
  if (not item) or (not acceptable_npcs[item.npc]) then
    prices[id] = {
      ['id'] = id,
      ['name'] = name,
      ['price'] = price,
      ['char'] = my_name,
      ['zone'] = my_zone,
      ['npc'] = my_npc
    }
    windower.add_to_chat(7, "[FindPrice] Added: ".. id .. " (".. name ..") - ".. price .."g")
    new_items = true
    if not write_scheduled then
      coroutine.schedule(function() priceLog.write_full_table() end, 45)
      write_scheduled = true
    end
  end
end

-- Returns a string representing an entry for the lua database
--------------------------------------------------
priceLog.format_table_entry = function(item_id, item_name, price, char, zone, npc)
  if not char then char = '' end
  if not zone then zone = '' end
  if not npc then npc = '' end
  return string.format(
    "    [%s] = {%s %s %s %s %s %s},\n",
    lib.padLeft(tostring(item_id), 5),
    padField('id', item_id),
    padField('name', string.gsub(item_name, '"', '\"')),
    padField('price', price),
    padField('char', char),
    padField('zone', zone),
    padField('npc', npc)
  )
end

padField = function(field, value)
  local padding = fields.padding[field]
  if fields.always_string[field] then
    return lib.padRight("['".. field .."']=\"".. value .. "\",", padding)
  else
    return lib.padRight("['".. field .."']=".. value .. ",", padding)
  end
end

-- Checks the current inventory for any unseen items
--------------------------------------------------
priceLog.check_for_unseen = function()
  local unseen_list = ''
  local inventory = windower.ffxi.get_items(0)
  for _, inv_item in ipairs(inventory) do
    local id = inv_item['id']
    if id and id > 0 then
      local item = res.items[id]
      local db_entry = prices[id]
      if (not item.flags['No NPC Sale']) and ((not db_entry) or (not acceptable_npcs[db_entry.npc])) then
        if not priceLog.notified[id] then
          unseen_list = unseen_list .. item['en'] .. ", "
          priceLog.notified[id] = true
        end
      end
    end
  end
  if unseen_list ~= '' then
    windower.add_to_chat(7, "[FindPrice] Unseen: " .. unseen_list)
  end
  checked_unseen = true
end

-- Checks incoming chunks for price response and log them
--------------------------------------------------
priceLog.check_incoming_chunk = function(id, data, modified, injected, blocked)
  local log_string = "Incoming: "
  if (id == 0x03D) then
    local update_packet = packets.parse('incoming', data)
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
        priceLog.check_for_unseen()
      end

      priceLog.add_to_database(item_id, item['en'], update_packet['Price'])
      findPrice.simple:append(log_string .. "\n\n")
      findPrice.raw:append(log_string .. '\n'.. data:hexformat_file() .. '\n')
    end
  end
end

-- Checks outgoing chunks for NPC pokes to track NPC being talked to
--------------------------------------------------
priceLog.check_outgoing_chunk = function(id, data, modified, injected, blocked)
  if (id == 0x01A) then
    local packet = packets.parse('outgoing', data)
    local mob = windower.ffxi.get_mob_by_id(packet['Target'])
    if mob then
      my_npc = mob.name
    end
  end
end
-- FINDPRICE SPECIFIC END



windower.register_event('load', update:cond(function() return windower.ffxi.get_info().logged_in end))

windower.register_event('incoming chunk', function(id,original,modified,injected,blocked)
  local seq = original:unpack('H',3)
  if (next_sequence and seq == next_sequence) and zone_search then
    update()
    next_sequence = nil
  end

  if id == 0x00B then -- Last packet of an old zone
    zone_search = false
  elseif id == 0x00A then -- First packet of a new zone, redundant because someone could theoretically load findPrice between the two
    zone_search = false
  elseif id == 0x01D and not zone_search then
  -- This packet indicates that the temporary item structure should be copied over to
  -- the real item structure, accessed with get_items(). Thus we wait one packet and
  -- then trigger an update.
    zone_search = true
    next_sequence = (seq+22)%0x10000 -- 128 packets is about 1 minute. 22 packets is about 10 seconds.
  elseif (id == 0x1E or id == 0x1F or id == 0x20) and zone_search then
    -- Inventory Finished packets aren't sent for trades and such, so this is more
    -- of a catch-all approach. There is a subtantial delay to avoid spam writing.
    -- The idea is that if you're getting a stream of incoming item packets (like you're gear swapping in an intense fight),
    -- then it will keep putting off triggering the update until you're not.
    next_sequence = (seq+22)%0x10000
  end
  

  -- FINDPRICE SPECIFIC START
  priceLog.check_incoming_chunk(id, original, modified, injected, blocked)
  -- FINDPRICE SPECIFIC END

end)

-- FINDPRICE SPECIFIC START
windower.register_event('outgoing chunk', function(id,original,modified,injected,blocked)
  priceLog.check_outgoing_chunk(id, original, modified, injected, blocked)
end)

windower.register_event('zone change', function(new, old)
  priceLog.setup_zone(new)
end)

priceLog.setup_zone(windower.ffxi.get_info().zone)
-- FINDPRICE SPECIFIC END


windower.register_event('ipc message', function(str)
    if str == 'findall update' then
        update()
    end
end)

handle_command = function(...)
    if first_pass then
        first_pass = false
        windower.send_ipc_message('findall update')
        windower.send_command('wait 0.05;findall '..table.concat({...},' '))
    else
        first_pass = true
        local params = L{...}
        local query  = L{}
        local export = nil

        -- convert command line params (SJIS) to UTF-8
        for i, elm in ipairs(params) do
            params[i] = windower.from_shift_jis(elm)
        end

        while params:length() > 0 and params[1]:match('^[:!]%a+$') do
            query:append(params:remove(1))
        end

        if params:length() > 0 then
            export = params[params:length()]:match('^--export=(.+)$') or params[params:length()]:match('^-e(.+)$')

            if export ~= nil then
                export = export:gsub('%.csv$', '')..'.csv'

                params:remove(params:length())

                if export:match('['..('\\/:*?"<>|'):escape()..']') then
                    export = nil

                    error('The filename cannot contain any of the following characters: \\ / : * ? " < > |')
                end
            end

            query:append(params:concat(' '))
        end

        search(query, export, false)
    end
end

windower.register_event('unhandled command', function(command, ...)
    if command:lower() == 'find' then
        price_search = false
        local me = windower.ffxi.get_mob_by_target('me')
        if me then
            handle_command(':%s':format(me.name), ...)
        else
            handle_command(...)
        end
    elseif command:lower() == 'findprice' then
        price_search = true
        local me = windower.ffxi.get_mob_by_target('me')
        if me then
            handle_command(':%s':format(me.name), ...)
        else
            handle_command(...)
        end
    end
end)

windower.register_event('addon command', handle_command)

