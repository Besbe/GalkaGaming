---------------------------------------------------------------------------------------------------
-- func: givespitem <player> <item name>
-- desc: Gives a special item to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "ss"
}

function onTrigger(player, target, itemName)

	if(target == nil) then
		player:PrintToPlayer("You must enter a valid player name and item name.")
		player:PrintToPlayer("!giveweapon <player> <item name>")
		player:PrintToPlayer("For list of items, do: !giveweapon list")
		return
	end

    if (itemName == nil) then
		if (target == "list") then
			player:PrintToPlayer("spharai, mandau, excalibur, ragnarok, guttler, bravura, apocalypse, gungnir, kikoku, amanomurakumo, mjollnir,")	
			player:PrintToPlayer("claustrum, annihilator, yoichinoyumi, gjallarhorn, aegis, conqueror, glanzfaust, yagrush, laevateinn, murgleis,")
			player:PrintToPlayer("vajra, burtgang, liberator, aymur, carnwenhan, gastraphetes, kogarasumaru, nagi, ryunohige, nirvana, tizona,")
			player:PrintToPlayer("deathpenalty, kenkonken, terpsichore, tupsimati, thiefsknife, mekkishakki, hightailbullet, maneater, grosveneursbow,")
			player:PrintToPlayer("blaudolch, xsknife, mercurialkris, mercurialsword, hofud, valkyriesfork, chatoyantstaff, vividstrap1, bombcore,")
			player:PrintToPlayer("phantomtathlum, blacktathlum, firebomblet, hedgehogbomb, whitetathlum,  krakenclub, vulcansstaff, polegrip")
		else
			player:PrintToPlayer("You must enter a valid player name and item name.")
			player:PrintToPlayer("!givespitem <player> <item name>")
			player:PrintToPlayer("For list of items, do: !givespitem list")
        end
		return
    end

    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) )
        return
    end

	local setGiven = true;

    if (targ:getFreeSlotsCount() == 0) then
        player:PrintToPlayer( string.format( "Player '%s' does not have free space for those items!", target ) )
    else
		if (itemName == "spharai") then
			 targ:addItem(18264)
		elseif (itemName == "mandau") then
			 targ:addItem(18270)
		elseif (itemName == "excalibur") then
			 targ:addItem(18276)
		elseif (itemName == "ragnarok") then
			 targ:addItem(18282)
		elseif (itemName == "guttler") then
			 targ:addItem(18288)
		elseif (itemName == "bravura") then
			 targ:addItem(18294)
		elseif (itemName == "apocalypse") then
			 targ:addItem(18306)
		elseif (itemName == "gungnir") then
			 targ:addItem(18300)
		elseif (itemName == "kikoku") then
			 targ:addItem(18312)
		elseif (itemName == "amanomurakumo") then
			 targ:addItem(18318)
		elseif (itemName == "mjollnir") then
			 targ:addItem(18324)
		elseif (itemName == "claustrum") then
			 targ:addItem(18330)
		elseif (itemName == "annihilator") then
			 targ:addItem(18336)
		elseif (itemName == "yoichinoyumi") then
			 targ:addItem(18348)
		elseif (itemName == "gjallarhorn") then
			 targ:addItem(18342)
		elseif (itemName == "aegis") then
			 targ:addItem(15070)
		elseif (itemName == "conqueror") then
			 targ:addItem(18991)
		elseif (itemName == "glanzfaust") then
			 targ:addItem(18992)
		elseif (itemName == "yagrush") then
			 targ:addItem(18993)
		elseif (itemName == "laevateinn") then
			 targ:addItem(18994)
		elseif (itemName == "murgleis") then
			 targ:addItem(18995)
		elseif (itemName == "vajra") then
			 targ:addItem(18996)
		elseif (itemName == "burtgang") then
			 targ:addItem(18997)
		elseif (itemName == "liberator") then
			 targ:addItem(18998)
		elseif (itemName == "aymur") then
			 targ:addItem(18999)
		elseif (itemName == "carnwenhan") then
			 targ:addItem(19000)
		elseif (itemName == "gastraphetes") then
			 targ:addItem(19001)
		elseif (itemName == "kogarasumaru") then
			 targ:addItem(19002)
		elseif (itemName == "nagi") then
			 targ:addItem(19003)
		elseif (itemName == "ryunohige") then
			 targ:addItem(19004)
		elseif (itemName == "nirvana") then
			 targ:addItem(19005)
		elseif (itemName == "tizona") then
			 targ:addItem(19006)
		elseif (itemName == "deathpenalty") then
			 targ:addItem(19007)
		elseif (itemName == "kenkonken") then
			 targ:addItem(19008)
		elseif (itemName == "terpsichore") then
			 targ:addItem(18989)
		elseif (itemName == "tupsimati") then
			 targ:addItem(18990)
		elseif (itemName == "thiefsknife") then
			 targ:addItem(16480)
		elseif (itemName == "mekkishakki") then
			 targ:addItem(18595)
		elseif (itemName == "hightailbullet") then
			 targ:addItem(19236)
		elseif (itemName == "maneater") then
			targ:addItem(17946)
		elseif (itemName == "grosveneursbow") then
			targ:addItem(17245)
		elseif (itemName == "blaudolch") then
			targ:addItem(18015)
		elseif (itemName == "xsknife") then
			targ:addItem(18019)
		elseif (itemName == "mercurialkris") then
			targ:addItem(18020)
		elseif (itemName == "mercurialsword") then
			targ:addItem(18377)
		elseif (itemName == "hofud") then
			targ:addItem(17745)
		elseif (itemName == "valkyriesfork") then
			targ:addItem(18121)
		elseif (itemName == "chatoyantstaff") then
			 targ:addItem(18633)
		elseif (itemName == "vividstrap1") then
			 targ:addItem(19051)
		elseif (itemName == "bombcore") then
			 targ:addItem(18139)
		elseif (itemName == "phantomtathlum") then
			 targ:addItem(18140)
		elseif (itemName == "blacktathlum") then
			 targ:addItem(19212)
		elseif (itemName == "firebomblet") then
			 targ:addItem(18707)
		elseif (itemName == "hedgehogbomb") then
			 targ:addItem(17277)
		elseif (itemName == "whitetathlum") then
			 targ:addItem(19213)
		elseif (itemName == "krakenclub") then
			targ:addItem(17440)
		elseif (itemName == "vulcansstaff") then
			targ:addItem(17546)
		elseif (itemName == "polegrip") then
			targ:addItem(19025)
		else
			setGiven = false;
		end	 
        if(setGiven) then
			player:PrintToPlayer( string.format( "Gave player '%s' the weapon '%s' ", target, itemName ) )
		else
			player:PrintToPlayer("You must specify a valid weapon name, !giveweapon list")
		end
    end
end