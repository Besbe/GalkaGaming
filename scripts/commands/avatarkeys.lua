---------------------------------------------------------------------------------------------------
-- func: avatarkeys
-- desc: adds avatar key items to the GMs inventory
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "si"
};

function onTrigger(player, target)

	if (target == nil) then
		player:addKeyItem(tpz.ki.TUNING_FORK_OF_FIRE);
		player:addKeyItem(tpz.ki.TUNING_FORK_OF_EARTH);
		player:addKeyItem(tpz.ki.TUNING_FORK_OF_WATER);
		player:addKeyItem(tpz.ki.TUNING_FORK_OF_WIND);
		player:addKeyItem(tpz.ki.TUNING_FORK_OF_ICE);
		player:addKeyItem(tpz.ki.TUNING_FORK_OF_LIGHTNING);
		player:addKeyItem(tpz.ki.MOON_BAUBLE);
		player:addKeyItem(tpz.ki.VIAL_OF_DREAM_INCENSE);
		player:PrintToPlayer("You have been given all the avatar key items.");
    else
       local targ = GetPlayerByName(target);
       if (targ ~= nil) then
			targ:addKeyItem(tpz.ki.TUNING_FORK_OF_FIRE);
			targ:addKeyItem(tpz.ki.TUNING_FORK_OF_EARTH);
			targ:addKeyItem(tpz.ki.TUNING_FORK_OF_WATER);
			targ:addKeyItem(tpz.ki.TUNING_FORK_OF_WIND);
			targ:addKeyItem(tpz.ki.TUNING_FORK_OF_ICE);
			targ:addKeyItem(tpz.ki.TUNING_FORK_OF_LIGHTNING);
			targ:addKeyItem(tpz.ki.MOON_BAUBLE);
			targ:addKeyItem(tpz.ki.VIAL_OF_DREAM_INCENSE);
			targ:PrintToPlayer("You have been given all the avatar key items.");
			player:PrintToPlayer( string.format("You have given '%s' all the avatar key items.", target) );
       else
           player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
       end
    end
end; 