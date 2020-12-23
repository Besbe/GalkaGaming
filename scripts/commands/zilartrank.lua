---------------------------------------------------------------------------------------------------
-- func: zmrank
-- desc: Sets the CoP Rank of a player.
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
		player:PrintToPlayer("!zmrank <player> <rank (2-19)>")
        return
    end

    --Validate the target..
    local targ = GetPlayerByName(target)
    if (targ == nil) then
        player:PrintToPlayer(string.format( "Invalid player '%s' given.", target))
        return
    end

    --Validate the rank..
	if (tonumber(rank) == nil or tonumber(rank) < 2 or tonumber(rank) > 19) then
        player:PrintToPlayer("You must enter a valid rank number (must be 2-19).")
		player:PrintToPlayer("!zmrank <player> <rank (2-19)>")
        return
    end

	if(rank >= 2) then
		targ:addMission(3, 0)
		targ:completeMission(3, 0)
		targ:addKeyItem(tpz.ki.MAP_OF_NORG)
		targ:addMission(3, 4)
	end
	if(rank >= 3) then
		targ:completeMission(3, 4)
		targ:addMission(3, 6)
	end
	if(rank >= 4) then
		targ:completeMission(3, 6)
		targ:addMission(3, 8)
		targ:addKeyItem(tpz.ki.SACRIFICIAL_CHAMBER_KEY)
	end
	if(rank >= 5) then
		targ:delKeyItem(tpz.ki.SACRIFICIAL_CHAMBER_KEY)
		targ:completeMission(3, 8)
		targ:addMission(3, 10)
		targ:addKeyItem(tpz.ki.DARK_FRAGMENT)
	end
	if(rank >= 6) then
		targ:delKeyItem(tpz.ki.DARK_FRAGMENT)
		targ:completeMission(3, 10)
		targ:addMission(3, 12)
	end
	if(rank >= 7) then
		targ:completeMission(3, 12)
		targ:addMission(3, 14)
	end
	if(rank >= 8) then
		targ:addKeyItem(tpz.ki.PRISMATIC_FRAGMENT)
		targ:completeMission(3, 14)
		targ:addMission(3, 16)
	end
	if(rank >= 9) then
		targ:completeMission(3, 16)
		targ:addMission(3, 18)
	end
	if(rank >= 10) then
		targ:completeMission(3, 18)
		targ:addMission(3, 20)
	end		
	if(rank >= 11) then
		targ:completeMission(3, 20)
		targ:addMission(3, 22)
	end		
	if(rank >= 12) then
		targ:completeMission(3, 22)
		targ:addMission(3, 23)
	end
	if(rank >= 13) then
		targ:addKeyItem(tpz.ki.CERULEAN_CRYSTAL)
		targ:completeMission(3, 23)
		targ:addMission(3, 24)
	end
	if(rank >= 14) then
		targ:completeMission(3, 24)
		targ:addMission(3, 26)
	end
	if(rank >= 15) then
		player:PrintToPlayer("You can give them a Abyssal Earring with !giveitem <player> 14741 1")
		player:PrintToPlayer("You can give them a Beastly Earring with !giveitem <player> 14742 1")
		player:PrintToPlayer("You can give them a Bushinomimi with !giveitem <player> 14743 1")
		player:PrintToPlayer("You can give them a Knight's Earring with !giveitem <player> 14740 1")
		player:PrintToPlayer("You can give them a Suppanomimi with !giveitem <player> 14739 1")
		targ:completeMission(3, 26)
		targ:addMission(3, 27)
	end
	if(rank >= 16) then
		targ:completeMission(3, 27)
		targ:addMission(3, 28)
	end
	if(rank >= 17) then
		targ:completeMission(3, 28)
		targ:addMission(3, 30)
	end
	if(rank >= 18) then
		targ:completeMission(3, 30)
		targ:addMission(3, 31)
	end
	if(rank == 19) then
		targ:completeMission(3, 31)
		targ:addMission(3, 255)
	end
	targ:setCharVar("ZilartStatus", 0)
	player:PrintToPlayer(string.format("You have granted %s safe passage to ZM Mission: %i", target, rank))
end 