-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Tavourine
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        16584, 38640, 1,    -- Mythril Claymore
        16466,  2231, 1,    -- Knife
        17060,  2439, 1,    -- Rod
        16640,   287, 2,    -- Bronze Axe
        16465,   149, 2,    -- Bronze Knife
        17081,   91, 2,    -- Brass Rod
        16583,  2475, 2,    -- Claymore
        17035,  4411, 2,    -- Mace
        17081,   627, 3,    -- Brass Rod
        17034,   171, 3,    -- Bronze Mace
    }

    player:showText(npc, ID.text.TAVOURINE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
