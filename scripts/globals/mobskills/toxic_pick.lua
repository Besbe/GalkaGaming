---------------------------------------------
--  Toxic Pick
--
--  Description: Deals damage to a single target. If landed, additional effect: poison, plague AND weight
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 2
	local typeEffect1 = tpz.effect.POISON
	local typeEffect2 = tpz.effect.PLAGUE
	local typeEffect3 = tpz.effect.WEIGHT
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, MOBPARAM_1_SHADOW, info.hitslanded)

    if (MobPhysicalHit(skill)) then
        return 
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect1, 5, 3, 60) and		
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect2, 1, 0, 120) and
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect3, 50, 0, 60)
	end
		target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
		
    return dmg
end
