-- Custom MOBS or NPCS added

-- Moa Constrictors BCNM
UPDATE mob_spawn_points SET pos_x = -140.667, pos_y = 55.587, pos_z = -215.541 WHERE mobid = "17375443";
UPDATE mob_spawn_points SET pos_x = -144.130, pos_y = 55.662, pos_z = -216.312 WHERE mobid = "17375444";
UPDATE mob_spawn_points SET pos_x = 18.489, pos_y = -3.855, pos_z = -20.360 WHERE mobid = "17375446";
UPDATE mob_spawn_points SET pos_x = 16.118, pos_y = -4.307, pos_z = -19.686 WHERE mobid = "17375447";
UPDATE mob_spawn_points SET pos_x = 0.000, pos_y = 0.000, pos_z = 0.000 WHERE mobid = "17375449";
UPDATE mob_spawn_points SET pos_x = 0.000, pos_y = 0.000, pos_z = 0.000 WHERE mobid = "17375450";
-- Zeruhn Mines
INSERT INTO `mob_spawn_points` VALUES (17482751,'Giant_Amoeba','Giant Amoeba',8,60.425,8.735,-263.460,181); -- Giant Amoeba NM


-- RANDOM FIXES
-- Uleguerand Range
UPDATE mob_spawn_points SET mobname = "Mountain_Worm_NM" WHERE mobid = "16798031"; -- This NM needs a unique name as it shares his with regular worms in Ule. Otherwise it can't be scripted.

-- REMOVING OOE Mobs
-- East Ronfaure
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Rambukk";
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Quagmire Pugil";
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Sunderclaw";
-- West Ronfaure
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Pyracmon";
-- Carpenters_Landing
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Tempest Tigon";
-- Bibiki Bay
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Shankha";
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Splacknuck";
-- Uleguerand Range
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Skvader";
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Magnotaur";
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobname = "Frost_Flambeau";

-- Korroloka Tunnel
UPDATE mob_spawn_points SET pos_x = -212.056, pos_y = -10.185, pos_z = 178.804 WHERE mobname = "Korroloka_Leech" and mobid = 17486187;
UPDATE mob_spawn_points SET pos_x = -206.117, pos_y = -11.701, pos_z = 179.106 WHERE mobname = "Korroloka_Leech" and mobid = 17486188;
UPDATE mob_spawn_points SET pos_x = -204.902, pos_y = -11.361, pos_z = 173.605 WHERE mobname = "Korroloka_Leech" and mobid = 17486189;







-- CLEANING UP OVER POPULATION OF MOBS
-- Maze of Shakhrami



/*  COMMENTING THIS OUT FOR WINGS AS DOESN'T SEEMS TO BE NEEDED (mob population in Maze looks fine)


UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588449; -- Poison Leech
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588690; -- Poison Leech
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588693; -- Poison Leech
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588686; -- Poison Leech
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588679; -- Poison Leech
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588680; -- Poison Leech
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588678; -- Poison Leech
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588689; -- Poison Leech
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588692; -- Poison Leech
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588327; -- Ghoul
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588326; -- Ghoul
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588612; -- Wendigo
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588660; -- Goblin Shaman
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588659; -- Globin Smithy
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588663; -- Globin Furrier
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588632; -- Globin Shaman
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588658; -- Goblin Furrier
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588655; -- Goblin Shaman
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588694; -- Protozoan
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588665; -- Goblin Shaman
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588672; -- Labyrinth Scorpion
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588638; -- Ancient Bat
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588639; -- Ancient Bat
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588586; -- Labyrinth Scorpion
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588625; -- Ancient Bat
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588596; -- Goblin Mugger
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588592; -- Goblin Gambler
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588597; -- Goblin Leecher
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588507; -- Stink Bats
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588545; -- Wight
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588577; -- Wight
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588531; -- Wight
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588537; -- Ancient Bat
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588527; -- Wight
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588504; -- Goblin Ambusher
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588508; -- Stink Bat
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588498; -- Wight
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588521; -- Abyss Worm
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588581; -- Wight
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588518; -- Abyss Worm
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588576; -- Wight
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588505; -- Goblin Tinkerer
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588511; -- Goblin Leecher
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588494; -- Stink Bats
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588535; -- Abyss Worm
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588533; -- Abyss Worm
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588522; -- Abyss Worm
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588580; -- Wight
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588503; -- Goblin Butcher
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588517; -- Abyss Worm
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588470; -- Ghoul
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588302; -- Goblin Butcher
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588300; -- Goblin Ambusher
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588308; -- Goblin Leecher
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588312; -- Goblin Gambler
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588307; -- Goblin Mugger
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588587; -- Protozoan
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17588544; -- Wight 
*/

