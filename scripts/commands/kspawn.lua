---------------------------------------------------------------------------------------------------
-- func: spawn a mob
-- revised by: fishy
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "s"
};
function onTrigger(player, kspawn)
	if (kspawn == "0" or kspawn == nil) then
        player:PrintToPlayer( "1: Fafnir, 2: Nidhogg, 3: Behemoth, 4: King Behemoth");
        player:PrintToPlayer( "5: Adamantoise, 6: Aspid, 7: Cerberus, 8: Khimaira ");
		player:PrintToPlayer( "9: Jormungand, 10: Tiamat, 11: Vrtra, 12: Bismarck");
        player:PrintToPlayer( "13: Gurfurlur, 14: Medusa, 15: Gulool, 16: Dark Ixion");
	elseif (kspawn == "1") then
		SpawnMob(17408018);
		player:PrintToPlayer("Fafnir up");--fafnir
		--player:PrintToServer("Server Event, Fafnir is about to Spawn!");
	elseif (kspawn == "2") then
		SpawnMob(17408019);
		player:PrintToPlayer("Nidhogg up");--Nidhogg
		--player:PrintToServer("Server Event, Nidhogg is about to Spawn!");
	elseif (kspawn == "3") then
		SpawnMob(17297440);
		player:PrintToPlayer("Behemoth up");--Behemoth
		--player:PrintToServer("Server Event, Behemoth is about to Spawn!");
	elseif (kspawn == "4") then
		SpawnMob(17297441);
		player:PrintToPlayer("King Behemoth up");--mob Behemoth
		--player:PrintToServer("Server Event, King Behemoth is about to Spawn!");
	elseif (kspawn == "5") then
		SpawnMob(17301537);
		player:PrintToPlayer("Adamantoise up");--Adamantoise
		--player:PrintToServer("Server Event, Adamantoise is about to Spawn!");
	elseif (kspawn == "6") then
		SpawnMob(17301538);
		player:PrintToPlayer("Aspid up");--Aspidochelone
		--player:PrintToServer("Server Event, Aspidochelone is about to Spawn!");
	elseif (kspawn == "7") then
		SpawnMob(17027458);
		player:PrintToPlayer("Cerberus up");--Cerberus
		--player:PrintToServer("Server Event, Cerberus is about to Spawn!");
	elseif (kspawn == "8") then
		SpawnMob(17101201);
		player:PrintToPlayer("Khimaira up");--Khimaira
		--player:PrintToServer("Server Event, Khimaira is about to Spawn!");
    elseif (kspawn == "9") then
		SpawnMob(16797969);
		player:PrintToPlayer("Jormungand up");
	elseif (kspawn == "10") then
		SpawnMob(16806227);
		player:PrintToPlayer("Tiamat up");
	elseif (kspawn == "11") then
		SpawnMob(17555890);
		player:PrintToPlayer("Vrtra up");
	elseif (kspawn == "12") then
		SpawnMob(16793862);
		player:PrintToPlayer("Bismarck up");
	elseif (kspawn == "13") then
		SpawnMob(17031592);
		player:PrintToPlayer("Gurfurlur up");
	elseif (kspawn == "14") then
		SpawnMob(16998862);
		player:PrintToPlayer("Medusa up");
	elseif (kspawn == "15") then
		SpawnMob(17043875);
		player:PrintToPlayer("Gulool Ja Ja up");
	elseif (kspawn == "16") then
		SpawnMob(17109367);
		player:PrintToPlayer("Dark Ixion up");
	else
       player:PrintToPlayer( string.format( "The HNM Spawn menu doesn't have a option %i, Kupo!", page ) );
    end
end