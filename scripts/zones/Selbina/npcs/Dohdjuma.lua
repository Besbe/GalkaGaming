-----------------------------------
-- Area: Selbina
--  NPC: Dohdjuma
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        611,    36,    -- Rye Flour
        5011,  235,    -- Scroll of Sheepfoe Mambo
        4150, 2361,    -- Eye Drops
        4148,  287,    -- Antidote
        4509,   10,    -- Distilled Water
        4112,  819,    -- Potion
        17395,  9,    -- Lugworm
        4378,   54,    -- Selbina Milk
        4490,  436,    -- Pickled Herring
        4559, 4535,    -- Herb Quus
    }

    player:showText(npc, ID.text.DOHDJUMA_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
