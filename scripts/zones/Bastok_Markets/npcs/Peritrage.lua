-----------------------------------
-- Area: Bastok Markets
--  NPC: Peritrage
-- Standard Merchant NPC
-- !pos -286.985 -10.319 -142.586 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")

function onTrigger(player, npc)
    local stock =
    {
          17218, 14158, 1,    -- Zamburak
		  17298,  294,  1,    -- Tathlum
		  17217,  2166,  2,   -- Crossbow
		  17337,  22,    2,   -- Mythril Bolt
		  17216,  165,   3,   -- Light crossbow
		  17336,  5,     3,   -- Crossbow Bolt	
    }

    player:showText(npc, ID.text.PERITRAGE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end
