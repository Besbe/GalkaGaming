 ---------------------------------------------------------------------------------------------------
-- func: capplayerskill
-- desc: Caps a specific player's skill.
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");

cmdprops =
{
    permission = 4,
    parameters = "si"
};

function onTrigger(player, target, skill)

	if (target == nil) then
        player:PrintToPlayer( "You must enter a valid player name." );
		player:PrintToPlayer( "!capplayerskill <player> <skillid>" );
		return;
    end

	skill = tonumber(skill) or tpz.skill[string.upper(skill)]

    if (skill == nil or skill == 0) then
        player:PrintToPlayer( "You must enter a valid skill enum." );
		player:PrintToPlayer( "!capplayerskill <player> <skillid>" );
        return;
    end

	local targ = GetPlayerByName( target );

	if (targ ~= nil) then
		if (tonumber(skill) ~= 0 and tonumber(skill) ~= nil) then
			local skillId = tonumber(skill);
			targ:capSkill( skillId );

			player:PrintToPlayer( "Skill was capped." );

		end
	else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end

end