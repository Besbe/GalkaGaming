-----------------------------------
-- Area: Upper Jeuno
--  NPC: Coumuna
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        16705,  4186,    -- Greataxe
        16518, 31000,    -- Mythril Degen
        16460, 11128,    -- Kris
        16467, 14560,    -- Mythril Knife
        16399, 15488,    -- Katars
        16589, 13962,    -- Two-Handed Sword
        16412, 29760,    -- Mythril Claws
        16567, 85250,    -- Knight's Sword
    }

    player:showText(npc, ID.text.COUMUNA_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