-- Monastic Cavern
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391621; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391639; -- Orcish Zerker
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391640; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391623; -- Orcish Gladiator
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391620; -- Orcish Trooper
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391618; -- Orcish Footsoldier
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391631; -- Orcish Zerker
UPDATE mob_spawn_points SET pos_x = -20.4147, pos_y = -0.1545, pos_z = -357.7487 WHERE mobid = 17391624; -- Orcish Trooper
UPDATE mob_spawn_points SET pos_x = -22.9977, pos_y = -1.6404, pos_z = -368.0098 WHERE mobid = 17391632; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391685; -- Orcish Zerker
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391686; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391687; -- Orcish Veteran
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391693; -- Orcish Veteran
UPDATE mob_spawn_points SET pos_x = -22.2975, pos_y = -0.6960, pos_z = -212.0731 WHERE mobid = 17391691; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 25.4334, pos_y = -0.5305, pos_z = -219.0916 WHERE mobid = 17391692; -- Orcish Dreadnought
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391697; -- Orcish Veteran
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391694; -- Orcish Predator
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391699; -- Orcish Zerker
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391702; -- Orcish Predator
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391738; -- Orcish Champion
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391737; -- Orcish Dreadnought
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391719; -- Orcish Dreadnought
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391721; -- Orcish Dragoon
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391724; -- Orcish Champion
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391730; -- Orcish Champion
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391733; -- Orcish Dreadnought
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391728; -- Orcish Farkiller
UPDATE mob_spawn_points SET pos_x = -41.9276, pos_y = -0.1078, pos_z = -139.0336 WHERE mobid = 17391705; -- Orcish Champion
UPDATE mob_spawn_points SET pos_x = -63.2345, pos_y = -0.4325, pos_z = -232.5098 WHERE mobid = 17391670; -- Orcish Dreadnought
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391673; -- Orcish Zerker
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391671; -- Orcish Veteran
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391676; -- Orcish Predator
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391664; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391657; -- Orcish Veteran
UPDATE mob_spawn_points SET pos_x = -57.2369, pos_y = -0.3426, pos_z = -262.1214 WHERE mobid = 17391658; -- Orcish Dreadnought
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391648; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391647; -- Orcish Zerker
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391641; -- Orcish Veteran
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391655; -- Orcish
UPDATE mob_spawn_points SET pos_x = 55.5556, pos_y = -0.4180, pos_z = -259.9413 WHERE mobid = 17391682; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391747; -- Orcish Dragoon
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391759; -- Orcish Dragoon
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391746; -- Orcish Champion
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391740; -- Orcish Farkiller
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391752; -- Orcish Farkiller
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391753; -- Orcish Dreadnought
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391748; -- Orcish Farkiller
UPDATE mob_spawn_points SET pos_x = 218.0535, pos_y = -0.5788, pos_z = -148.6448 WHERE mobid = 17391757; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 216.7683, pos_y = -9.1406, pos_z = -238.7831 WHERE mobid = 17391750; -- Orcish Warchief
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391799; -- Orcish Footsoldier
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391798; -- Orcish Bowshooter
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391790; -- Orcish Gladiator
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391792; -- Orcish Predator
UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = 17391785; -- Orcish Footsoldier
-- UPDATE mob_spawn_points SET pos_x = 0, pos_y = 0, pos_z = 0 WHERE mobid = xxxxxx; -- xxxx
