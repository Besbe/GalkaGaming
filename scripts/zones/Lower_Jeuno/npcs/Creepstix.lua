-----------------------------------
-- Area: Lower Jeuno
--  NPC: Creepstix
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        5023,   8160,    -- Scroll of Goblin Gavotte
        4734,   7074,    -- Scroll of Protectra II
        4738,   1760,    -- Scroll of Shellra
    }

    player:showText(npc, ID.text.CREEPSTIX_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
