---------------------------------------------------------------------------------------------------
-- func: despawn a king
-- revised by: fishy
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "s"
};

function onTrigger(player, kspawn)
	if (kspawn == "0" or kspawn == nil) then
        player:PrintToPlayer( "1: Fafnir, 2: Nidhogg, 3: Behemoth, 4: King Behemoth");
        player:PrintToPlayer( "5: Adamantoise, 6: Aspid, 7: Cerberus, 8: Khimaira ");
		player:PrintToPlayer( "9: Jormungand, 10: Tiamat, 11: Vrtra, 12: Bismarck");
        player:PrintToPlayer( "13: Gurfurlur, 14: Medusa, 15: Gulool, 16: Dark Ixion");
	elseif (kspawn == "1") then
		DespawnMob(17408018);
		player:PrintToPlayer("Fafnir Despawned");--fafnir
	elseif (kspawn == "2") then
		DespawnMob(17408019);
		player:PrintToPlayer("Nidhogg Despawned");--Nidhogg
	elseif (kspawn == "3") then
		DespawnMob(17297440);
		player:PrintToPlayer("Behemoth Despawned");--Behemoth
	elseif (kspawn == "4") then
		DespawnMob(17297441);
		player:PrintToPlayer("mob Behemoth Despawned");--mob Behemoth
	elseif (kspawn == "5") then
		DespawnMob(17301537);
		player:PrintToPlayer("Adamantoise Despawned");--Adamantoise
	elseif (kspawn == "6") then
		DespawnMob(17301538);
		player:PrintToPlayer("Aspid Despawned");--Aspidochelone
	elseif (kspawn == "7") then
		DespawnMob(17027458);
		player:PrintToPlayer("Cerberus Despawned");--Cerberus
	elseif (kspawn == "8") then
		DespawnMob(17101201);
		player:PrintToPlayer("Khimaira Despawned");--Khimaira
	elseif (kspawn == "9") then
		DespawnMob(16797969);
		player:PrintToPlayer("Jormungand Despawned");
	elseif (kspawn == "10") then
		DespawnMob(16806227);
		player:PrintToPlayer("Tiamat Despawned");
	elseif (kspawn == "11") then
		DespawnMob(17555890);
		player:PrintToPlayer("Vrtra Despawned");
	elseif (kspawn == "12") then
		DespawnMob(16793862);
		player:PrintToPlayer("Bismarck Despawned");
	elseif (kspawn == "13") then
		DespawnMob(17031592);
		player:PrintToPlayer("Gurfurlur Despawned");
	elseif (kspawn == "14") then
		DespawnMob(16998862);
		player:PrintToPlayer("Medusa Despawned");
	elseif (kspawn == "15") then
		DespawnMob(17043875);
		player:PrintToPlayer("Gulool Ja Ja Despawned");
	elseif (kspawn == "16") then
		DespawnMob(17109367);
		player:PrintToPlayer("Dark Ixion Despawned");
	else
       player:PrintToPlayer( string.format( "The HNM Spawn menu doesn't have a option %i, Kupo!", page ) );
    end
end