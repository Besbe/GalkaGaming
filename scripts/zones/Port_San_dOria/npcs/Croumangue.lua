-----------------------------------
-- Area: Port San d'Oria
--  NPC: Croumangue
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4441,  855, 1,    -- Grape Juice
        4419, 7280, 1,    -- Mushroom Soup
        4404,  624, 1,    -- Roast Trout
        4423,  273, 2,    -- Apple Juice
        4537,  473, 2,    -- Roast Carp
        4560, 1370, 2,    -- Vegetable Soup
        4356,  182, 2,    -- White Bread
        4364,  109, 3,    -- Black Bread
        4535,  364, 3,    -- Boiled Crayfish
        4509,   10, 3,    -- Distilled Water
        4455,  182, 3,    -- Pebble Soup
    }

    player:showText(npc, ID.text.CROUMANGUE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
