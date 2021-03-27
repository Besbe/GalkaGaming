-- Custom MOBS or NPCS added

-- Zeruhn Mines

INSERT INTO `mob_groups` VALUES (8,6031,172,'Giant_Amoeba',0,32,3999,0,0,6,8,0); -- Giant Amoeba NM


-- Adjusting OOE mob levels to ERA values (also custom non-ERA adjustments)

-- FeiYin
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "40", maxLevel = "42" WHERE g.zoneid = 204 AND s.mobname = "Balayang";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "41", maxLevel = "43" WHERE g.zoneid = 204 AND s.mobname = "Sentient_Carafe";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "40", maxLevel = "42" WHERE g.zoneid = 204 AND s.mobname = "Wekufe";

-- Bostaunieux Oubliette
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "55", maxLevel = "59" WHERE g.zoneid = 167 AND s.mobname = "Blind_Bat";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "64", maxLevel = "66" WHERE g.zoneid = 167 AND s.mobname = "Dabilla";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "60", maxLevel = "68" WHERE g.zoneid = 167 AND s.mobname = "Panna_Cotta";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "68", maxLevel = "70" WHERE g.zoneid = 167 AND s.mobname = "Nachtmahr";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "69", maxLevel = "74" WHERE g.zoneid = 167 AND s.mobname = "Wurdalak";

-- Toraimarai Canal
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "58", maxLevel = "60" WHERE g.zoneid = 169 AND s.mobname = "Deviling_Bats";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "60", maxLevel = "62" WHERE g.zoneid = 169 AND s.mobname = "Plunderer_Crab";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "57", maxLevel = "59" WHERE g.zoneid = 169 AND s.mobname = "Blackwater_Pugil";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "65", maxLevel = "67" WHERE g.zoneid = 169 AND s.mobname = "Starborer";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "65", maxLevel = "67" WHERE g.zoneid = 169 AND s.mobname = "Sodden_Bones";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "65", maxLevel = "67" WHERE g.zoneid = 169 AND s.mobname = "Drowned_Bones";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "64", maxLevel = "67" WHERE g.zoneid = 169 AND s.mobname = "Flume_Toad";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "65", maxLevel = "67" WHERE g.zoneid = 169 AND s.mobname = "Rapier_Scorpion";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "66", maxLevel = "69" WHERE g.zoneid = 169 AND s.mobname = "Poroggo_Excavator";

-- Garlaige Citadel
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "56", maxLevel = "58" WHERE g.zoneid = 200 AND s.mobname = "Warden_Beetle";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "59", maxLevel = "62" WHERE g.zoneid = 200 AND s.mobname = "Kaboom";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "53", maxLevel = "55" WHERE g.zoneid = 200 AND s.mobname = "Fortalice_Bats";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "54", maxLevel = "56" WHERE g.zoneid = 200 AND s.mobname = "Donjon_Bat";

-- Crawlers' Nest
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "50", maxLevel = "53" WHERE g.zoneid = 197 AND s.mobname = "Dancing_Jewel";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "47", maxLevel = "49" WHERE g.zoneid = 197 AND s.mobname = "King_Crawler";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "51", maxLevel = "54" WHERE g.zoneid = 197 AND s.mobname = "Olid_Funguar";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "55", maxLevel = "57" WHERE g.zoneid = 197 AND s.mobname = "Vespo";

-- The Eldieme Necropolis
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "53", maxLevel = "55" WHERE g.zoneid = 195 AND s.mobname = "Nekros_Hound";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "60", maxLevel = "63" WHERE g.zoneid = 195 AND s.mobname = "Hellbound_Warrior";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "60", maxLevel = "63" WHERE g.zoneid = 195 AND s.mobname = "Hellbound_Warlock";

