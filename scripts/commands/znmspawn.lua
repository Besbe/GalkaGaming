---------------------------------------------------------------------------------------------------
-- func: znmspawn <nm>
-- desc: Spawns a ZNM Mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "s"
};

function onTrigger(player, nm)
	if (nm == "tinnin") then -- Tinnin 16986431
		SpawnMob(16986431)
	elseif (nm == "armedgears") then -- Armed Gears 17072178
		SpawnMob(17072178)
	elseif (nm == "gotohzha") then -- Gotoh Zha 16986430
		SpawnMob(16986430)
	elseif (nm == "dea") then -- Dea 16990474
		SpawnMob(16990474)
	elseif (nm == "irizima") then -- Iriz Ima 16986429
		SpawnMob(16986429)
	elseif (nm == "amooshah") then -- Amooshah 16990473
		SpawnMob(16990473)
	elseif (nm == "iririsamariri") then -- Iriri Samariri 17043888
		SpawnMob(17043888)
	elseif (nm == "vulpangue") then -- Vulpangue 16986428
		SpawnMob(16986428)
	elseif (nm == "chamrosh") then -- Chamrosh 17043887
		SpawnMob(17043887)
	elseif (nm == "cheesehoarder") then -- Cheese Hoarder 17072172
		SpawnMob(17072172)
	elseif (nm == "sarameya") then -- Sarameya 17027485
		SpawnMob(17027485)
	elseif (nm == "nosferatu") then -- Nosferatu 17056157
		SpawnMob(17056157)
	elseif (nm == "bhurborlor") then -- Bhurborlor    17027474
		SpawnMob(17027474)
	elseif (nm == "achamoth") then -- Achamoth  17031600
		SpawnMob(17031600)
	elseif (nm == "anantaboga") then -- Anantaboga    17027473
		SpawnMob(17027473)
	elseif (nm == "reaction") then -- Reacton   17031599
		SpawnMob(17031599)
	elseif (nm == "dextrose") then -- Dextrose  17031598
		SpawnMob(17031598)
	elseif (nm == "brassborer") then -- Brass Borer   17027471
		SpawnMob(17027471)
	elseif (nm == "claret") then -- Claret    17027472
		SpawnMob(17027472)
	elseif (nm == "ob") then -- Ob    17072171
		SpawnMob(17072171)
	elseif (nm == "tyger") then -- Tyger 17101203
		SpawnMob(17101203)
	elseif (nm == "mahjlaef") then -- Mahjlaef  17101204
		SpawnMob(17101204)
	elseif (nm == "lamia") then -- Experimental Lamia    17101205
		SpawnMob(17101205)
	elseif (nm == "nuhn") then -- Nuhn  16998874
		SpawnMob(16998874)
	elseif (nm == "wulgaru") then -- Wulgaru   17072179
		SpawnMob(17072179)
	elseif (nm == "zareehkl") then -- Zareehkl  16998873
		SpawnMob(16998873)
	elseif (nm == "verdelet") then -- Verdelet  17101202
		SpawnMob(17101202)
	elseif (nm == "velionis") then -- Velionis  16998872
		SpawnMob(16998872)
	elseif (nm == "lilapkallu") then -- Lil Apkallu   16998871
		SpawnMob(16998871)
	elseif (nm == "chigre") then -- Chigre    17056186
		SpawnMob(17056186)
	elseif (nm == "pwarden") then -- Pandemonium Warden	17056167
		SpawnMob(17056167)
	else
		player:PrintToPlayer ("@zspawn <nm>")
		player:PrintToPlayer("tinnin | armedgears | gotohzha | dea | irizima | amooshah | iririsamariri | vulpangue")
		player:PrintToPlayer("chamrosh | cheesehoarder | sarameya | nosferatu | bhurborlor | achamoth | anantaboga")
		player:PrintToPlayer("reaction | dextrose | brassborer | claret | ob | tyger | mahjlaef | lamia | nuhn")
		player:PrintToPlayer("wulgaru | zareehkl | verdelet | velionis | lilapkallu | chigre | pwarden")
	end
end