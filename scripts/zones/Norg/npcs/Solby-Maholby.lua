-----------------------------------
-- Area: Norg
--  NPC: Solby-Maholby
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        17395,     9,    -- Lugworm
        4899,    450,    -- Earth Spirit Pact
    }

    player:showText(npc, ID.text.SOLBYMAHOLBY_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
