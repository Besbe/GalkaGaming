---------------------------------------------------------------------------------------------------
-- func: giverelic <player> <relic name>
-- desc: Gives a relic set to the target player.
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "ss"
}

function onTrigger(player, target, relicName)

	if(target == nil) then
		player:PrintToPlayer("You must enter a valid player name and relic name.")
		player:PrintToPlayer("!giverelic <player> <relic name>")
		player:PrintToPlayer("For list of items, do: !giverelic list")
		return
	end

    if (relicName == nil) then
		if (target == "list") then
			player:PrintToPlayer("brd, brd1, bst, bst1, blm, blm1, blu, blu1, cor, cor1, dnc, dnc1, drk, drk1, drg, drg1,") 
			player:PrintToPlayer("mnk, mnk1, nin, nin1, pld, pld1, pup, pup1, rng, rng1, rdm, rdm1, sam, sam1, sch, sch1,")
			player:PrintToPlayer("smn, smn1, thf, thf1, war, war1, whmaf, whmaf1, whm, whm1")
		else
			player:PrintToPlayer("You must enter a valid player name and relic name.")
			player:PrintToPlayer("!giverelic <player> <relic name>")
			player:PrintToPlayer("For list of items, do: !giverelic list")
        end
		return
    end

    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) )
        return
    end

    -- Attempt to give the target the item..
    if (targ:getFreeSlotsCount() < 5) then
        player:PrintToPlayer( string.format( "Player '%s' does not have free space for those items!", target ) )
    else
		if (relicName == "brd") then
			 targ:addItem(15081)
			 targ:addItem(15096)
			 targ:addItem(15111)
			 targ:addItem(15126)
			 targ:addItem(15141)
			 targ:addItem(15482)
		elseif (relicName == "brd1") then
			 targ:addItem(15254)
			 targ:addItem(14509)
			 targ:addItem(14918)
			 targ:addItem(15589)
			 targ:addItem(15674)
		elseif (relicName == "bst") then
			 targ:addItem(15080)
			 targ:addItem(15095)
			 targ:addItem(15110)
			 targ:addItem(15125)
			 targ:addItem(15140)
			 targ:addItem(15875)
		elseif (relicName == "bst1") then
			 targ:addItem(15253)
			 targ:addItem(14508)
			 targ:addItem(14917)
			 targ:addItem(15588)
			 targ:addItem(15673)
		elseif (relicName == "blm") then
			 targ:addItem(15075)
			 targ:addItem(15090)
			 targ:addItem(15105)
			 targ:addItem(15120)
			 targ:addItem(15135)
			 targ:addItem(15874)
		elseif (relicName == "blm1") then
			 targ:addItem(15248)
			 targ:addItem(14503)
			 targ:addItem(14912)
			 targ:addItem(15583)
			 targ:addItem(15668)
		elseif (relicName == "blu") then
			 targ:addItem(11465)
			 targ:addItem(11292)
			 targ:addItem(15025)
			 targ:addItem(16346)
			 targ:addItem(11382)
			 targ:addItem(16244)
		elseif (relicName == "blu1") then
			 targ:addItem(11466)
			 targ:addItem(11293)
			 targ:addItem(15026)
			 targ:addItem(16347)
			 targ:addItem(11383)
		elseif (relicName == "cor") then
			 targ:addItem(11468)
			 targ:addItem(11295)
			 targ:addItem(15028)
			 targ:addItem(16349)
			 targ:addItem(11385)
			 targ:addItem(15920)
		elseif (relicName == "cor1") then
			 targ:addItem(11469)
			 targ:addItem(11296)
			 targ:addItem(15029)
			 targ:addItem(16350)
			 targ:addItem(11386)
		elseif (relicName == "dnc") then
			 targ:addItem(11478)
			 targ:addItem(11305)
			 targ:addItem(15038)
			 targ:addItem(16360)
			 targ:addItem(11396)
			 targ:addItem(16248)
		elseif (relicName == "dnc1") then
			 targ:addItem(11479)
			 targ:addItem(11306)
			 targ:addItem(15039)
			 targ:addItem(16361)
			 targ:addItem(11397)
		elseif (relicName == "drk") then
			 targ:addItem(15079)
			 targ:addItem(15094)
			 targ:addItem(15109)
			 targ:addItem(15124)
			 targ:addItem(15139)
			 targ:addItem(15479)
		elseif (relicName == "drk1") then
			 targ:addItem(15252)
			 targ:addItem(14507)
			 targ:addItem(14916)
			 targ:addItem(15587)
			 targ:addItem(15139)
		elseif (relicName == "drg") then
			 targ:addItem(15085)
			 targ:addItem(15100)
			 targ:addItem(15115)
			 targ:addItem(15130)
			 targ:addItem(15145)
			 targ:addItem(15878)
		elseif (relicName == "drg1") then
			 targ:addItem(15258)
			 targ:addItem(14513)
			 targ:addItem(14922)
			 targ:addItem(15593)
			 targ:addItem(15678)
		elseif (relicName == "mnk") then
			 targ:addItem(15073)
			 targ:addItem(15088)
			 targ:addItem(15103)
			 targ:addItem(15118)
			 targ:addItem(15133)
			 targ:addItem(15478)
		elseif (relicName == "mnk1") then
			 targ:addItem(15246)
			 targ:addItem(14501)
			 targ:addItem(14910)
			 targ:addItem(15581)
			 targ:addItem(15666)
		elseif (relicName == "nin") then
			 targ:addItem(15084)
			 targ:addItem(15099)
			 targ:addItem(15114)
			 targ:addItem(15129)
			 targ:addItem(15144)
			 targ:addItem(15877)
		elseif (relicName == "nin1") then
			 targ:addItem(15257)
			 targ:addItem(14512)
			 targ:addItem(14921)
			 targ:addItem(15592)
			 targ:addItem(15677)
		elseif (relicName == "pld") then
			 targ:addItem(15078)
			 targ:addItem(15093)
			 targ:addItem(15108)
			 targ:addItem(15123)
			 targ:addItem(15138)
			 targ:addItem(15481)
		elseif (relicName == "pld1") then
			 targ:addItem(15251)
			 targ:addItem(14506)
			 targ:addItem(14915)
			 targ:addItem(15586)
			 targ:addItem(15671)
		elseif (relicName == "pup") then
			 targ:addItem(11471)
			 targ:addItem(11298)
			 targ:addItem(15031)
			 targ:addItem(16352)
			 targ:addItem(11388)
			 targ:addItem(16245)
		elseif (relicName == "pup1") then
			 targ:addItem(11472)
			 targ:addItem(11299)
			 targ:addItem(15032)
			 targ:addItem(16353)
			 targ:addItem(11389)
		elseif (relicName == "rng") then
			 targ:addItem(15082)
			 targ:addItem(15097)
			 targ:addItem(15112)
			 targ:addItem(15127)
			 targ:addItem(15142)
			 targ:addItem(15876)
		elseif (relicName == "rng1") then
			 targ:addItem(15255)
			 targ:addItem(14510)
			 targ:addItem(14919)
			 targ:addItem(15590)
			 targ:addItem(15675)
		elseif (relicName == "rdm") then
			 targ:addItem(15076)
			 targ:addItem(15091)
			 targ:addItem(15106)
			 targ:addItem(15121)
			 targ:addItem(15136)
			 targ:addItem(15873)
		elseif (relicName == "rdm1") then
			 targ:addItem(15249)
			 targ:addItem(14504)
			 targ:addItem(14913)
			 targ:addItem(15584)
			 targ:addItem(15669)
		elseif (relicName == "sam") then
			 targ:addItem(15083)
			 targ:addItem(15098)
			 targ:addItem(15113)
			 targ:addItem(15128)
			 targ:addItem(15143)
			 targ:addItem(15879)
		elseif (relicName == "sam1") then
			 targ:addItem(15256)
			 targ:addItem(14511)
			 targ:addItem(14920)
			 targ:addItem(15591)
			 targ:addItem(15676)
		elseif (relicName == "sch") then
			 targ:addItem(11480)
			 targ:addItem(11307)
			 targ:addItem(15040)
			 targ:addItem(16362)
			 targ:addItem(11398)
			 targ:addItem(15925)
		elseif (relicName == "sch1") then
			 targ:addItem(11481)
			 targ:addItem(11308)
			 targ:addItem(15041)
			 targ:addItem(16363)
			 targ:addItem(11399)
		elseif (relicName == "smn") then
			 targ:addItem(15086)
			 targ:addItem(15101)
			 targ:addItem(15116)
			 targ:addItem(15131)
			 targ:addItem(15146)
			 targ:addItem(15484)
		elseif (relicName == "smn1") then
			 targ:addItem(15259)
			 targ:addItem(14514)
			 targ:addItem(14923)
			 targ:addItem(15594)
			 targ:addItem(15679)
		elseif (relicName == "thf") then
			 targ:addItem(15077)
			 targ:addItem(15092)
			 targ:addItem(15107)
			 targ:addItem(15122)
			 targ:addItem(15137)
			 targ:addItem(15480)
		elseif (relicName == "thf1") then
			 targ:addItem(15250)
			 targ:addItem(14505)
			 targ:addItem(14914)
			 targ:addItem(15585)
			 targ:addItem(15670)
		elseif (relicName == "war") then
			 targ:addItem(15072)
			 targ:addItem(15087)
			 targ:addItem(15102)
			 targ:addItem(15117)
			 targ:addItem(15132)
			 targ:addItem(15871)
		elseif (relicName == "war1") then
			 targ:addItem(15245)
			 targ:addItem(14500)
			 targ:addItem(14909)
			 targ:addItem(15580)
			 targ:addItem(15665)
		elseif (relicName == "whm") then
			 targ:addItem(15074)
			 targ:addItem(15089)
			 targ:addItem(15104)
			 targ:addItem(15119)
			 targ:addItem(15134)
			 targ:addItem(15872)
		elseif (relicName == "whm1") then
			 targ:addItem(15247)
			 targ:addItem(14502)
			 targ:addItem(14911)
			 targ:addItem(15582)
			 targ:addItem(15667)
		else
			player:PrintToPlayer("You must specify a valid relic name, !giverelic list")
		end	 
        player:PrintToPlayer( string.format( "Gave player '%s' the set '%s' ", target, relicName ) )
    end
end