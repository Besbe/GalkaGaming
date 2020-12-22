-----------------------------------
-- Area: Rabao
--  NPC: Scamplix
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Rabao/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4509,    10,    -- Distilled Waterr
        4376,   109,    -- Meat Jerky
        4458,   273,    -- Goblin Bread
        1817,   728,    -- Cactus Arm
        4128,  4397,    -- Ether
        4412,   295,    -- Thundermelon
        4491,   182,    -- Watermelon
        4112,   828,    -- Potion
        4148,   287,    -- Antidote
        4163,  1092,    -- Blinding Potion
        13328, 4095,    -- Mythril Earring
        107,    182,    -- Water Jug
    }

    player:showText(npc, ID.text.SCAMPLIX_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
