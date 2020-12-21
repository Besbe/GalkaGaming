-----------------------------------
-- Area: Bastok Mines
--  NPC: Galzerio
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        13198, 21997, 1,    --Swordbelt
        17389,   545, 1,    --Bamboo Fishing Rod
        17396,     4, 2,    --Little Worm
        17390,   238, 2,    --Yew Fishing Rod
        13196, 10278, 3,    --Silver Belt
        17395,    11, 3,    --Lugworm
        17391,    66, 3,    --Willow Fishing Rod
        12600,   220, 3,    --Robe
        12728,   121, 3,    --Cuffs
        12856,   176, 3,    --Slops
        12984,   114, 3,    --Ash Clogs
        12464,  1781, 3,    --Headgear
        12592,  2525, 3,    --Doublet
        12720,  1393, 3,    --Gloves
        12848,  1941, 3,    --Brais
        12976,  1297, 3,    --Gaiters
    }

    player:showText(npc, ID.text.GELZERIO_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
