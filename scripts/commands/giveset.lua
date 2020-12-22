---------------------------------------------------------------------------------------------------
-- func: giveset <player> <set name>
-- desc: Gives a set to the target player.
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "ss"
}

function onTrigger(player, target, setName)

	if(target == nil) then
		player:PrintToPlayer("You must enter a valid player name and set name.")
		player:PrintToPlayer("!giveset <player> <set name>")
		player:PrintToPlayer("For list of items, do: !giveset list")
		return
	end

    if (setName == nil) then
		if (target == "list") then
			player:PrintToPlayer("zenith, zenith1, shura, shura1, adaman, armada, shadowmage, valkyriemage, koenig, kaiser, hecatomb, hecatomb1, denali,")
			player:PrintToPlayer("shadowmelee, valkyriemelee, crimson, blood, enkidu, oracle, aurum, homam, nashira, hachiryu, askar, skygod, nocturnus,")
			player:PrintToPlayer("ares, skadi, usukane, marduk, morrigan, amir, pahluwan, yigit, valhalla, mahatma, goliard, blessed, blessed1, dusk, dusk1")
		else
			player:PrintToPlayer("You must enter a valid player name and set name.")
			player:PrintToPlayer("!giveset <player> <set name>")
			player:PrintToPlayer("For list of items, do: !giveset list")
        end
		return
    end

    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) )
        return
    end

	local setGiven = true;

    -- Attempt to give the target the item..
    if (targ:getFreeSlotsCount() < 5) then
        player:PrintToPlayer( string.format( "Player '%s' does not have free space for those items!", target ) )
    else
		if (setName == "zenith") then
			 targ:addItem(13876)
			 targ:addItem(13787)
			 targ:addItem(14006)
			 targ:addItem(14247)
			 targ:addItem(14123)
		elseif (setName == "zenith1") then
			 targ:addItem(13877)
			 targ:addItem(13788)
			 targ:addItem(14007)
			 targ:addItem(14248)
			 targ:addItem(14124)
		elseif (setName == "shura") then
			 targ:addItem(13934)
			 targ:addItem(14387)
			 targ:addItem(14821)
			 targ:addItem(14303)
			 targ:addItem(14184)
		elseif (setName == "shura1") then
			 targ:addItem(13935)
			 targ:addItem(14388)
			 targ:addItem(14822)
			 targ:addItem(14304)
			 targ:addItem(14185)
		elseif (setName == "adaman") then
			 targ:addItem(12429)
			 targ:addItem(12557)
			 targ:addItem(12685)
			 targ:addItem(12813)
			 targ:addItem(12941)
		elseif (setName == "armada") then
			 targ:addItem(13924)
			 targ:addItem(14371)
			 targ:addItem(14816)
			 targ:addItem(14296)
			 targ:addItem(14175)
		elseif (setName == "shadowmage") then
			 targ:addItem(16115)
			 targ:addItem(14575)
			 targ:addItem(14997)
			 targ:addItem(15657)
			 targ:addItem(15742)
		elseif (setName == "valkyriemage") then
			 targ:addItem(16116)
			 targ:addItem(14576)
			 targ:addItem(14998)
			 targ:addItem(15658)
			 targ:addItem(15743)
		elseif (setName == "koenig") then
			 targ:addItem(12421)
			 targ:addItem(12549)
			 targ:addItem(12677)
			 targ:addItem(12805)
			 targ:addItem(12933)
		elseif (setName == "kaiser") then
			 targ:addItem(13911)
			 targ:addItem(14370)
			 targ:addItem(14061)
			 targ:addItem(14283)
			 targ:addItem(14163)
		elseif (setName == "hecatomb") then
			 targ:addItem(13927)
			 targ:addItem(14378)
			 targ:addItem(14076)
			 targ:addItem(14308)
			 targ:addItem(14180)
		elseif (setName == "hecatomb1") then
			 targ:addItem(13928)
			 targ:addItem(14379)
			 targ:addItem(14077)
			 targ:addItem(14309)
			 targ:addItem(14181)
		elseif (setName == "shadowmelee") then
			 targ:addItem(16113)
			 targ:addItem(14573)
			 targ:addItem(14995)
			 targ:addItem(15655)
			 targ:addItem(15740)
		elseif (setName == "valkyriemelee") then
			 targ:addItem(16114)
			 targ:addItem(14574)
			 targ:addItem(14996)
			 targ:addItem(15656)
			 targ:addItem(15741)
		elseif (setName == "crimson") then
			 targ:addItem(13908)
			 targ:addItem(14367)
			 targ:addItem(14058)
			 targ:addItem(14280)
			 targ:addItem(14160)
		elseif (setName == "blood") then
			 targ:addItem(13909)
			 targ:addItem(14368)
			 targ:addItem(14059)
			 targ:addItem(14281)
			 targ:addItem(14161)
		elseif (setName == "enkidu") then
			 targ:addItem(16157)
			 targ:addItem(11284)
			 targ:addItem(15023)
			 targ:addItem(16343)
			 targ:addItem(11378)
		elseif (setName == "oracle") then
			 targ:addItem(16156)
			 targ:addItem(11283)
			 targ:addItem(15022)
			 targ:addItem(16342)
			 targ:addItem(11377)
		elseif (setName == "aurum") then
			 targ:addItem(16155)
			 targ:addItem(11282)
			 targ:addItem(15021)
			 targ:addItem(16341)
			 targ:addItem(11376)
		elseif (setName == "homam") then
			 targ:addItem(15240)
			 targ:addItem(14488)
			 targ:addItem(14905)
			 targ:addItem(15576)
			 targ:addItem(15661)
		elseif (setName == "nashira") then
			 targ:addItem(15241)
			 targ:addItem(14489)
			 targ:addItem(14906)
			 targ:addItem(15577)
			 targ:addItem(15662)
		elseif (setName == "hachiryu") then
			 targ:addItem(11281)
			 targ:addItem(15015)
			 targ:addItem(16337)
			 targ:addItem(11364)
		elseif (setName == "askar") then
			 targ:addItem(16106)
			 targ:addItem(14568)
			 targ:addItem(14983)
			 targ:addItem(15647)
			 targ:addItem(15733)
		elseif (setName == "skygod") then
			 targ:addItem(12434)
			 targ:addItem(12562)
			 targ:addItem(12690)
			 targ:addItem(12818)
			 targ:addItem(12946)
		elseif (setName == "nocturnus") then
			 targ:addItem(11501)
			 targ:addItem(11354)
		elseif (setName == "ares") then
			 targ:addItem(16084)
			 targ:addItem(14546)
			 targ:addItem(14961)
			 targ:addItem(15625)
			 targ:addItem(15711)
		elseif (setName == "skadi") then
			 targ:addItem(16088)
			 targ:addItem(14550)
			 targ:addItem(14965)
			 targ:addItem(15629)
			 targ:addItem(15715)
		elseif (setName == "usukane") then
			 targ:addItem(16092)
			 targ:addItem(14554)
			 targ:addItem(14969)
			 targ:addItem(15633)
			 targ:addItem(15719)
		elseif (setName == "marduk") then
			 targ:addItem(16096)
			 targ:addItem(14558)
			 targ:addItem(14973)
			 targ:addItem(15637)
			 targ:addItem(15723)
		elseif (setName == "morrigan") then
			 targ:addItem(16100)
			 targ:addItem(14562)
			 targ:addItem(14977)
			 targ:addItem(15641)
			 targ:addItem(15727)
		elseif (setName == "amir") then
			 targ:addItem(16062)
			 targ:addItem(14525)
			 targ:addItem(14933)
			 targ:addItem(15604)
			 targ:addItem(15688)
		elseif (setName == "pahluwan") then
			 targ:addItem(16069)
			 targ:addItem(14530)
			 targ:addItem(14940)
			 targ:addItem(15609)
			 targ:addItem(15695)
		elseif (setName == "yigit") then
			 targ:addItem(16064)
			 targ:addItem(14527)
			 targ:addItem(14935)	
			 targ:addItem(15606)
			 targ:addItem(15690)
		elseif (setName == "valhalla") then
			 targ:addItem(16117)
			 targ:addItem(14577)
		elseif (setName == "mahatma") then
			 targ:addItem(14302)
			 targ:addItem(13930)
			 targ:addItem(14079)
			 targ:addItem(14183)
			 targ:addItem(14381)
		elseif (setName == "goliard") then
			 targ:addItem(16108)
			 targ:addItem(14570)
			 targ:addItem(14985)
			 targ:addItem(15649)
			 targ:addItem(15735)
		elseif (setName == "blessed") then
			 targ:addItem(14436)
			 targ:addItem(14875)
			 targ:addItem(15391)
			 targ:addItem(15329)
		elseif (setName == "blessed1") then
			 targ:addItem(14438)
			 targ:addItem(14877)
			 targ:addItem(15393)
			 targ:addItem(15331)
		elseif (setName == "dusk") then
			 targ:addItem(12445)
			 targ:addItem(12573)
			 targ:addItem(12701)
			 targ:addItem(12879)
			 targ:addItem(12957)
		elseif (setName == "dusk1") then
			 targ:addItem(13938)
			 targ:addItem(14391)
			 targ:addItem(14825)
			 targ:addItem(14307)
			 targ:addItem(14188)
		elseif (setName == "denali") then
			 targ:addItem(16107)
			 targ:addItem(14569)
			 targ:addItem(14984)
			 targ:addItem(15648)
			 targ:addItem(15734)
		else
			setGiven = false;
		end
		if(setGiven) then
			player:PrintToPlayer( string.format( "Gave player '%s' the set '%s' ", target, setName ) )
		else
			player:PrintToPlayer("You must specify a valid set name, !giveset list")
		end
    end
end