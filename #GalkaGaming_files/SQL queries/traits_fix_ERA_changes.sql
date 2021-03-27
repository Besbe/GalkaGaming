-- Fixes issue where non-merited job traits appear under "Abilities/Job Traits" when you reach 75

UPDATE traits SET meritid = "2116" WHERE name = "invigorate";
UPDATE traits SET meritid = "2118" WHERE name = "penance";
UPDATE traits SET meritid = "2564" WHERE name = "beast affinity";
UPDATE traits SET meritid = "2566" WHERE name = "beast healer";
UPDATE traits SET meritid = "2692" WHERE name = "snapshot";
UPDATE traits SET meritid = "2694" WHERE name = "recycle";
UPDATE traits SET meritid = "2884" WHERE name = "empathy";
UPDATE traits SET meritid = "2886" WHERE name = "strafe";
UPDATE traits SET meritid = "3012" WHERE name = "enchainment";
UPDATE traits SET meritid = "3014" WHERE name = "assimilation";
UPDATE traits SET meritid = "3076" WHERE name = "winning streak";
UPDATE traits SET meritid = "3078" WHERE name = "loaded deck";
UPDATE traits SET meritid = "3140" WHERE name = "fine-tuning";
UPDATE traits SET meritid = "3274" WHERE name = "stormsurge";
UPDATE traits SET meritid = "2052" WHERE name = "savagery";
UPDATE traits SET meritid = "2054" WHERE name = "aggressive aim";

-- All resist virus effects have wrond IDs in WINGS

UPDATE traits SET modifier 240 WHERE name = "resist_sleep";
UPDATE traits SET modifier 241 WHERE name = "resist_poison";
UPDATE traits SET modifier 242 WHERE name = "resist_paralyze";
UPDATE traits SET modifier 243 WHERE name = "resist_bind";
UPDATE traits SET modifier 244 WHERE name = "resist_silence";
UPDATE traits SET modifier 245 WHERE name = "resist_virus";
UPDATE traits SET modifier 246 WHERE name = "resist_petrify";
UPDATE traits SET modifier 247 WHERE name = "resist_bind";
UPDATE traits SET modifier 248 WHERE name = "resist_curse";
UPDATE traits SET modifier 249 WHERE name = "resist_gravity";
UPDATE traits SET modifier 250 WHERE name = "resist_slow";
UPDATE traits SET modifier 251 WHERE name = "resist_stun";
UPDATE traits SET modifier 252 WHERE name = "resist_charm";
UPDATE traits SET modifier 253 WHERE name = "resist_amnesia";


-- WARRIOR adjustments (TOAU)

UPDATE traits SET level = "15" WHERE name = "resist virus" AND rank = "1" AND job = "1";


