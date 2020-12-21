-----------------------------------
-- Area: Lower Jeuno
--  NPC: Hasim
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4612,  23400,    -- Scroll of Cure IV
        4616,  11200,    -- Scroll of Curaga II
        4617,  19932,    -- Scroll of Curaga III
        4653,  32000,    -- Scroll of Protect III
        4668,   1760,    -- Scroll of Barfire
        4669,   3624,    -- Scroll of Barblizzard
        4670,    930,    -- Scroll of Baraero
        4671,    156,    -- Scroll of Barstone
        4672,   5754,    -- Scroll of Barthunder
        4673,    360,    -- Scroll of Barwater
        4674,   1760,    -- Scroll of Barfira
        4675,   3624,    -- Scroll of Barblizzara
        4676,    930,    -- Scroll of Baraera
        4677,    156,    -- Scroll of Barstonra
        4678,   5754,    -- Scroll of Barthundra
        4679,    360,    -- Scroll of Barwatera
        4680,    244,    -- Scroll of Barsleep
    }

    player:showText(npc, ID.text.HASIM_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
