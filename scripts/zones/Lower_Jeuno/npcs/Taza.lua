-----------------------------------
-- Area: Lower Jeuno
--  NPC: Taza
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4881,  10304,  -- Sleepga
		4658,  26244,  -- Shellra III
		4735,  19200,  -- Protectra III
		4739,  14080,  -- Shellra II
		4740,  26244,  -- Shellra III
		4685,  15120,  -- Barpetrify
		4686,   9600,  -- Barvirus
		4699,  15120,  -- Barpetra
		4867,  18720,  -- Sleep II
		4769,  19932,  -- Stone III
		4779,  22682,  -- Water III
		4764,  27744,  -- Aero III
		4754,  33306,  -- Fire III
		4759,  39368,  -- Blizzard III
		4774,  45930,  -- Thunder III
		
	}
	
    player:showText(npc, ID.text.TAZA_SHOP_DIALOG)
	
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
