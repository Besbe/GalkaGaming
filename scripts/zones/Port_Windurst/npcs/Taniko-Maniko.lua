-----------------------------------
-- Area: Port Windurst
--  NPC: Taniko-Maniko
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
		16769, 2542, 1,    -- Brass Zaghnal
        17154, 7128, 1,    -- Wrapped Bow
		17323, 126,  1,    -- Ice Arrow
		17324, 126,  1,    -- Lightning Arrow
		16649, 5864, 2,    -- Bone Pick
        16405,  104, 2,    -- Cat Baghnakhs
        16385,  129, 2,    -- Cesti
		16649, 5864, 2,    -- Bone Pick
		17153, 482,  2,    -- Self Bow
		17318,   3,  2,    -- Wooden Arrow
		17308,  54,  2,    -- Hawkeye
		17280, 1575, 2,    -- Boomerang
		16642, 4198, 3,    -- Bone Axe
		16768,  309, 3,    -- Bronze Zaghnal
		16832,   97, 3,    -- Harpoon
		17152,   39, 3,    -- Shortbow
		17319,    4, 3,    -- Bone Arrow
    }

    player:showText(npc, ID.text.TANIKOMANIKO_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.WINDURST)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
