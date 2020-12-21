-----------------------------------
-- Area: Kazham
--  NPC: Ghemi Senterilo
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Kazham/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4468,   73,    -- Pamamas
        4432,   55,    -- Kazham Pineapple
        4390,   36,    -- Mithran Tomato
        612,    55,    -- Kazham Peppers
        628,   239,    -- Cinnamon
        632,   110,    -- Kukuru Bean
        5187,  158,    -- Elshimo Coconut
    }

    player:showText(npc, ID.text.GHEMISENTERILO_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
