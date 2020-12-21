-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ashene
-- Standard Merchant NPC
-- !pos 70 0 61 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        16455,  4979, 1,    -- Baselard
        16532, 19568, 1,    -- Gladius
        16545, 21535, 1,    -- Broadsword
        16576, 41333, 1,    -- Hunting Sword
        16524, 15491, 1,    -- Fleuret
        16450,  1867, 2,    -- Dagger
        16536,  7286, 2,    -- Iron Sword
        16566,  8478, 2,    -- Longsword
        16385,  132,  3,    -- Cesti
		16448,   143, 3,    -- Bronze Dagger
        16449,   855, 3,    -- Brass Dagger
        16531,  3601, 3,    -- Brass Xiphos
        16535,   246, 3,    -- Bronze Sword
        16565,  1711, 3,    -- Spatha
    }

    player:showText(npc, ID.text.ASH_THADI_ENE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
