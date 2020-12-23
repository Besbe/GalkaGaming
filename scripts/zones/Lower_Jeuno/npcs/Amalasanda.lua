-----------------------------------
-- Area: Lower Jeuno
--  NPC: Amalasanda
-- Type: Tenshodo Merchant
-- !pos 28.149 2.899 -44.780 245
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:hasKeyItem(tpz.ki.TENSHODO_MEMBERS_CARD) then
        local stock =
        {
            704,    96,    -- Bamboo Stick
            829,  35070,    -- Silk Cloth
            626,    234,    -- pinch_of_black_pepper
			1240,   234,    -- Koma
            657,   4690,    -- Tama-Hagane
            1415, 55147,    -- Urushi
            1471,   316,    -- Sticky Rice
            1554,   431,    -- Turmeric
            1555,  1061,    -- Coriander
            1590,   536,    -- Holy Basil
            1475,   579,    -- Curry Powder
            5164,  1945,    -- Ground Wasabi
            1652,   150,    -- Rice Vinegar
            5237,   492,    -- Shirataki
			1161,	 66,	-- Uchitake
			1170,	 44,	-- Makibishi
			1176,	 44,	-- Mizu-Deppo
            4928,  1561,    -- Katon: Ichi
            4931,  1561,    -- Hyoton: Ichi
            4934,  1561,    -- Huton: Ichi
            4937,  1561,    -- Doton: Ichi
            4940,  1561,    -- Raiton: Ichi
            4943,  1561,    -- Suiton: Ichi         
        }

        player:showText(npc, ID.text.AMALASANDA_SHOP_DIALOG)
        tpz.shop.general(player, stock)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
