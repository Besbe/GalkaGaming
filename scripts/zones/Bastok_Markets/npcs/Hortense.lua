-----------------------------------
-- Area: Bastok Markets
--  NPC: Hortense
-- Standard Merchant NPC
-- !pos -82.503 -4.849 -132.376 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")

function onTrigger(player, npc)
    local stock =
    {
        4976,    66, 3,    -- Scroll of Foe Requiem
        4977,   450, 3,    -- Scroll of Foe Requiem II
        4978,  4048, 3,    -- Scroll of Foe Requiem III
        4979,  7065, 3,    -- Scroll of Foe Requiem IV
        4986,    38, 3,    -- Scroll of Army's Paeon
        4987,   328, 3,    -- Scroll of Army's Paeon II
        4988,  3240, 3,    -- Scroll of Army's Paeon III
        4989,  3312, 3,    -- Scroll of Army's Paeon IV
        5002,    22, 3,    -- Scroll of Valor Minuet
        5003,  1126, 3,    -- Scroll of Valor Minuet II
        5004,  5667, 3,    -- Scroll of Valor Minuet III
    }

    player:showText(npc, ID.text.HORTENSE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end
