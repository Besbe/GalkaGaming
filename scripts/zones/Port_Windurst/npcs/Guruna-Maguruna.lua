-----------------------------------
-- Area: Port Windurst
--  NPC: Guruna-Maguruna
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        13090, 4854, 1,     -- Beetle Gorget
		12593, 14277, 2,    -- Cotton Doublet
        12721,  7737, 2,    -- Cotton Gloves
        13085,   1123, 3,   -- Hemp Gorget
        12592,  2854, 3,    -- Doublet
        12600,   249, 3,    -- Robe
        12568,   698, 3,    -- Leather Vest
        12608,  1456, 2,    -- Tunic
        12601,  3208, 1,    -- Linen Robe
        12720,  1575, 3,    -- Gloves
        12728,   137, 3,    -- Cuffs
        12696,   324, 3,    -- Leather Gloves
        12736,   681, 2,    -- Mitts
        12729,  1814, 1,    -- Linen Cuffs
    }

    player:showText(npc, ID.text.GURUNAMAGURUNA_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.WINDURST)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
