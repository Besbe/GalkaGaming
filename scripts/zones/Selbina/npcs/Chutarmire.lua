-----------------------------------
-- Area: Selbina
--  NPC: Chutarmire
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
        4768,  5814,    -- Scroll of Stone II
        4778,  8190,    -- Scroll of Water II
        4763, 12103,    -- Scroll of Aero II
        4753, 16744,    -- Scroll of Fire II
        4758, 22113,    -- Scroll of Blizzard II
        4773, 28210,    -- Scroll of Thunder II
        4797,  1178,    -- Scroll of Stonega
        4807,  2120,    -- Scroll of Waterga
        4792,  4193,    -- Scroll of Aeroga
        4782,  7103,    -- Scroll of Firaga
        4787, 10829,    -- Scroll of Blizzaga
        4802, 15288,    -- Scroll of Thundaga
        4829, 22932,    -- Scroll of Poison II
        4839, 12740,    -- Scroll of Bio II
        4833,  4695,    -- Scroll of Poisonga
        4859,  8190,    -- Scroll of Shock Spikes
    }

    player:showText(npc, ID.text.CHUTARMIRE_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
