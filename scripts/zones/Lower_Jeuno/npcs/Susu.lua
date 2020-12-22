-----------------------------------
-- Area: Lower Jeuno
--  NPC: Susu
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4647,   20000,    -- Banishga ii
		4683,   2030,     -- Barblind
		4697,   2030,     -- Barblindra
		4682,   780,      -- Barparalyze
		4696,   780,      -- Barparalyzra
		4681,   400,      -- Barpoison
		4695,   400,      -- Barpoisonra
		4684,   4608,     -- Barsilence
		4698,   4608,     -- Barsilencera
		4680,   244,      -- Barsleep
		4694,   244,      -- Barsleepra
		4628,   8586,     -- Cursna
		4629,   35000,    -- Holy
		4625,   2330,     -- Silena
		4626,   19200,    -- Stona
		4627,   13300,    -- Viruna
		

    }

    player:showText(npc, ID.text.SUSU_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
