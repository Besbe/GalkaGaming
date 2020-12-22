-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Thadiene
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        17280,  1610, 1,    -- Boomerang
        17162, 22684, 1,    -- Great Bow
        17321,    16, 1,    -- Silver Arrow
        17154,  7999, 1,    -- Wrapped Bow
        17336,     5, 2,    -- Crossbow Bolt
        17322,   128, 2,    -- Fire Arrow
        17320,     7, 2,    -- Iron Arrow
        17153,   493, 2,    -- Self Bow
        17160,   452, 3,    -- Longbow
        17152,    40, 3,    -- Shortbow
        17318,     3, 3,    -- Wooden Arrow
        5029,   4416, 3,    -- Scroll of Battlefield Elegy
    }

    player:showText(npc, ID.text.ASH_THADI_ENE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
