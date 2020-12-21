-----------------------------------
-- Area: Bastok Mines
--  NPC: Deegis
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        12450, 21565, 1,     --Padded Cap
        12424,  10670, 1,     --Iron Mask
        12578, 32747, 1,     --Padded Armor
        12706, 17971, 1,     --Iron Mittens
        12449,  1700, 2,     --Brass Cap
        12440,   457, 2,     --Leather Bandana
        12577,  2584, 2,     --Brass Harness
        12568,   698, 2,     --Leather Vest
        12705,  1419, 2,     --Brass Mittens
        12696,   374, 2,     --Leather Gloves
        12448,   154, 3,     --Bronze Cap
        12576,   235, 3,     --Bronze Harness
        12552, 14572, 3,     --Chainmail
        12704,   128, 3,     --Bronze Mittens
        12680,  7783, 3,     --Chain Mittens
    }

    player:showText(npc, ID.text.DEEGIS_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
