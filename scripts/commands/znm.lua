---------------------------------------------------------------------------------------------------
-- func: znm <nm>
-- auth: Tonzoffun
-- desc: Consolidate ZNM warp
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "s"
};


function onTrigger(player, nm)

	if (nm == "tinnin") then -- Tinnin 16986431
		player:setPos(-64, -11, -641, 0, 51);
	elseif (nm == "armedgears") then -- Armed Gears 17072178
		player:setPos(-19.957, -4, -182.656, 0, 72);
	elseif (nm == "gotohzha") then -- Gotoh Zha 16986430
		player:setPos(-337, -31, 676, 0, 51);
	elseif (nm == "dea") then -- Dea 16990474
		player:setPos(-34, -32, 481, 0, 52);
	elseif (nm == "irizima") then -- Iriz Ima 16986429
		player:setPos(253, -23, 116, 0, 51);
	elseif (nm == "amooshah") then -- Amooshah 16990473
		player:setPos(334, -10, 184, 0, 52);
	elseif (nm == "iririsamariri") then -- Iriri Samariri 17043888
		player:setPos(-118, 7, -80, 0, 65);
	elseif (nm == "vulpangue") then -- Vulpangue 16986428
		player:setPos(-697, -7, -123, 0, 51);
	elseif (nm == "chamrosh") then -- Chamrosh 17043887
		player:setPos(206, 14, -285, 0, 65);
	elseif (nm == "cheesehoarder") then -- Cheese Hoarder 17072172
		player:setPos(-184.112, -8.105, 24.555, 0, 72);
	elseif (nm == "sarameya") then -- Sarameya 17027485
		player:setPos(323, -14, -595, 0, 61);
	elseif (nm == "nosferatu") then -- Nosferatu 17056157
		player:setPos(-198.6, 8.387, -60.832, 0, 68);
	elseif (nm == "bhurborlor") then -- Bhurborlor    17027474
		player:setPos(88, -22.029, 70, 0, 61);
	elseif (nm == "achamoth") then -- Achamoth  17031600
		player:setPos(-13.17, 9.699, 339.54, 0, 62);
	elseif (nm == "anantaboga") then -- Anantaboga    17027473
		player:setPos(-368.341, -13.742, 366.448, 0, 61);
	elseif (nm == "reaction") then -- Reacton   17031599
		player:setPos(18, -9, 213, 0, 62);
	elseif (nm == "dextrose") then -- Dextrose  17031598
		player:setPos(-144, 11, 464, 0, 62);
	elseif (nm == "brassborer") then -- Brass Borer   17027471
		player:setPos(399.386, -27.022, 120.479, 0, 61);
	elseif (nm == "claret") then -- Claret    17027472
		player:setPos(497, -9, 52, 0, 61);
	elseif (nm == "ob") then -- Ob    17072171
		player:setPos(552.914, -0.112, -135.001, 0, 72);
	elseif (nm == "tyger") then -- Tyger 17101203
		player:setPos(763, -9, 638, 0, 79);
	elseif (nm == "mahjlaef") then -- Mahjlaef  17101204
		player:setPos(695.369, -7.147, 527.646, 0, 79);
	elseif (nm == "experimentallamia") then -- Experimental Lamia    17101205
		player:setPos(-773.369, -11.824, 322.298, 0, 79);
	elseif (nm == "nuhn") then -- Nuhn  16998874
		player:setPos(-451, -7, 389, 0, 54);
	elseif (nm == "wulgaru") then -- Wulgaru   17072179
		player:setPos(-22.265, -4.449, 204.588, 0, 72);
	elseif (nm == "zareehkl") then -- Zareehkl  16998873
		player:setPos(177.64, -5.159, 181.399, 0, 54);
	elseif (nm == "verdelet") then -- Verdelet  17101202
		player:setPos(417.02, -19.295, -69.99, 0, 79);
	elseif (nm == "velionis") then -- Velionis  16998872
		player:setPos(313.17, -4.089, 26.211, 0, 54);
	elseif (nm == "lilapkallu") then -- Lil Apkallu   16998871
		player:setPos(489.74, -2.742, 168.49, 0, 54);
	elseif (nm == "chigre") then -- Chigre    17056186
		player:setPos(-217.5, 34.866, 13.689, 0, 68);
	elseif (nm == "pwarden") then -- Pandemonium Warden	17056167
		player:setPos(208.16, 33.750, -138.61, 0, 68);
	else
		player:PrintToPlayer("@znm <mob>");
		player:PrintToPlayer("tinnin | armedgears | gotohzha | dea | irizima | amooshah | iririsamariri | vulpangue");
		player:PrintToPlayer("chamrosh | cheesehoarder | sarameya | nosferatu | bhurborlor | achamoth | anantaboga");
		player:PrintToPlayer("reaction | dextrose | brassborer | claret | ob | tyger | mahjlaef | lamia | nuhn");
		player:PrintToPlayer("wulgaru | zareehkl | verdelet | velionis | lilapkallu | chigre | pwarden");
	end
end 