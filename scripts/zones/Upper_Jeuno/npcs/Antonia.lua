-----------------------------------
-- Area: Upper Jeuno
--  NPC: Antonia
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        17061, 6265,    -- Myrthil Rod
        17027, 11232,    -- Oak Cudgel
        17036, 18048,    -- Mythril Mace
        17044, 6033,    -- Warhammer
        17098, 37440,    -- Oak Pole
        16836, 44550,    -- Halberd
        16774, 10596,    -- Scythe
        17320, 7,    -- Iron Arrow  
    }

    player:showText(npc, ID.text.ANTONIA_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
