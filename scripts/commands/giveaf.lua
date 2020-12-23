---------------------------------------------------------------------------------------------------
-- func: giveaf <player> <af name>
-- desc: Gives an af set to the target player.
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "ss"
}

function onTrigger(player, target, afName)

	if(target == nil) then
		player:PrintToPlayer("You must enter a valid player name and af name.")
		player:PrintToPlayer("!giveaf <player> <af name>")
		player:PrintToPlayer("For list of items, do: !giveaf list")
		return
	end

    if (afName == nil) then
		if (target == "list") then
			player:PrintToPlayer("brd, brd1, bst, bst1, blm, blm1, blu, blu1, cor, cor1, dncmale, dncfemale, dncmale1, dncfemale1,")
			player:PrintToPlayer("drk, drk1, drg, drg1, mnk, mnk1, nin, nin1, pld, pld1, pup, pup1, rng, rng1, rdm, rdm1,")
			player:PrintToPlayer("sam, sam1, sch, sch1, smn, smn1, thf, thf1, war, war1, whm, whm1")
		else
			player:PrintToPlayer("You must enter a valid player name and af name.")
			player:PrintToPlayer("!giveaf <player> <af name>")
			player:PrintToPlayer("For list of items, do: !giveaf list")
        end
		return
    end

    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) )
        return
    end

    if (targ:getFreeSlotsCount() < 5) then
        player:PrintToPlayer( string.format( "Player '%s' does not have free space for those items!", target ) )
    else
		if (afName == "brd") then
			 targ:addItem(13857)
			 targ:addItem(12647)
			 targ:addItem(13970)
			 targ:addItem(14223)
			 targ:addItem(14098)
		elseif (afName == "brd1") then
			 targ:addItem(14482)
			 targ:addItem(15234)
			 targ:addItem(14899)
			 targ:addItem(15570)
			 targ:addItem(15361)
		elseif (afName == "bst") then
			 targ:addItem(12517)
			 targ:addItem(12646)
			 targ:addItem(13969)
			 targ:addItem(14222)
			 targ:addItem(14097)
		elseif (afName == "bst1") then
			 targ:addItem(15233)
			 targ:addItem(14481)
			 targ:addItem(14898)
			 targ:addItem(15569)
			 targ:addItem(15360)
		elseif (afName == "blm") then
			 targ:addItem(13856)
			 targ:addItem(12641)
			 targ:addItem(13964)
			 targ:addItem(14217)
			 targ:addItem(14092)
		elseif (afName == "blm1") then
			 targ:addItem(15228)
			 targ:addItem(14476)
			 targ:addItem(14893)
			 targ:addItem(15564)
			 targ:addItem(15355)
		elseif (afName == "blu") then
			 targ:addItem(15265)
			 targ:addItem(14521)
			 targ:addItem(14928)
			 targ:addItem(15600)
			 targ:addItem(15684)
		elseif (afName == "blu1") then
			 targ:addItem(11464)
			 targ:addItem(11291)
			 targ:addItem(15024)
			 targ:addItem(16345)
			 targ:addItem(11381)
		elseif (afName == "cor") then
			 targ:addItem(15266)
			 targ:addItem(14522)
			 targ:addItem(14929)
			 targ:addItem(15601)
			 targ:addItem(15685)
		elseif (afName == "cor1") then
			 targ:addItem(11467)
			 targ:addItem(11294)
			 targ:addItem(15027)
			 targ:addItem(16348)
			 targ:addItem(11384)
		elseif (afName == "dncmale") then
			 targ:addItem(16138)
			 targ:addItem(14578)
			 targ:addItem(15002)
			 targ:addItem(15659)
			 targ:addItem(15746)
		elseif (afName == "dncfemale") then
			 targ:addItem(16139)
			 targ:addItem(14579)
			 targ:addItem(15003)
			 targ:addItem(15660)
			 targ:addItem(15747)
		elseif (afName == "dncmale1") then
			 targ:addItem(11475)
			 targ:addItem(11302)
			 targ:addItem(15035)
			 targ:addItem(16357)
			 targ:addItem(11393)
		elseif (afName == "dncfemale1") then
			 targ:addItem(11476)
			 targ:addItem(11303)
			 targ:addItem(15036)
			 targ:addItem(16358)
			 targ:addItem(11394)
		elseif (afName == "drk") then
			 targ:addItem(12516)
			 targ:addItem(12645)
			 targ:addItem(13968)
			 targ:addItem(14221)
			 targ:addItem(14096)
		elseif (afName == "drk1") then
			 targ:addItem(15232)
			 targ:addItem(14480)
			 targ:addItem(14897)
			 targ:addItem(15568)
			 targ:addItem(15359)
		elseif (afName == "drg") then
			 targ:addItem(12519)
			 targ:addItem(12649)
			 targ:addItem(13974)
			 targ:addItem(14227)
			 targ:addItem(14102)
		elseif (afName == "drg1") then
			 targ:addItem(15238)
			 targ:addItem(14486)
			 targ:addItem(14903)
			 targ:addItem(15574)
			 targ:addItem(15365)
		elseif (afName == "mnk") then
			 targ:addItem(12512)
			 targ:addItem(12639)
			 targ:addItem(13962)
			 targ:addItem(14215)
			 targ:addItem(14090)
		elseif (afName == "mnk1") then
			 targ:addItem(15226)
			 targ:addItem(14474)
			 targ:addItem(14891)
			 targ:addItem(15562)
			 targ:addItem(15353)
		elseif (afName == "nin") then
			 targ:addItem(13869)
			 targ:addItem(13782)
			 targ:addItem(13973)
			 targ:addItem(14226)
			 targ:addItem(14101)
		elseif (afName == "nin1") then
			 targ:addItem(15237)
			 targ:addItem(14485)
			 targ:addItem(14902)
			 targ:addItem(15573)
			 targ:addItem(15364)
		elseif (afName == "pld") then
			 targ:addItem(12515)
			 targ:addItem(12644)
			 targ:addItem(13967)
			 targ:addItem(14220)
			 targ:addItem(14095)
		elseif (afName == "pld1") then
			 targ:addItem(15231)
			 targ:addItem(14479)
			 targ:addItem(14896)
			 targ:addItem(15567)
			 targ:addItem(15358)
		elseif (afName == "pup") then
			 targ:addItem(15267)
			 targ:addItem(14523)
			 targ:addItem(14930)
			 targ:addItem(15602)
			 targ:addItem(15686)
		elseif (afName == "pup1") then
			 targ:addItem(11470)
			 targ:addItem(11297)
			 targ:addItem(15030)
			 targ:addItem(16351)
			 targ:addItem(11387)
		elseif (afName == "rng") then
			 targ:addItem(12518)
			 targ:addItem(12648)
			 targ:addItem(13971)
			 targ:addItem(14224)
			 targ:addItem(14099)
		elseif (afName == "rng1") then
			 targ:addItem(15235)
			 targ:addItem(14483)
			 targ:addItem(14900)
			 targ:addItem(15571)
			 targ:addItem(15362)
		elseif (afName == "rdm") then
			 targ:addItem(12513)
			 targ:addItem(12642)
			 targ:addItem(13965)
			 targ:addItem(14218)
			 targ:addItem(14093)
		elseif (afName == "rdm1") then
			 targ:addItem(15229)
			 targ:addItem(14477)
			 targ:addItem(14894)
			 targ:addItem(15565)
			 targ:addItem(15356)
		elseif (afName == "sam") then
			 targ:addItem(13868)
			 targ:addItem(13781)
			 targ:addItem(13972)
			 targ:addItem(14225)
			 targ:addItem(14100)
		elseif (afName == "sam1") then
			 targ:addItem(15236)
			 targ:addItem(14484)
			 targ:addItem(14901)
			 targ:addItem(15572)
			 targ:addItem(15363)
		elseif (afName == "sch") then
			 targ:addItem(16140)
			 targ:addItem(14580)
			 targ:addItem(15004)
			 targ:addItem(16311)
			 targ:addItem(15748)
		elseif (afName == "sch1") then
			 targ:addItem(11477)
			 targ:addItem(11304)
			 targ:addItem(15037)
			 targ:addItem(16359)
			 targ:addItem(11395)
		elseif (afName == "smn") then
			 targ:addItem(12520)
			 targ:addItem(12650)
			 targ:addItem(13975)
			 targ:addItem(14228)
			 targ:addItem(14103)
		elseif (afName == "smn1") then
			 targ:addItem(15239)
			 targ:addItem(14487)
			 targ:addItem(14904)
			 targ:addItem(15575)
			 targ:addItem(15366)
		elseif (afName == "thf") then
			 targ:addItem(12514)
			 targ:addItem(12643)
			 targ:addItem(13966)
			 targ:addItem(14219)
			 targ:addItem(14094)
		elseif (afName == "thf1") then
			 targ:addItem(15230)
			 targ:addItem(14478)
			 targ:addItem(14895)
			 targ:addItem(15566)
			 targ:addItem(15357)
		elseif (afName == "war") then
			 targ:addItem(12511)
			 targ:addItem(12638)
			 targ:addItem(13961)
			 targ:addItem(14214)
			 targ:addItem(14089)
		elseif (afName == "war1") then
			 targ:addItem(15225)
			 targ:addItem(14473)
			 targ:addItem(14890)
			 targ:addItem(15561)
			 targ:addItem(15352)
		elseif (afName == "whm") then
			 targ:addItem(13855)
			 targ:addItem(12640)
			 targ:addItem(13963)
			 targ:addItem(14216)
			 targ:addItem(14091)
		elseif (afName == "whm1") then
			 targ:addItem(15227)
			 targ:addItem(14475)
			 targ:addItem(14892)
			 targ:addItem(15563)
			 targ:addItem(15354)
		else
			player:PrintToPlayer("You must specify a valid af name, !giveaf list")
		end	 
        player:PrintToPlayer( string.format( "Gave player '%s' the gear for '%s' ", target, afName ) )
    end
end