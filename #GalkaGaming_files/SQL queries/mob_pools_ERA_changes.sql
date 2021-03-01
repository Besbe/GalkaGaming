-- Doubling HP of Idolaters/Qutrubs
-- IMPORTANT: Run mob_family_system script first!!!

UPDATE mob_pools SET familyid = "96" WHERE name = "Qutrub";
UPDATE mob_pools SET familyid = "96" WHERE name = "Qutrub_Extortionist";
UPDATE mob_pools SET familyid = "96" WHERE name = "Qutrub_Forayer";
UPDATE mob_pools SET familyid = "96" WHERE name = "Qutrub_Wastrel";
UPDATE mob_pools SET familyid = "96" WHERE name = "Lamia_Idolater"; 
UPDATE mob_pools SET familyid = "111" WHERE name = "Goblin_Fisher";


-- Uleguerand Range
UPDATE mob_pools SET spellList = "436", cmbDelay = "260", immunity = "8" WHERE name = "Geush_Urvan"; -- Immune to Stun
UPDATE mob_pools SET skill_list_id = "1199" WHERE name = "Black_Coney";


-- Bibiki Bay
UPDATE mob_pools SET immunity = "1040", entityflags = "7" WHERE name = "Shen"; -- Immune to Silence and Requiem and also increased its size
UPDATE mob_pools SET immunity = "12" WHERE name = "Shens_Filtrate"; -- Immune to Bind, Stun

-- Custom MOBS or NPCS added

-- Zeruhn Mines
INSERT INTO `mob_pools` VALUES (6870,'Giant_Amoeba','Giant_Amoeba',229,0x0000240100000000000000000000000000000000,1,1,7,240,100,0,1,0,0,16,0,0,245,131,0,0,0,0,0,229);