-- Doubling HP of Idolaters/Qutrubs
-- IMPORTANT: Run mob_family_system script first!!!

UPDATE mob_pools SET familyid = "96" WHERE name = "Qutrub";
UPDATE mob_pools SET familyid = "96" WHERE name = "Qutrub_Extortionist";
UPDATE mob_pools SET familyid = "96" WHERE name = "Qutrub_Forayer";
UPDATE mob_pools SET familyid = "96" WHERE name = "Qutrub_Wastrel";
UPDATE mob_pools SET familyid = "96" WHERE name = "Lamia_Idolater"; 
UPDATE mob_pools SET familyid = "111" WHERE name = "Goblin_Fisher";


-- Custom MOBS or NPCS added

-- Zeruhn Mines
INSERT INTO `mob_pools` VALUES (6870,'Giant_Amoeba','Giant_Amoeba',229,0x0000240100000000000000000000000000000000,1,1,7,240,100,0,1,0,0,16,0,0,245,131,0,0,0,0,0,229);