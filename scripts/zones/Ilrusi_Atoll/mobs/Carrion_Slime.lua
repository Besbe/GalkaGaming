-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  Mob: Carrion Slime
-----------------------------------
local ID = require("scripts/zones/Ilrusi_Atoll/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    local SLIME = GetMobByID(ID.mob.UNDEAD_SLIME, instance)
    local RAND = math.random(1, 5)

    if RAND == 1 and SLIME:getLocalVar("SlimeSpawned") == 0 then
        SpawnMob(ID.mob.UNDEAD_SLIME, instance)
        SLIME:setLocalVar("SlimeSpawned", 1)
    else
        instance:setProgress(instance:getProgress() + 1)
    end
end