-- Dangruf_Wadi
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Couloir_Leech";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Fume_Lizard";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Witchetty_Grub";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Prim_Pika";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "16", maxLevel = "20" WHERE g.zoneid = 191 AND s.mobname = "Trimmer";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Natty_Gibbon";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Goblin_Headsman";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Goblin_Conjurer";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Goblin_Bladesmith";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Goblin_Bushwhacker";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Goblin_Brigand";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "21", maxLevel = "23" WHERE g.zoneid = 191 AND s.mobname = "Goblin_Healer";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "16", maxLevel = "20" WHERE g.zoneid = 191 AND s.mobname = "Fire_Elemental";

-- Roungment Pass
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "26", maxLevel = "30" WHERE g.zoneid = 166 AND s.mobname = "Goblin_Artificer";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "26", maxLevel = "30" WHERE g.zoneid = 166 AND s.mobname = "Goblin_Hoodoo";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "26", maxLevel = "30" WHERE g.zoneid = 166 AND s.mobname = "Goblin_Tanner";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "26", maxLevel = "30" WHERE g.zoneid = 166 AND s.mobname = "Goblin_Chaser";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "25", maxLevel = "28" WHERE g.zoneid = 166 AND s.mobname = "Bilesucker";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "42", maxLevel = "44" WHERE g.zoneid = 166 AND s.mobname = "Hovering_Oculus";

-- Gusgen Mines
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "26", maxLevel = "30" WHERE g.zoneid = 196 AND s.mobname = "Accursed_Soldier";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "23", maxLevel = "27" WHERE g.zoneid = 196 AND s.mobname = "Accursed_Sorcerer";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "27", maxLevel = "30" WHERE g.zoneid = 196 AND s.mobname = "Madfly";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "23", maxLevel = "26" WHERE g.zoneid = 196 AND s.mobname = "Rockmill";

-- Maze_of_Shakhrami
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "26", maxLevel = "29" WHERE g.zoneid = 198 AND s.mobname = "Warren_Bat";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "23", maxLevel = "26" WHERE g.zoneid = 198 AND s.mobname = "Chaser_Bats";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "24", maxLevel = "28" WHERE g.zoneid = 198 AND s.mobname = "Bleeder_Leech";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "29", maxLevel = "31" WHERE g.zoneid = 198 AND s.mobname = "Crypterpillar";

-- Ordelles_Caves
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "23", maxLevel = "26" WHERE g.zoneid = 193 AND s.mobname = "Buds_Bunny";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "29", maxLevel = "31" WHERE g.zoneid = 193 AND s.mobname = "Targe_Beetle";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "27", maxLevel = "29" WHERE g.zoneid = 193 AND s.mobname = "Swagger_Spruce";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "25", maxLevel = "27" WHERE g.zoneid = 193 AND s.mobname = "Bilis_Leech";

-- Outer Horutoto Ruins
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "15", maxLevel = "18" WHERE g.zoneid = 194 AND s.mobname = "Fetor_Bats";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "20", maxLevel = "23" WHERE g.zoneid = 194 AND s.mobname = "Thorn_Bat";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "23", maxLevel = "25" WHERE g.zoneid = 194 AND s.mobname = "Fuligo";

 -- Inner_Horutoto_Ruins
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "17", maxLevel = "20" WHERE g.zoneid = 192 AND s.mobname = "Covin_Bat";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "11", maxLevel = "16" WHERE g.zoneid = 192 AND s.mobname = "Deathwatch_Beetle";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "20", maxLevel = "23" WHERE g.zoneid = 192 AND s.mobname = "Goblin_Flesher";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "20", maxLevel = "23" WHERE g.zoneid = 192 AND s.mobname = "Goblin_Lurcher";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "20", maxLevel = "23" WHERE g.zoneid = 192 AND s.mobname = "Goblin_Metallurgist";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "20", maxLevel = "23" WHERE g.zoneid = 192 AND s.mobname = "Goblin_Trailblazer";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "25", maxLevel = "28" WHERE g.zoneid = 192 AND s.mobname = "Skinnymalinks";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "25", maxLevel = "28" WHERE g.zoneid = 192 AND s.mobname = "Skinnymajinx";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "12", maxLevel = "15" WHERE g.zoneid = 192 AND s.mobname = "Troika_Bats";

