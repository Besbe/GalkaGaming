-----------------------------------
-- Area: Selbina
--  NPC: Torapiont
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
        16411, 11618,    -- Claws
        16451,  7813,    -- Mythril Dagger
        16513, 11717,    -- Tuck
        16584, 38220,    -- Mythril Claymore
        16643, 11162,    -- Battleaxe
        16705,  4140,    -- Greataxe
        17050,   336,    -- Willow Wand
        17051,  1425,    -- Yew Wand
        17089,   577,    -- Holly Staff
        17307,     9,    -- Dart
        17336,     5,    -- Crossbow Bolt
        17318,     3,    -- Wooden Arrow
        17320,     7,    -- Iron Arrow
    }

    player:showText(npc, ID.text.TORAPIONT_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
