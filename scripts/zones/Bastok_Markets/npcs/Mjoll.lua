-----------------------------------
-- Area: Batok Markets
--  NPC: Mjoll
-- Standard Merchant NPC
-- !pos -318.902 -10.319 -178.087 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")

function onTrigger(player, npc)
    local stock =
    {
        17321,    16, 1, -- Silver Arrow
        17318,     3, 2, -- Wooden Arrow
        17320,     7, 3, -- Iron Arrow
        5069,    199, 3, -- Scroll of Dark Threnody
        5063,   1000, 3, -- Scroll of Ice Threnody
    }

    player:showText(npc, ID.text.MJOLL_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end