-- King_Ranperres_Tomb
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "62", maxLevel = "64" WHERE g.zoneid = 190 AND s.mobname = "Ogre_Bat";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "58", maxLevel = "60" WHERE g.zoneid = 190 AND s.mobname = "Ossuary_Worm";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "64", maxLevel = "66" WHERE g.zoneid = 190 AND s.mobname = "Bonnet_Beetle";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "63", maxLevel = "65" WHERE g.zoneid = 190 AND s.mobname = "Barrow_Scorpion";

-- Zeruhn_Mines
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "2", maxLevel = "4" WHERE g.zoneid = 172 AND s.mobname = "Colliery_Bat";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "3", maxLevel = "5" WHERE g.zoneid = 172 AND s.mobname = "Soot_Crab";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "2", maxLevel = "4" WHERE g.zoneid = 172 AND s.mobname = "Burrower_Worm";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "3", maxLevel = "6" WHERE g.zoneid = 172 AND s.mobname = "Veindigger_Leech";

-- Korroloka_Tunnel
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "28", maxLevel = "31" WHERE g.zoneid = 173 AND s.mobname = "Spool_Leech";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "29", maxLevel = "32" WHERE g.zoneid = 173 AND s.mobname = "Lacerator";

-- Boyahda tree
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "72", maxLevel = "75" WHERE g.zoneid = 153 AND s.mobname = "Mourning_Crawler";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "40", maxLevel = "43" WHERE g.zoneid = 153 AND s.mobname = "Snaggletooth_Peapuk";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "72", maxLevel = "74" WHERE g.zoneid = 153 AND s.mobname = "Viseclaw";

-- Lufaise Meadows
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "47", maxLevel = "49" WHERE g.zoneid = 24 AND s.mobname = "Abraxas";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "47", maxLevel = "49" WHERE g.zoneid = 24 AND s.mobname = "Dark_Elemental";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "41", maxLevel = "43" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Bard";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "41", maxLevel = "43" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Beastmaster";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "52", maxLevel = "54" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Black_Mage";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "52", maxLevel = "54" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Dark_Knight";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "52", maxLevel = "54" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Dragoon";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "34", maxLevel = "36" WHERE g.zoneid = 24 AND s.mobname = "Fomor_s_Wyvern";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "52", maxLevel = "54" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Monk";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "52", maxLevel = "54" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Ninja";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "52", maxLevel = "54" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Paladin";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "41", maxLevel = "43" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Ranger";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "41", maxLevel = "43" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Red_Mage";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "41", maxLevel = "43" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Samurai";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "53", maxLevel = "55" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Samurai";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "41", maxLevel = "43" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Summoner";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "34", maxLevel = "36" WHERE g.zoneid = 24 AND s.mobname = "Fomor_s_Elemental";
UPDATE mob_groups g JOIN mob_spawn_points s ON (g.groupid = s.groupid) SET minLevel = "42", maxLevel = "44" WHERE g.zoneid = 24 AND s.mobname = "Fomor_Warrior";


-- CUSTOM NON-ERA ADJUSTMENTS

