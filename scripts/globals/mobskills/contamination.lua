---------------------------------------------
-- Giant Moa
-- Transfers 8 ailments the Moa itself has to players in AoE range.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------


function onMobSkillCheck(target, mob, skill)
    return 1
end


function onMobWeaponSkill(target, mob, skill)
    -- list of effects to give in AoE
    local effects = {tpz.effect.FLASH, tpz.effect.BLINDNESS, tpz.effect.ELEGY, tpz.effect.REQUIEM, tpz.effect.PARALYSIS, tpz.effect.POISON, tpz.effect.CURSE_I, tpz.effect.CURSE_II, 
	tpz.effect.DISEASE, tpz.effect.PLAGUE, tpz.effect.WEIGHT, tpz.effect.BIND, tpz.effect.BIO, tpz.effect.DIA, tpz.effect.BURN, tpz.effect.FROST, tpz.effect.CHOKE, tpz.effect.RASP, 
	tpz.effect.SHOCK, tpz.effect.DROWN, tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN, tpz.effect.INT_DOWN, tpz.effect.MND_DOWN, tpz.effect.CHR_DOWN, 
	tpz.effect.SLOW, tpz.effect.ACCURACY_DOWN, tpz.effect.ATTACK_DOWN, tpz.effect.EVASION_DOWN, tpz.effect.DEFENSE_DOWN, tpz.effect.MAGIC_ACC_DOWN, tpz.effect.MAGIC_EVASION_DOWN,
	tpz.effect.MAGIC_DEF_DOWN, tpz.effect.MAX_TP_DOWN, tpz.effect.MAX_MP_DOWN, tpz.effect.MAX_HP_DOWN, tpz.effect.SILENCE, tpz.effect.MAGIC_ATK_DOWN}


    for i, effect in ipairs(effects) do
        if (mob:hasStatusEffect(effect)) then
            local statusEffect = mob:getStatusEffect(effect)
            target:addStatusEffect(effect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())
            mob:delStatusEffect(effect)			
        end
    end
    skill:setMsg(tpz.msg.basic.NONE)
end
