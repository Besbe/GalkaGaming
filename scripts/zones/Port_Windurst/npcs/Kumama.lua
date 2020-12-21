-----------------------------------
-- Area: Port Windurst
--  NPC: Kumama
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        12292, 5179, 1,  -- Mahogany Shield 
		12849, 9936, 2,    -- Cotton Brais
        12977, 7498, 2,    -- Cotton Gaiters
        12848, 2194, 3,    -- Brais
        12856,  199, 3,    -- Slops
        12824,  557, 2,    -- Leather Trousers
        12857, 2620, 1,    -- Linen Slops
        12976, 2194, 3,    -- Gaiters
        12984,  128, 3,    -- Ash Clogs
        12952,  349, 3,    -- Leather Highboots
        12992,  629, 3,    -- Solea
        12985, 1690, 1,    -- Holly Clogs
        12289,  124, 3,    -- Lauan Shield
        12290,  629, 2,    -- Maple Shield
    }

    player:showText(npc, ID.text.KUMAMA_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.WINDURST)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
