-----------------------------------
-- Area: Bastok Markets
--  NPC: Brunhilde
-- Standard Merchant NPC
-- !pos -305.775 -10.319 -152.173 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")

function onTrigger(player, npc)
    local stock =
    {
        12448,   154, 3,    -- Bronze Cap
        12432,  1334, 3,    -- Faceguard
        12433, 13312, 2,    -- Brass Mask
        12416, 33134, 2,    -- Sallet
        12576,   235, 3,    -- Bronze Harness
        12560,  2051, 3,    -- Scale Mail
        12561, 20267, 2,    -- Brass Scale Mail
        12704,   128, 3,    -- Bronze Mittens
        12688,  1094, 3,    -- Scale Finger Gauntlets
        12689, 10716, 2,    -- Brass Finger Gauntlets
        12417, 59109, 1,    -- Mythril Sallet
        12544, 51105, 1,    -- Breastplate
        12672, 26956, 1,    -- Gauntlets
    }

    player:showText(npc, ID.text.BRUNHILDE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end
