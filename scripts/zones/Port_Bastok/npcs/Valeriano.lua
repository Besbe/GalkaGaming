-----------------------------------
-- Area: Port Bastok
--  NPC: Valeriano
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4394,    10, -- Ginger Cookie
        17345,   44, -- Flute
        17347,  1012, -- Piccolo
        5017,   598, -- Scroll of Scop's Operetta
        5018, 17296, -- Scroll of Puppet's Operetta
        5013,  2980, -- Scroll of Fowl Aubade
        5027,  2104, -- Scroll of Advancing March
        5072, 92000, -- Scroll of Goddess's Hymnus
    }

    player:showText(npc, ID.text.VALERIANO_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
