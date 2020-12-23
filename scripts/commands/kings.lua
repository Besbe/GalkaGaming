---------------------------------------------------------------------------------------------------
-- func: kport <nm>
-- auth: Sonicblazer
-- desc: Consolidate HNM warp
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "s"
};


function onTrigger(player, nm)
	if (nm == "faf") then
		player:setPos( 55, 6, 20, 238, 154 ); -- Fafnir/Nidhogg
	elseif (nm == "kb") then
		player:setPos( -257, -19, 69, 196, 127 ); -- Behemoth/King Behemoth
	elseif (nm == "aspid") then
		player:setPos( -53, -3, 55, 41, 128 ); -- Adamantoise/Aspid
	elseif (nm == "khim") then
		player:setPos( 821, -10, 388, 99, 79 ); -- Khimaera
	elseif (nm == "hydra") then
		player:setPos( -277, -27, 22, 66, 51 ); -- Hydra
	elseif (nm == "cerb") then
		player:setPos( 287, -23, -45, 10, 61 ); -- Cerberus
	elseif (nm == "jormy") then
		player:setPos( -160, -176, 117, 126, 5 ); -- Jormungand
	elseif (nm == "tiamat") then
		player:setPos(-561, -11, -33, 16, 7); -- Tiamat
	elseif (nm == "vrtra") then
		player:setPos(249, 6, -330, 162, 190); -- Vrtra
	elseif (nm == "gurf") then
		player:setPos(-59, -23, 3, 162, 62); -- gurf
	elseif (nm == "medusa") then
		player:setPos(-460, -20, 460, 162, 54); -- medusa
	elseif (nm == "gulool") then
		player:setPos(-301, 15, -380, 162, 65); -- galooljaja
	elseif (nm == "bismarck") then
		player:setPos(-622, 0, -657, 209, 4); -- bismarck
	elseif (nm == "di") then
		player:setPos(379, -26, -54, 192, 81); -- Dark Ixion
	else
		player:PrintToPlayer("Must use !kings <kingname>")
		player:PrintToPlayer("faf, kb, aspid, khim, hydra, cerb, jormy, tiamat, vrtra, gurf, medusa, gulool, bismarck, di");
	end
end; 