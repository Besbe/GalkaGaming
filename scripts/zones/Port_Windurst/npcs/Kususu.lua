-----------------------------------
-- Area: Port Windurst
--  NPC: Kususu
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4641, 1191, 1,    -- Diaga
        4662, 7181, 1,    -- Stoneskin
        4664,  855, 1,    -- Slow
        4610,  585, 2,    -- Cure II
        4636,  143, 2,    -- Banish
        4646, 1191, 2,    -- Banishga
        4661, 2143, 2,    -- Blink
        4609,   62, 3,    -- Cure
        4615, 1393, 3,    -- Curaga
        4622,  184, 3,    -- Poisona
        4623,  331, 3,    -- Paralyna
        4624,  1012, 3,    -- Blindna
        4631,   84, 3,    -- Dia
        4651,  224, 3,    -- Protect
        4656, 1619, 3,    -- Shell
        4663,  368, 3,    -- Aquaveil
    }

    player:showText(npc, ID.text.KUSUSU_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.WINDURST)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
