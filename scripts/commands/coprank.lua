---------------------------------------------------------------------------------------------------
-- func: coprank
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
		player:PrintToPlayer("!coprank <player> <rank (2-9)>")
        return
    end

    --Validate the target..
    local targ = GetPlayerByName(target)
    if (targ == nil) then
        player:PrintToPlayer(string.format( "Invalid player '%s' given.", target))
        return
    end

    --Validate the rank..
	if (tonumber(rank) == nil or tonumber(rank) < 2 or tonumber(rank) > 9) then
        player:PrintToPlayer("You must enter a valid rank number (must be 2-9).")
		player:PrintToPlayer("!coprank <player> <rank (2-9)>")
        return
    end

	if(rank >= 2) then
		targ:addMission(6, 101)
		targ:completeMission(6, 101)
		targ:addMission(6, 110)
		targ:completeMission(6, 110)
		targ:addMission(6, 118)
		targ:completeMission(6, 118)
		targ:addMission(6, 128)
		targ:completeMission(6, 128)
		targ:addKeyItem(tpz.ki.LIGHT_OF_DEM)
		targ:addKeyItem(tpz.ki.LIGHT_OF_HOLLA)
		targ:addKeyItem(tpz.ki.LIGHT_OF_MEA)
		targ:addMission(6, 138)		
	end
	if(rank >= 3) then
		targ:completeMission(6, 138)
		targ:addMission(6, 218)
		targ:completeMission(6, 218)
		targ:addMission(6, 228)
		targ:completeMission(6, 228)
		targ:addMission(6, 238)
		targ:completeMission(6, 238)
		targ:addMission(6, 248)
		targ:completeMission(6, 248)
		targ:addMission(6, 257)
		targ:completeMission(6, 257)
		targ:addMission(6, 258)
	end
	if(rank >= 4) then
		targ:completeMission(6, 258)
		targ:addMission(6, 318)
		targ:completeMission(6, 318)
		targ:addMission(6, 325)
		targ:completeMission(6, 325)
		targ:addMission(6, 335)
		targ:completeMission(6, 335)
		targ:addMission(6, 341)
		targ:completeMission(6, 341)
		targ:addMission(6, 350)
		targ:completeMission(6, 350)
		targ:addMission(6, 358)
		targ:completeMission(6, 358)
		targ:addMission(6, 368)
	end
	if(rank >= 5) then
		targ:completeMission(6, 368)
		targ:addMission(6, 418)
		targ:completeMission(6, 418)
		targ:addMission(6, 428)
		targ:completeMission(6, 428)
		targ:addMission(6, 438)
		targ:completeMission(6, 438)
		targ:addMission(6, 448)
	end
	if(rank >= 6) then
		targ:completeMission(6, 448)
		targ:addKeyItem(tpz.ki.LIGHT_OF_VAHZL)
		targ:addMission(6, 518)
		targ:completeMission(6, 518)
		targ:addMission(6, 530)
		targ:completeMission(6, 530)
		targ:addMission(6, 543)
		targ:completeMission(6, 543)
		targ:addMission(6, 552)
		targ:completeMission(6, 552)
		targ:addMission(6, 560)
		targ:completeMission(6, 560)
		targ:addMission(6, 568)
		targ:completeMission(6, 568)
		targ:addMission(6, 578)
	end
	if(rank >= 7) then
		player:PrintToPlayer("You can give them a Ducal Guard's Ring with !giveitem <player> 14657 1")
		targ:completeMission(6, 578)
		targ:addMission(6, 618)
		targ:completeMission(6, 618)
		targ:addMission(6, 628)
		targ:completeMission(6, 628)
		targ:addMission(6, 638)
		targ:completeMission(6, 638)
		targ:addMission(6, 648)
	end
	if(rank >= 8) then
		targ:addKeyItem(tpz.ki.LIGHT_OF_ALTAIEU)
		targ:completeMission(6, 648)
		targ:addMission(6, 718)
		targ:completeMission(6, 718)
		targ:addMission(6, 728)
		targ:completeMission(6, 728)
		targ:addMission(6, 738)
		targ:completeMission(6, 738)
		targ:addMission(6, 748)
		targ:completeMission(6, 748)
		targ:addMission(6, 758)
		targ:completeMission(6, 758)
		targ:addMission(6, 800)
	end
	if(rank == 9) then
		player:PrintToPlayer("You can give them a Tavnazian Ring with !giveitem <player> 14672 1")
		player:PrintToPlayer("You can give them a Rajas Ring with !giveitem <player> 15543 1")
		player:PrintToPlayer("You can give them a Sattva Ring with !giveitem <player> 15544 1")
		player:PrintToPlayer("You can give them a Tamas Ring with !giveitem <player> 15545 1")
		targ:completeMission(6, 800)
		targ:addMission(6, 818)
		targ:completeMission(6, 818)
		targ:addMission(6, 828)
		targ:completeMission(6, 828)
		targ:addMission(6, 840)
		targ:completeMission(6, 840)
		targ:addMission(6, 850)
	end
	targ:setCharVar("PromathiaStatus", 0)
	player:PrintToPlayer(string.format("You have granted %s safe passage to CoP Mission: %i", target, rank))
end 