-- Yuhtunga Jungle
UPDATE mob_groups SET minLevel = "31"  WHERE zoneid = 123 AND name = "Yuhtunga_Mandragora"; -- Higher min level for Mandragoras for more steady xp-gains at level 25
-- The Sanctuary of ZiTah
UPDATE mob_groups SET HP = "2000"  WHERE zoneid = 121 AND name = "Guardian_Treant"; -- Boosting SAM quest NMs
-- Konschtat Highlands
UPDATE mob_groups SET HP = "1600", minLevel = "36", maxLevel = "36" WHERE zoneid = 108 AND name = "Forger"; -- Boosting SAM quest NMs
-- Korroloka Tunnel
UPDATE mob_groups SET HP = "1000", minLevel = "33", maxLevel = "33" WHERE zoneid = 173 AND name = "Korroloka_Leech"; -- Boosting NIN quest NMs
-- DRG BCNM Fight
UPDATE mob_groups SET HP = "2000", minLevel = "42", maxLevel = "42" WHERE zoneid = 140 AND name = "Cyranuce_M_Cutauleon"; -- Boosting DRG BCNM fight
-- Phanauet Channel
UPDATE mob_groups SET HP = "4000" WHERE zoneid = 1 AND name = "Vodyanoi"; -- Adding proper total HPs (https://www.youtube.com/watch?v=QrlYY1Fzt7g)
-- Bibiki Bay
UPDATE mob_groups SET HP = "4400" WHERE zoneid = 4 AND name = "Serra"; -- Adding proper total HPs (https://www.youtube.com/watch?v=YY19p_Ll0C0)
UPDATE mob_groups SET HP = "2500" WHERE zoneid = 4 AND name = "Intulo"; -- Very rough guess on its total HP... https://ffxi.allakhazam.com/db/bestiary.html?fmob=2901&p=1#comments
-- Uleguerand Range
UPDATE mob_groups SET HP = "12000" WHERE zoneid = 5 AND name = "Snow_Maiden"; -- Adding proper total HPs (https://www.youtube.com/watch?v=o5rSVbEncFs)
UPDATE mob_groups SET HP = "15000", dropid = "3998" WHERE zoneid = 5 AND name = "Father_Frost"; -- Not really proper source for this, but giving him more HP than its PH (Snow Maiden). Also adding custom droplist so we can set different drop rate for Purgatory Collar.
UPDATE mob_groups SET HP = "20000" WHERE zoneid = 5 AND name = "Mountain_Worm_NM"; -- Adding proper total HPs (https://www.youtube.com/watch?v=TKkd7HBE8fk)
UPDATE mob_groups SET HP = "9000" WHERE zoneid = 5 AND name = "Bonnacon"; -- Adding proper total HPs (https://www.youtube.com/watch?v=5ssAuE-bFMs)
UPDATE mob_groups SET HP = "8000" WHERE zoneid = 5 AND name = "White_Coney"; -- Adding proper total HPs (https://www.youtube.com/watch?v=9I8SfbyPduM)
UPDATE mob_groups SET HP = "8000" WHERE zoneid = 5 AND name = "Black_Coney"; -- Adding proper total HPs (https://www.youtube.com/watch?v=tXUrBewXA8A)


-- Behemoth's Dominion
UPDATE mob_groups SET HP = "4000" WHERE zoneid = 127 AND name = "Picklix_Longindex"; -- Adding proper total HPs (https://www.youtube.com/watch?v=QbxXkacJ7X0)
UPDATE mob_groups SET HP = "4000" WHERE zoneid = 127 AND name = "Moxnix_Nightgoggle"; -- Adding proper total HPs (https://www.youtube.com/watch?v=QbxXkacJ7X0)
UPDATE mob_groups SET HP = "4000" WHERE zoneid = 127 AND name = "Doglix_Muttsnout"; -- Adding proper total HPs (https://www.youtube.com/watch?v=QbxXkacJ7X0)



-- Kuftal Tunnel
UPDATE mob_groups SET HP = "9000" WHERE zoneid = 174 AND name = "Phantom_Worm"; -- Adding proper total HPs (https://www.youtube.com/watch?v=n0IwgZc7Nx8)


-- Palborough Mines
Update mob_groups SET HP = "850" spawntype "128" where zoneid = 143 AND name = "No_Mho_Crimsonarmor"; -- Based on this video he should have around 850 HP (https://www.youtube.com/watch?v=z3g1b2BuJuU). His spawn should also be scripted.
Update mob_groups SET HP = "5500" where zoneid = 143 AND name = "Ni_Ghu_Nestfender"; -- Based on this video he should have around 850 HP (https://www.youtube.com/watch?v=j8XKcQWmsYU)



