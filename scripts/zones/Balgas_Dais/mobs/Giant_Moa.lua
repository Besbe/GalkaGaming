-----------------------------------
-- Area: Balga's Dais
--  Mob: Giant Moa
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobWeaponSkill(target, mob, skill)
	if (skill:getID() == 1333) then mob:useMobAbility(1334)
	end
end

function onMobFight(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end


function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TP_DRAIN)
end
