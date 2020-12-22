---------------------------------------------------------------------------------------------------
-- func: heal <target>
-- desc: removes any/all detrimental effects from target
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "s"
};

function onTrigger(player, target)

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:delStatusEffect(tpz.effect.SLEEP_I);
        targ:delStatusEffect(tpz.effect.POISON);
        targ:delStatusEffect(tpz.effect.PARALYSIS);
        targ:delStatusEffect(tpz.effect.BLINDNESS);
        targ:delStatusEffect(tpz.effect.SILENCE);
		targ:delStatusEffect(tpz.effect.PETRIFICATION);
		targ:delStatusEffect(tpz.effect.DISEASE);
		targ:delStatusEffect(tpz.effect.CURSE_I);
		targ:delStatusEffect(tpz.effect.BIND);
		targ:delStatusEffect(tpz.effect.WEIGHT);
		targ:delStatusEffect(tpz.effect.SLOW);
		targ:delStatusEffect(tpz.effect.CHARM_I);
		targ:delStatusEffect(tpz.effect.DOOM);
		targ:delStatusEffect(tpz.effect.AMNESIA);
		targ:delStatusEffect(tpz.effect.SLEEP_II);
		targ:delStatusEffect(tpz.effect.TERROR);
		targ:delStatusEffect(tpz.effect.CURSE_II);
		targ:delStatusEffect(tpz.effect.PLAGUE);
		targ:delStatusEffect(tpz.effect.WEAKNESS);
		targ:delStatusEffect(tpz.effect.STUN);
		targ:delStatusEffect(tpz.effect.BURN);
		targ:delStatusEffect(tpz.effect.FROST);
		targ:delStatusEffect(tpz.effect.CHOKE);
		targ:delStatusEffect(tpz.effect.RASP);
		targ:delStatusEffect(tpz.effect.SHOCK);
		targ:delStatusEffect(tpz.effect.DROWN);
		targ:delStatusEffect(tpz.effect.DIA);
		targ:delStatusEffect(tpz.effect.BIO);
		targ:delStatusEffect(tpz.effect.STR_DOWN);
		targ:delStatusEffect(tpz.effect.DEX_DOWN);
		targ:delStatusEffect(tpz.effect.VIT_DOWN);
		targ:delStatusEffect(tpz.effect.AGI_DOWN);
		targ:delStatusEffect(tpz.effect.INT_DOWN);
		targ:delStatusEffect(tpz.effect.MND_DOWN);
		targ:delStatusEffect(tpz.effect.CHR_DOWN);
		targ:delStatusEffect(tpz.effect.MAX_HP_DOWN);
		targ:delStatusEffect(tpz.effect.MAX_MP_DOWN);
		targ:delStatusEffect(tpz.effect.ACCURACY_DOWN);
		targ:delStatusEffect(tpz.effect.ATTACK_DOWN);
		targ:delStatusEffect(tpz.effect.EVASION_DOWN);
		targ:delStatusEffect(tpz.effect.DEFENSE_DOWN);
		targ:delStatusEffect(tpz.effect.FLASH);
		targ:delStatusEffect(tpz.effect.MAGIC_DEF_DOWN);
		targ:delStatusEffect(tpz.effect.MAGIC_ACC_DOWN);
		targ:delStatusEffect(tpz.effect.MAGIC_ATK_DOWN);
		targ:delStatusEffect(tpz.effect.MAX_TP_DOWN);
		targ:delStatusEffect(tpz.effect.REQUIEM);
		targ:delStatusEffect(tpz.effect.ELEGY);
		targ:delStatusEffect(tpz.effect.ENMITY_DOWN);
		targ:delStatusEffect(tpz.effect.CRIT_HIT_EVASION_DOWN);
		targ:delStatusEffect(tpz.effect.MAGIC_EVASION_DOWN);
		targ:delStatusEffect(tpz.effect.LULLABY);
		targ:setHP( 50000 );
        targ:setMP( 50000 );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end 