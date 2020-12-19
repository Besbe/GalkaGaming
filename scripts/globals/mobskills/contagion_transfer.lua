---------------------------------------------
-- Contagion Transfer
-- Giant Moa steals 8 status effects from its target
-- Petrify not included as Topaz_game crashes when is transfered to the mob
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    --local effects = target:getStatusEffects()
	local effects = {tpz.effect.POISON, tpz.effect.PARALYSIS, tpz.effect.BLINDNESS, tpz.effect.SILENCE,
        tpz.effect.WEIGHT, tpz.effect.SLOW, tpz.effect.CURSE_I, tpz.effect.DIA, tpz.effect.BIO, tpz.effect.BURN,
        tpz.effect.FROST, tpz.effect.CHOKE, tpz.effect.RASP, tpz.effect.SHOCK, tpz.effect.DROWN, tpz.effect.STR_DOWN,
        tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN, tpz.effect.INT_DOWN, tpz.effect.MND_DOWN,
        tpz.effect.CHR_DOWN, tpz.effect.ACCURACY_DOWN, tpz.effect.ATTACK_DOWN, tpz.effect.EVASION_DOWN,
        tpz.effect.DEFENSE_DOWN, tpz.effect.MAGIC_DEF_DOWN, tpz.effect.MAGIC_ACC_DOWN, tpz.effect.MAGIC_ATK_DOWN, 
		tpz.effect.DISEASE, tpz.effect.SLEEP_II, tpz.effect.CURSE_II, tpz.effect.PLAGUE, tpz.effect.ICE_SPIKES, tpz.effect.BLAZE_SPIKES, tpz.effect.SHOCK_SPIKES, tpz.effect.BLINK,
		tpz.effect.STONESKIN, tpz.effect.AQUAVEIL, tpz.effect.PROTECT, tpz.effect.SHELL, tpz.effect.REGEN, tpz.effect.REFRESH, tpz.effect.INVISIBLE,
		tpz.effect.DEODORIZE, tpz.effect.SNEAK, tpz.effect.STR_BOOST, tpz.effect.DEX_BOOST, tpz.effect.VIT_BOOST, tpz.effect.AGI_BOOST, tpz.effect.INT_BOOST, 
		tpz.effect.MND_BOOST, tpz.effect.CHR_BOOST, tpz.effect.ACCURACY_BOOST, tpz.effect.ATTACK_BOOST, tpz.effect.EVASION_BOOST, tpz.effect.DEFENSE_BOOST, 
		tpz.effect.ENFIRE, tpz.effect.ENBLIZZARD, tpz.effect.ENAERO, tpz.effect.ENSTONE, tpz.effect.ENTHUNDER, tpz.effect.ENWATER, tpz.effect.BARFIRE, tpz.effect.BARBLIZZARD, 
		tpz.effect.BARAERO, tpz.effect.BARSTONE, tpz.effect.BARTHUNDER, tpz.effect.BARWATER, tpz.effect.BARSLEEP, tpz.effect.BARPOISON, tpz.effect.BARPARALYZE, tpz.effect.BARBLIND, 
		tpz.effect.BARSILENCE, tpz.effect.BARPETRIFY, tpz.effect.BARVIRUS, tpz.effect.BURN, tpz.effect.FROST, tpz.effect.CHOKE, tpz.effect.RASP, tpz.effect.SHOCK, tpz.effect.DROWN, tpz.effect.DIA, 
		tpz.effect.BIO, tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN, tpz.effect.INT_DOWN, tpz.effect.MND_DOWN, tpz.effect.CHR_DOWN, tpz.effect.MAX_HP_DOWN, 
		tpz.effect.MAX_MP_DOWN, tpz.effect.ACCURACY_DOWN, tpz.effect.ATTACK_DOWN, tpz.effect.EVASION_DOWN, tpz.effect.DEFENSE_DOWN, tpz.effect.FLASH, tpz.effect.MAGIC_DEF_DOWN, tpz.effect.MAGIC_ACC_DOWN, 
		tpz.effect.MAGIC_ATK_DOWN, tpz.effect.MAX_TP_DOWN, tpz.effect.MAGIC_ATK_BOOST, tpz.effect.MAGIC_DEF_BOOST, tpz.effect.REQUIEM, tpz.effect.LULLABY, tpz.effect.ELEGY, tpz.effect.PAEON, 
		tpz.effect.BALLAD, tpz.effect.MINNE, tpz.effect.MINUET, tpz.effect.MADRIGAL, tpz.effect.PRELUDE, tpz.effect.MAMBO, tpz.effect.AUBADE, tpz.effect.PASTORAL, tpz.effect.HUM, tpz.effect.FANTASIA, 
		tpz.effect.OPERETTA, tpz.effect.CAPRICCIO, tpz.effect.SERENADE, tpz.effect.ROUND, tpz.effect.GAVOTTE, tpz.effect.FUGUE, tpz.effect.RHAPSODY, tpz.effect.ARIA, tpz.effect.MARCH, tpz.effect.ETUDE, 
		tpz.effect.CAROL, tpz.effect.THRENODY, tpz.effect.HYMNUS, tpz.effect.MAZURKA, tpz.effect.FIGHTERS_ROLL, tpz.effect.MONKS_ROLL, tpz.effect.HEALERS_ROLL, tpz.effect.WIZARDS_ROLL, 
		tpz.effect.WARLOCKS_ROLL, tpz.effect.ROGUES_ROLL, tpz.effect.GALLANTS_ROLL, tpz.effect.CHAOS_ROLL, tpz.effect.BEAST_ROLL, tpz.effect.CHORAL_ROLL, tpz.effect.HUNTERS_ROLL, tpz.effect.SAMURAI_ROLL, 
		tpz.effect.NINJA_ROLL, tpz.effect.DRACHEN_ROLL, tpz.effect.EVOKERS_ROLL, tpz.effect.MAGUSS_ROLL, tpz.effect.CORSAIRS_ROLL, tpz.effect.PUPPET_ROLL, tpz.effect.CASTERS_ROLL, tpz.effect.TACTICIANS_ROLL, 
		tpz.effect.COPY_IMAGE_2, tpz.effect.COPY_IMAGE_3, tpz.effect.COPY_IMAGE_4, tpz.effect.BANE, tpz.effect.PLAGUE, tpz.effect.FLEE, tpz.effect.HASTE, tpz.effect.BLAZE_SPIKES, tpz.effect.ICE_SPIKES, 
		tpz.effect.BLINK, tpz.effect.STONESKIN, tpz.effect.SHOCK_SPIKES, tpz.effect.AQUAVEIL, tpz.effect.PROTECT, tpz.effect.SHELL, tpz.effect.REGEN, tpz.effect.REFRESH, tpz.effect.BOOST, tpz.effect.BERSERK, 
		tpz.effect.DEFENDER, tpz.effect.AGGRESSOR, tpz.effect.FOCUS, tpz.effect.DODGE, tpz.effect.COUNTERSTANCE, tpz.effect.SENTINEL, tpz.effect.SOULEATER, tpz.effect.LAST_RESORT, tpz.effect.SNEAK_ATTACK, 
		tpz.effect.COPY_IMAGE, tpz.effect.THIRD_EYE, tpz.effect.WARCRY, tpz.effect.SHARPSHOT, tpz.effect.BARRAGE, tpz.effect.HOLY_CIRCLE, tpz.effect.ARCANE_CIRCLE, tpz.effect.HIDE, tpz.effect.CAMOUFLAGE, 
		tpz.effect.DIVINE_SEAL, tpz.effect.ELEMENTAL_SEAL, tpz.effect.TRICK_ATTACK, tpz.effect.COVER, tpz.effect.UNLIMITED_SHOT, tpz.effect.PHALANX, tpz.effect.WARDING_CIRCLE, tpz.effect.ANCIENT_CIRCLE}
		
local num = 0	

	for i, effect in ipairs(effects) do
		if (target:hasStatusEffect(effect)) and num < 8 then
			local statusEffect = target:getStatusEffect(effect)
				mob:addStatusEffect(effect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())
				target:delStatusEffect(effect)				
				num = num + 1
		end
	end
    skill:setMsg(tpz.msg.basic.NONE)
   --skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
end

