---------------------------------------------------------------------------------------------------
-- func: spawnnm
-- desc: Spawns a defined NM.
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "s"
};

function onTrigger(player, nm, despawntime, respawntime)
-- Sky NMs
	if (nm == "despot") then
    SpawnMob( 17309954, 1200, respawntime );
	elseif (nm == "faust") then
	SpawnMob( 17506370, 1200, respawntime );
	elseif (nm == "zipacna") then
	SpawnMob( 17502570, 1200, respawntime );
	elseif (nm == "ollagrande") then
	SpawnMob( 17506669, 1200, respawntime );
	elseif (nm == "steamcleaner") then
	SpawnMob( 17502569, 1200, respawntime );
	elseif (nm == "motherglobe") then
	SpawnMob( 17506396, 1200, respawntime );
	elseif (nm == "brigandishblade") then
	SpawnMob( 17502568, 1200, respawntime );
	elseif (nm == "ullikummi") then
	SpawnMob( 17506418, 1200, respawntime );
	elseif (nm == "genbu") then
	SpawnMob( 17309980, 1200, respawntime );
	elseif (nm == "seiryu") then
	SpawnMob( 17309981, 1200, respawntime );
	elseif (nm == "suzaku") then
	SpawnMob( 17309983, 1200, respawntime );
	elseif (nm == "byakko") then
	SpawnMob( 17309982, 1200, respawntime );
	elseif (nm == "kirin") then
	SpawnMob( 17506670, 1200, respawntime );
	elseif (nm == "sky") then
	player:PrintToPlayer ( string.format ( "despot, faust, zipacna, ollagrande, steamcleaner, motherglobe, brigandishblade, ullikummi, genbu, seiryu, suzaku, kirin" ) );
--Sea NMs
	elseif (nm == "ixmnk") then
	SpawnMob( 16916815, 1200, respawntime );
	elseif (nm == "ixdrk") then
	SpawnMob( 16921018, 1200, respawntime );
	elseif (nm == "ixdrg") then
	SpawnMob( 16921022, 1200, respawntime );
	elseif (nm == "temperance") then
	SpawnMob( 16916814, 1200, respawntime );
	elseif (nm == "fortitude") then
	SpawnMob( 16921015, 1200, respawntime );
	elseif (nm == "faith") then
	SpawnMob( 16921021, 1200, respawntime );
	elseif (nm == "hope") then
	SpawnMob( 16912838, 1200, respawntime );
	elseif (nm == "justice") then
	SpawnMob( 16912839, 1200, respawntime );
	elseif (nm == "prudence") then
	SpawnMob( 16912846, 1200, respawntime );
	SpawnMob( 16912847, 1200, respawntime );
	elseif (nm == "love") then
	SpawnMob( 16912848, 1200, respawntime );
	elseif (nm == "av") then
	SpawnMob( 16912876, 1200, respawntime );
	elseif (nm == "sea") then
	player:PrintToPlayer ( string.format ( "temperance, fortitude, faith, hope, justice, prudence, love, av, ixmnk, ixdrk, ixdrg" ) );
--HNMs
	elseif (nm == "fafnir") then
	SpawnMob( 17408018, 1200, respawntime );
	elseif (nm == "nidhogg") then
	SpawnMob( 17408019, 1200, respawntime );
	elseif (nm == "turtle") then
	SpawnMob( 17301537, 1200, respawntime );
	elseif (nm == "aspid") then
	SpawnMob( 17301538, 1200, respawntime );
	elseif (nm == "behemoth") then
	SpawnMob( 17297440, 1200, respawntime );
	elseif (nm == "kingb") then
	SpawnMob( 17297441, 1200, respawntime );
	elseif (nm == "cerberus") then
	SpawnMob( 17027458, 1200, respawntime );
	elseif (nm == "hydra") then
	SpawnMob( 16986355, 1200, respawntime );
	elseif (nm == "jorm") then
	SpawnMob( 16797969, 1200, respawntime );
	elseif (nm == "vrtra") then
	SpawnMob( 17555890, 1200, respawntime );
	elseif (nm == "tiamat") then
	SpawnMob( 16806227, 1200, respawntime );
	elseif (nm == "khimaira") then
	SpawnMob( 17101201, 1200, respawntime );
	elseif (nm == "hnms") then
	player:PrintToPlayer ( string.format ( "fafnir, nidhogg, aspid, kingb, cerberus, hydra, jorm, vrtra, tiamat, khimaira" ) );
--Other
	elseif (nm == "ll") then
	SpawnMob( 17215868, 1200, respawntime );
	elseif (nm == "ve") then
	SpawnMob( 17199438, 1200, respawntime );
	elseif (nm == "argus") then
	SpawnMob( 17588674, 1200, respawntime );
	elseif (nm == "loo") then
	SpawnMob( 17649731, 1200, respawntime );
	elseif (nm == "dynamislord") then
	SpawnMob( 17330177, 1200, respawntime );
	elseif (nm == "kingarthro") then
	SpawnMob( 17203216, 1200, respawntime );
	elseif (nm == "other") then
	player:PrintToPlayer ( string.format ( "ll -leaping lizzy, ve -valkurm emperor, argus, loo, kingarthro" ) );
--Help
	elseif (nm == "?") then
	player:PrintToPlayer ( string.format ( "Use @spawnnm: sky, sea, hnms, other - for lists of NMs and spellings" ) );
	else
	player:PrintToPlayer ( string.format ( "Use @spawnnm: sky, sea, hnms, other - for lists of NMs and spellings" ) );
	end
end 