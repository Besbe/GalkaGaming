-----------------------------------
-- Area: Metalworks
--  NPC: Nogga
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        17316,  675, 2,    -- Bomb Arm
        17313, 1083, 3,    -- Grenade
    }

    player:showText(npc, ID.text.NOGGA_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
