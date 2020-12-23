---------------------------------------------------------------------------------------------------
-- func: rank
-- desc: Sets the Rank of a player.
-- author: Tonzoffun
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "si"
}

function onTrigger(player, target, rank)
    if (rank == nil) then
        rank = target
        target = player:getName()
    end

    if (target == nil) then
		player:PrintToPlayer("!rank <player> <rank>")
        return
    end

    --Validate the target..
    local targ = GetPlayerByName(target)
    if (targ == nil) then
        player:PrintToPlayer(string.format( "Invalid player '%s' given.", target))
        return
    end

    --Validate the rank..
	if (tonumber(rank) == nil or tonumber(rank) < 2 or tonumber(rank) > 10) then
        player:PrintToPlayer("You must enter a valid rank number (must be 2-10).")
		player:PrintToPlayer("!rank <player> <rank>")
        return
    end

	local pNation = targ:getNation()

	if(rank >= 2) then
		targ:addMission(pNation, 0)
		targ:completeMission(pNation, 0)
		targ:addMission(pNation, 1)
		targ:completeMission(pNation, 1)
		targ:addMission(pNation, 2)
		targ:completeMission(pNation, 2)
	end
	if(rank >= 3) then
		targ:addMission(pNation, 3)
		targ:completeMission(pNation, 3)
		targ:addMission(pNation, 4)
		targ:completeMission(pNation, 4)
		targ:addMission(pNation, 5)
		targ:completeMission(pNation, 5)
		targ:addMission(pNation, 6)
		targ:completeMission(pNation, 6)
		targ:addMission(pNation, 7)
		targ:completeMission(pNation, 7)
		targ:addMission(pNation, 8)
		targ:completeMission(pNation, 8)
		targ:addMission(pNation, 9)
		targ:completeMission(pNation, 9)
	end
	if(rank >= 4) then
		targ:addMission(pNation, 10)
		targ:completeMission(pNation, 10)
		targ:addMission(pNation, 11)
		targ:completeMission(pNation, 11)
		targ:addMission(pNation, 12)
		targ:completeMission(pNation, 12)
		if(pNation == 2) then -- windy
			targ:addKeyItem(tpz.ki.STARWAY_STAIRWAY_BAUBLE) -- starway stairway bauble
			targ:addKeyItem(tpz.ki.PORTAL_CHARM) -- portal charm
		end
	end
	if(rank >= 5) then
		targ:addMission(pNation, 13)
		targ:completeMission(pNation, 13)
		targ:addKeyItem(tpz.ki.AIRSHIP_PASS) -- airship pass
	end
	if(rank >= 6) then
		targ:addMission(pNation, 14)
		targ:completeMission(pNation, 14)
		targ:addMission(pNation, 15)
		targ:completeMission(pNation, 15)
		targ:addKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) -- vial of shrouded sand (dynamis access)
		targ:addMission(3, 0) -- add zilart start mission
	end
	if(rank >= 7) then
		targ:addMission(pNation, 16)
		targ:completeMission(pNation, 16)
		targ:addMission(pNation, 17)
		targ:completeMission(pNation, 17)
	end
	if(rank >= 8) then
		targ:addMission(pNation, 18)
		targ:completeMission(pNation, 18)
		targ:addMission(pNation, 19)
		targ:completeMission(pNation, 19)
	end
	if(rank >= 9) then
		targ:addMission(pNation, 20)
		targ:completeMission(pNation, 20)
		targ:addMission(pNation, 21)
		targ:completeMission(pNation, 21)
	end
	if(rank == 10) then
		targ:addMission(pNation, 22)
		targ:completeMission(pNation, 22)
		targ:addMission(pNation, 23)
		targ:completeMission(pNation, 23)
		targ:addMission(pNation, 65535)
	end		
	targ:setRank(rank)
	targ:setCharVar("MissionStatus", 0)
	player:PrintToPlayer(string.format("You have granted %s safe passage to Rank: %i", target, rank))
end 