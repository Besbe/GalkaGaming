-----------------------------------
-- Area: Windurst Woods
--  NPC: Manyny
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock = {
        5032,  3556,       --Sinewy Etude
        5033,  3182,       --Dextrous Etude
        5034,  2496,       --Vivacious Etude
        5035,  2163,       --Quick Etude
        5036,  1772,       --Learned Etude
        5037,  1431,       --Spirited Etude
        5038,  1131,        --Enchanting Etude
    }
    player:showText(npc, ID.text.MANYNY_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
