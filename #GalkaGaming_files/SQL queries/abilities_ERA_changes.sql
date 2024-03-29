-- Setting all 2HR abilities to 2HR cooldown

UPDATE abilities SET recastTime = "7200" WHERE name = "mighty_strikes";
UPDATE abilities SET recastTime = "7200" WHERE name = "hundred_fists";
UPDATE abilities SET recastTime = "7200" WHERE name = "benediction";
UPDATE abilities SET recastTime = "7200" WHERE name = "manafont";
UPDATE abilities SET recastTime = "7200" WHERE name = "chainspell";
UPDATE abilities SET recastTime = "7200" WHERE name = "perfect_dodge";
UPDATE abilities SET recastTime = "7200" WHERE name = "invincible";
UPDATE abilities SET recastTime = "7200" WHERE name = "blood_weapon";
UPDATE abilities SET recastTime = "7200" WHERE name = "familiar";
UPDATE abilities SET recastTime = "7200" WHERE name = "soul_voice";
UPDATE abilities SET recastTime = "7200" WHERE name = "eagle_eye_shot";
UPDATE abilities SET recastTime = "7200" WHERE name = "meikyo_shisui";
UPDATE abilities SET recastTime = "7200" WHERE name = "mijin_gakure";
UPDATE abilities SET recastTime = "7200" WHERE name = "spirit_surge";
UPDATE abilities SET recastTime = "7200" WHERE name = "astral_flow";
UPDATE abilities SET recastTime = "7200" WHERE name = "azure_lore";
UPDATE abilities SET recastTime = "7200" WHERE name = "wild_card";
UPDATE abilities SET recastTime = "7200" WHERE name = "overdrive";

-- Warrior
UPDATE abilities SET recastTime = "900" WHERE name = "warriors_charge"; -- ERA coldown was 15 min

-- Monk
UPDATE abilities SET VE = "600" WHERE name = "boost"; -- Should add a third of Provoke's aggro, which is 1800


