-----------------------------------
-- Area: Selbina
--  NPC: Quelpia
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4610,   591,    -- Scroll of Cure II
        4611,  3297,    -- Scroll of Cure III
        4616, 10192,    -- Scroll of Curaga II
        4620,  5236,    -- Scroll of Raise
        4629, 31850,    -- Scroll of Holy
        4632, 10192,    -- Scroll of Dia II
        4637,  8190,    -- Scroll of Banish II
        4652,  6437,    -- Scroll of Protect II
        4657, 16016,    -- Scroll of Shell II
        4665, 18200,    -- Scroll of Haste
        4708,  4695,    -- Scroll of Enfire
        4709,  3729,    -- Scroll of Enblizzard
        4710,  2275,    -- Scroll of Enaero
        4711,  1847,    -- Scroll of Enstone
        4712,  1378,    -- Scroll of Enthunder
        4713,  6437,    -- Scroll of Enwater
    }

    player:showText(npc, ID.text.QUELPIA_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
