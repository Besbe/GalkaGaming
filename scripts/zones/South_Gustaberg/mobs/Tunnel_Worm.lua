-----------------------------------
-- Area: South Gustaberg
--  Mob: Stone Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function SetMagicCastingEnabled(mob, target)
end

function onMobFight(mob, target)
	if mob:checkDistance(target) < 3 then
    mob:SetMagicCastingEnabled(false)
	else
	mob:SetMagicCastingEnabled(true)
	end
end 




--function onMobDeath(mob, player, isKiller)
--    tpz.regime.checkRegime(player, mob, 77, 1, tpz.regime.type.FIELDS)

