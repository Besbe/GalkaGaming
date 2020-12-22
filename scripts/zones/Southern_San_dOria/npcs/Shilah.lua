-----------------------------------
-- Area: Southern San dOria
--  NPC: Shilah
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4434, 5050, 1,    -- Mushroom Risotto
        4419, 6370, 1,    -- Mushroom Soup
        4494, 2882, 1,    -- Sah d'Orian Tea
        4356,  184, 2,    -- White Bread
        4533, 1104, 2,    -- Delicious Puls
        4560, 1385, 2,    -- Vegetable Soup
        4572, 1669, 2,    -- Beaugreen Saute
        4441,  855, 2,    -- Grape Juice
        4364,  110, 3,    -- Black Bread
        4492,  552, 3,    -- Puls
        4455,  184, 3,    -- Pebble Soup
        4509,   10, 3,    -- Distilled Water
    }

    player:showText(npc, ID.text.SHILAH_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
