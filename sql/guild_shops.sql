-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: tpzdb
-- ------------------------------------------------------
-- Server version   5.5.5-10.1.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `guild_shops`
--

DROP TABLE IF EXISTS `guild_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_shops` (
  `guildid` smallint(5) unsigned NOT NULL,
  `itemid` smallint(5) unsigned NOT NULL,
  `min_price` int(10) unsigned NOT NULL DEFAULT '0',
  `max_price` int(10) unsigned NOT NULL DEFAULT '0',
  `max_quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `daily_increase` smallint(5) unsigned NOT NULL DEFAULT '0',
  `initial_quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_shops`
--
-- ORDER BY:  `guildid`,`itemid`
--
-- Old commment:
-- To cope with the current 30 item limit, I have added in every single item entry according to Blue Gartyr Wiki
-- I then chose the 30 most important items I could think of for each vendor, and commented out the rest for now.
-- I did my best to put all the daily restocks on 1 vendor, and the non-restocks on the other.
-- This should leave ~60 items for each guild, for now. I think this will be enough to make most happy.
-- When the cap is lifted, all you will have to do is remove the comments and make the (S) vendors the same ID and it will display 100% of the item lists

-- The above 30 item limit no longer exists..

-- Chaupire (Northern San d'Oria) Woodworking Guild (S)
INSERT INTO `guild_shops` VALUES (5132,3,295500,295500,20,0,3);
INSERT INTO `guild_shops` VALUES (5132,22,282,691,20,0,20);
INSERT INTO `guild_shops` VALUES (5132,23,829,2035,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,24,70200,408096,20,0,3);
INSERT INTO `guild_shops` VALUES (5132,26,31500,31500,20,0,6);
INSERT INTO `guild_shops` VALUES (5132,92,738,2322,20,0,10);
INSERT INTO `guild_shops` VALUES (5132,97,5508,13512,20,0,12);
INSERT INTO `guild_shops` VALUES (5132,102,291,713,25,0,25);
INSERT INTO `guild_shops` VALUES (5132,688,15,28,255,0,100);            -- arrowwood_log
INSERT INTO `guild_shops` VALUES (5132,689,27,59,255,0,100);            -- lauan_log
INSERT INTO `guild_shops` VALUES (5132,690,1378,10938,255,48,100);      -- elm_log
INSERT INTO `guild_shops` VALUES (5132,691,45,276,255,0,100);           -- maple_log
INSERT INTO `guild_shops` VALUES (5132,693,640,3586,255,48,100);        -- walnut_log
INSERT INTO `guild_shops` VALUES (5132,694,2119,2811,165,33,65);        -- chestnut_log
INSERT INTO `guild_shops` VALUES (5132,695,120,132,255,48,100);         -- willow_log
INSERT INTO `guild_shops` VALUES (5132,696,330,699,255,48,100);         -- yew_log
INSERT INTO `guild_shops` VALUES (5132,697,528,930,255,48,100);         -- holly_log
INSERT INTO `guild_shops` VALUES (5132,698,72,122,255,48,100);          -- ash_log
INSERT INTO `guild_shops` VALUES (5132,699,4740,24016,165,33,65);       -- oak_log
INSERT INTO `guild_shops` VALUES (5132,700,9075,19844,165,33,65);       -- mahogany_log
INSERT INTO `guild_shops` VALUES (5132,701,6615,37044,165,33,65);       -- rosewood_log
INSERT INTO `guild_shops` VALUES (5132,702,9600,23040,165,33,65);       -- ebony_log
INSERT INTO `guild_shops` VALUES (5132,704,96,230,375,100,150);         -- bamboo_stick
INSERT INTO `guild_shops` VALUES (5132,705,3,18,255,48,100);            -- arrowwood_lbr.
INSERT INTO `guild_shops` VALUES (5132,706,27,151,255,48,100);          -- lauan_lumber
INSERT INTO `guild_shops` VALUES (5132,707,1723,4136,255,48,100);       -- elm_lumber
INSERT INTO `guild_shops` VALUES (5132,708,45,276,255,48,100);          -- maple_lumber
INSERT INTO `guild_shops` VALUES (5132,710,2119,6104,165,33,65);        -- chestnut_lumber
INSERT INTO `guild_shops` VALUES (5132,711,1015,3982,100,0,100);        -- walnut_lumber
INSERT INTO `guild_shops` VALUES (5132,712,120,256,255,48,100);         -- willow_lumber
INSERT INTO `guild_shops` VALUES (5132,713,330,836,255,48,100);         -- yew_lumber
INSERT INTO `guild_shops` VALUES (5132,714,607,2559,255,48,100);        -- holly_lumber
INSERT INTO `guild_shops` VALUES (5132,715,72,403,255,48,100);          -- ash_lumber
INSERT INTO `guild_shops` VALUES (5132,716,4740,23257,165,33,65);       -- oak_lumber
INSERT INTO `guild_shops` VALUES (5132,719,23552,25216,165,0,65);       -- ebony_lumber
INSERT INTO `guild_shops` VALUES (5132,12289,88,232,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,12290,847,1173,20,0,10);
INSERT INTO `guild_shops` VALUES (5132,12984,176,280,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,12985,1625,1625,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,12986,6885,17625,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,12987,38707,38707,20,0,3);
INSERT INTO `guild_shops` VALUES (5132,16832,194,201,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,16833,809,4294,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,16834,6448,25376,20,0,10);
INSERT INTO `guild_shops` VALUES (5132,16835,27165,34750,20,0,3);
INSERT INTO `guild_shops` VALUES (5132,16845,31314,34445,20,0,3);
INSERT INTO `guild_shops` VALUES (5132,17024,48,141,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,17025,1165,5707,20,0,10);
INSERT INTO `guild_shops` VALUES (5132,17027,7525,21003,20,0,5);
INSERT INTO `guild_shops` VALUES (5132,17030,14766,41876,20,0,3);
INSERT INTO `guild_shops` VALUES (5132,17049,34,102,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,17050,247,703,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,17051,1049,3038,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,17052,3827,19420,20,0,10);
INSERT INTO `guild_shops` VALUES (5132,17088,46,126,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,17089,424,977,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,17090,3371,7103,20,0,15);
INSERT INTO `guild_shops` VALUES (5132,17095,281,1260,20,0,15);         -- ash_pole
INSERT INTO `guild_shops` VALUES (5132,17096,3400,23349,20,0,15);       -- holly_pole
INSERT INTO `guild_shops` VALUES (5132,17097,22617,35932,20,0,15);      -- elm_pole
INSERT INTO `guild_shops` VALUES (5132,17098,29390,72633,20,0,3);       -- oak_pole
INSERT INTO `guild_shops` VALUES (5132,17152,41,202,20,0,15);           -- shortbow
INSERT INTO `guild_shops` VALUES (5132,17153,1039,1055,20,0,15);        -- self_bow
INSERT INTO `guild_shops` VALUES (5132,17154,15602,38649,20,0,10);      -- wrapped_bow
INSERT INTO `guild_shops` VALUES (5132,17155,5625,16875,20,0,5);        -- composite_bow
INSERT INTO `guild_shops` VALUES (5132,17156,82971,82971,20,0,3);       -- kaman
INSERT INTO `guild_shops` VALUES (5132,17160,870,969,20,0,15);          -- longbow
INSERT INTO `guild_shops` VALUES (5132,17162,14614,42969,20,0,10);      -- great_bow
INSERT INTO `guild_shops` VALUES (5132,17163,28944,82080,20,0,5);       -- battle_bow
INSERT INTO `guild_shops` VALUES (5132,17164,57405,166219,20,0,3);      -- war_bow
INSERT INTO `guild_shops` VALUES (5132,17216,187,354,20,0,15);          -- light_crossbow
INSERT INTO `guild_shops` VALUES (5132,17218,10311,67100,20,0,10);      -- zamburak
INSERT INTO `guild_shops` VALUES (5132,17280,1172,5250,20,0,15);        -- boomerang
INSERT INTO `guild_shops` VALUES (5132,17318,6,13,8910,48,3564);        -- wooden_arrow
INSERT INTO `guild_shops` VALUES (5132,17320,10,14,5940,0,2376);        -- iron_arrow
INSERT INTO `guild_shops` VALUES (5132,17321,28,34,2970,0,1188);        -- silver_arrow
INSERT INTO `guild_shops` VALUES (5132,17345,69,163,20,0,15);           -- flute
INSERT INTO `guild_shops` VALUES (5132,17347,1028,5060,20,0,15);        -- piccolo
INSERT INTO `guild_shops` VALUES (5132,17348,11256,32592,20,0,10);      -- traversiere
INSERT INTO `guild_shops` VALUES (5132,17353,37,94,20,0,15);            -- maple_harp
INSERT INTO `guild_shops` VALUES (5132,17354,4300,12200,20,0,10);       -- harp
INSERT INTO `guild_shops` VALUES (5132,17355,13400,38800,20,0,5);       -- rose_harp
INSERT INTO `guild_shops` VALUES (5132,17424,7717,20685,20,0,3);        -- spiked_club

-- Shih Tayuun (Bonecraft Guild) Windurst Woods (S)
INSERT INTO `guild_shops` VALUES (514,17299,2419,2419,198,0,99);    	-- astragalos
INSERT INTO `guild_shops` VALUES (514,16406,14428,35251,20,0,10);   	-- baghnakhs
INSERT INTO `guild_shops` VALUES (514,17257,19859,39568,20,0,7);    	-- bandits_gun
INSERT INTO `guild_shops` VALUES (514,13323,15408,15408,20,0,10);   	-- beetle_earring
INSERT INTO `guild_shops` VALUES (514,13090,7188,8869,20,0,10);     	-- beetle_gorget
INSERT INTO `guild_shops` VALUES (514,12583,12246,49455,20,0,15);		-- beetle_harness	 
INSERT INTO `guild_shops` VALUES (514,894,968,2952,165,0,65);			-- beetle_jaw
INSERT INTO `guild_shops` VALUES (514,17612,34440,39606,20,0,10);   	-- beetle_knife
INSERT INTO `guild_shops` VALUES (514,12967,18447,27659,20,0,15);		-- beetle_leggings
INSERT INTO `guild_shops` VALUES (514,12455,5728,32079,20,0,10);		-- beetle_mask
INSERT INTO `guild_shops` VALUES (514,12711,10981,10981,20,0,15);		-- beetle_mittens
INSERT INTO `guild_shops` VALUES (514,13457,2650,2721,20,0,10);      	-- beetle_ring
INSERT INTO `guild_shops` VALUES (514,889,298,1495,80,0,32);			-- beetle_shell
INSERT INTO `guild_shops` VALUES (514,12835,16956,54265,20,0,15);		-- beetle_subligar
INSERT INTO `guild_shops` VALUES (514,884,4850,10732,165,0,65);			-- black_tiger_fang
INSERT INTO `guild_shops` VALUES (514,17319,3,6,8910,0,3564);    		-- bone_arrow
INSERT INTO `guild_shops` VALUES (514,16642,9050,19053,20,0,15);     	-- bone_axe
INSERT INTO `guild_shops` VALUES (514,880,70,349,255,48,100);		-- bone_chip
INSERT INTO `guild_shops` VALUES (514,17026,4032,10590,20,0,15);     	-- bone_cudgel
INSERT INTO `guild_shops` VALUES (514,13321,1359,7900,20,0,15);      	-- bone_earring
INSERT INTO `guild_shops` VALUES (514,12505,336,1415,20,0,20);			-- bone_hairpin
INSERT INTO `guild_shops` VALUES (514,12582,30031,30031,20,0,20);		-- bone_harness
INSERT INTO `guild_shops` VALUES (514,17610,22500,53100,20,0,15);   	-- bone_knife
INSERT INTO `guild_shops` VALUES (514,12966,14493,14493,20,0,20);		-- bone_leggings			
INSERT INTO `guild_shops` VALUES (514,12454,5633,17995,20,0,20);		-- bone_mask
INSERT INTO `guild_shops` VALUES (514,12710,2937,9008,20,0,20);			-- bone_mittens
INSERT INTO `guild_shops` VALUES (514,16649,4887,5017,20,0,15);    		-- bone_pick
INSERT INTO `guild_shops` VALUES (514,13441,1359,1395,20,0,15);   		-- bone_ring
INSERT INTO `guild_shops` VALUES (514,17062,21318,21318,20,0,15);    	-- bone_rod
INSERT INTO `guild_shops` VALUES (514,12834,22965,22965,20,0,20);		-- bone_subligar
INSERT INTO `guild_shops` VALUES (514,16407,1521,2859,20,0,15);      	-- brass_baghnakhs
INSERT INTO `guild_shops` VALUES (514,13091,29568,106260,20,0,5);    	-- carapace_gorget
INSERT INTO `guild_shops` VALUES (514,13712,67567,242550,20,0,5);    	-- carapace_harness
INSERT INTO `guild_shops` VALUES (514,13715,57036,57036,20,0,5);    	-- cpc._leggings
INSERT INTO `guild_shops` VALUES (514,13711,29925,29925,20,0,5);   		-- carapace_mask
INSERT INTO `guild_shops` VALUES (514,13713,29452,57960,20,0,5);     	-- carapace_mittens
INSERT INTO `guild_shops` VALUES (514,13461,11565,43599,20,0,5);    	-- carapace_ring
INSERT INTO `guild_shops` VALUES (514,12837,170016,225456,20,0,5);		-- carapace_subligar
INSERT INTO `guild_shops` VALUES (514,16405,213,519,20,0,20);     		-- cat_baghnakhs
INSERT INTO `guild_shops` VALUES (514,898,163,163,375,0,150);			-- chicken_bone
INSERT INTO `guild_shops` VALUES (514,881,3355,11398,55,0,22);			-- crab_shell
INSERT INTO `guild_shops` VALUES (514,13076,2862,15569,20,0,15);     	-- fang_necklace
INSERT INTO `guild_shops` VALUES (514,864,72,288,255,48,100);		-- fish_scales
INSERT INTO `guild_shops` VALUES (514,893,948,1258,80,0,32);			-- giant_femur
INSERT INTO `guild_shops` VALUES (514,17352,51948,51948,20,0,10);    	-- horn
INSERT INTO `guild_shops` VALUES (514,12507,15133,33687,20,0,10);		-- horn_hairpin
INSERT INTO `guild_shops` VALUES (514,13459,7200,21120,20,0,5);       	-- horn_ring
INSERT INTO `guild_shops` VALUES (514,13744,208550,208550,20,0,3);   	-- justaucorps
INSERT INTO `guild_shops` VALUES (514,895,3060,15560,55,0,22);			-- ram_horn
INSERT INTO `guild_shops` VALUES (514,897,1228,7338,80,0,32);			-- scorpion_claw
INSERT INTO `guild_shops` VALUES (514,13458,14175,15553,20,0,3);     	-- scorpion_ring
INSERT INTO `guild_shops` VALUES (514,896,4089,12166,80,0,32);			-- scorpion_shell
INSERT INTO `guild_shops` VALUES (514,888,90,90,255,48,100);		-- seashell	
INSERT INTO `guild_shops` VALUES (514,2130,75,75,255,48,100);		-- shagreen_file
INSERT INTO `guild_shops` VALUES (514,882,150,760,255,48,100);		-- sheep_tooth
INSERT INTO `guild_shops` VALUES (514,13313,565,641,20,0,20);        	-- shell_earring
INSERT INTO `guild_shops` VALUES (514,12506,4500,16350,20,0,15);		-- shell_hairpin
INSERT INTO `guild_shops` VALUES (514,13442,565,807,20,0,20);        	-- shell_ring
INSERT INTO `guild_shops` VALUES (514,13324,38565,38565,20,0,5);     	-- tortoise_earring
INSERT INTO `guild_shops` VALUES (514,13981,67439,72204,20,0,5);    	-- turtle_bangles
INSERT INTO `guild_shops` VALUES (514,885,25584,74256,30,0,12);			-- turtle_shell	
INSERT INTO `guild_shops` VALUES (514,12414,11377,37771,20,0,5);		-- turtle_shield

-- Kuzah Hpirohpon (Windurst Woods) Clothcraft Guild (S)
INSERT INTO `guild_shops` VALUES (5152,847,14,40,375,0,150);        	-- bird_feather
INSERT INTO `guild_shops` VALUES (5152,13577,15190,42134,20,0,10);		-- black_cape
INSERT INTO `guild_shops` VALUES (5152,12739,37862,172339,20,0,5);		-- black_mitts
INSERT INTO `guild_shops` VALUES (5152,18865,5175,36225,20,0,5);		-- black_slacks
INSERT INTO `guild_shops` VALUES (5152,12609,7767,54369,20,0,5);		-- black_tunic
INSERT INTO `guild_shops` VALUES (5152,12722,29406,29406,20,0,5);		-- bracers
INSERT INTO `guild_shops` VALUES (5152,12848,4093,5486,20,0,5);			-- bias
INSERT INTO `guild_shops` VALUES (5152,13583,318,1683,20,0,20);			-- cape
INSERT INTO `guild_shops` VALUES (5152,12610,7866,55062,20,0,20);		-- cloak
INSERT INTO `guild_shops` VALUES (5152,12849,1800,12600,20,0,20);		-- cotton_brais
INSERT INTO `guild_shops` VALUES (5152,13584,12386,12386,20,0,20);		-- cotton_cape
INSERT INTO `guild_shops` VALUES (5152,825,480,2432,80,16,32);      -- cotton_cloth
INSERT INTO `guild_shops` VALUES (5152,12593,66992,66992,20,0,10);   	-- cotton_doublet
INSERT INTO `guild_shops` VALUES (5152,12977,2316,16212,20,0,10);   	-- cotton_giaters
INSERT INTO `guild_shops` VALUES (5152,12721,1674,11718,20,0,10);   	-- cotton_gloves
INSERT INTO `guild_shops` VALUES (5152,12498,1800,12600,20,0,10);   	-- cotton_headband
INSERT INTO `guild_shops` VALUES (5152,12465,35315,35135,20,0,10);   	-- cotton_doublet
INSERT INTO `guild_shops` VALUES (5152,818,312,582,255,48,100);     -- cotton_thread
INSERT INTO `guild_shops` VALUES (5152,839,280,624,255,48,100);    	-- crawler_cocoon
INSERT INTO `guild_shops` VALUES (5152,12728,246,644,20,0,10);   	 	-- cuffs
INSERT INTO `guild_shops` VALUES (5152,12592,5325,13066,20,0,10);   	-- doublet
INSERT INTO `guild_shops` VALUES (5152,13075,372,2604,20,0,10);   		-- feather_collar
INSERT INTO `guild_shops` VALUES (5152,835,187,430,375,75,100);     -- flax_flower
INSERT INTO `guild_shops` VALUES (5152,12499,14160,78080,20,0,5);    	-- flax_headband
INSERT INTO `guild_shops` VALUES (5152,12976,2538,5188,20,0,15);		-- gaiters
INSERT INTO `guild_shops` VALUES (5152,12594,11250,78750,20,0,15);		-- gambison
INSERT INTO `guild_shops` VALUES (5152,842,687,4809,55,0,22);      		-- giant_bird_feather
INSERT INTO `guild_shops` VALUES (5152,12720,2787,7391,20,0,15);    	-- gloves
INSERT INTO `guild_shops` VALUES (5152,823,18240,95760,165,33,65);  -- gold_thread
INSERT INTO `guild_shops` VALUES (5152,824,240,588,80,16,32);       -- grass_cloth
INSERT INTO `guild_shops` VALUES (5152,817,58,146,255,48,100);      -- grass_thread
INSERT INTO `guild_shops` VALUES (5152,12464,1452,5468,20,0,20);     	-- headgear
INSERT INTO `guild_shops` VALUES (5152,13085,972,4838,20,0,20);     	-- hemp_gorget
INSERT INTO `guild_shops` VALUES (5152,12850,7875,55125,20,0,20);     	-- hose
INSERT INTO `guild_shops` VALUES (5152,826,5970,14400,80,0,32);    		-- linen_cloth
INSERT INTO `guild_shops` VALUES (5152,12729,1569,10983,20,0,15);   	-- linen_cuffs
INSERT INTO `guild_shops` VALUES (5152,13750,87178,87178,20,0,10);		-- linen_doublet
INSERT INTO `guild_shops` VALUES (5152,12738,3726,26082,20,0,15);   	-- linen_mitts
INSERT INTO `guild_shops` VALUES (5152,12601,14684,14684,20,0,15);   	-- linen_robe
INSERT INTO `guild_shops` VALUES (5152,12866,8487,59409,20,0,15);   	-- linen_slacks
INSERT INTO `guild_shops` VALUES (5152,12857,336,2352,20,0,15);   		-- linen_slops
INSERT INTO `guild_shops` VALUES (5152,819,750,750,255,0,100);     		-- linen_thread
INSERT INTO `guild_shops` VALUES (5152,12736,1290,3196,20,0,15);     	-- mitts
INSERT INTO `guild_shops` VALUES (5152,833,15,90,375,75,150);       -- moko_grass
INSERT INTO `guild_shops` VALUES (5152,830,17616,123312,32,0,12);     	-- rainbow_cloth
INSERT INTO `guild_shops` VALUES (5152,821,5940,41580,32,0,12);     	-- rainbow_thread
INSERT INTO `guild_shops` VALUES (5152,12466,23200,39400,20,0,10);   	-- red_cap
INSERT INTO `guild_shops` VALUES (5152,13586,94960,94960,20,0,10);   	-- red_cape
INSERT INTO `guild_shops` VALUES (5152,12600,424,1046,20,0,20);      	-- robe
INSERT INTO `guild_shops` VALUES (5152,834,80,200,255,48,100);      -- saruta_cotton
INSERT INTO `guild_shops` VALUES (5152,13568,5100,5100,20,0,10);   		-- scarelet_ribbon
INSERT INTO `guild_shops` VALUES (5152,832,675,855,255,48,100);    -- sheep_wool
INSERT INTO `guild_shops` VALUES (5152,829,4725,33075,32,0,12);     	-- silk_cloth
INSERT INTO `guild_shops` VALUES (5152,816,710,3856,255,48,100);    -- silk_thread
INSERT INTO `guild_shops` VALUES (5152,822,685,3000,255,48,100);     -- silver_thread
INSERT INTO `guild_shops` VALUES (5152,12864,4562,4562,20,0,10);   		-- slacks
INSERT INTO `guild_shops` VALUES (5152,12856,372,936,20,0,20);			-- slops
INSERT INTO `guild_shops` VALUES (5152,12978,21000,147000,20,0,20);		-- socks
INSERT INTO `guild_shops` VALUES (5152,838,9438,34557,55,0,22);      	-- spider_web
INSERT INTO `guild_shops` VALUES (5152,2128,75,80,375,75,150);      -- spindle
INSERT INTO `guild_shops` VALUES (5152,12608,1260,8820,20,0,20);      	-- tunic
INSERT INTO `guild_shops` VALUES (5152,828,25520,25520,32,0,12);     	-- velvet_cloth
INSERT INTO `guild_shops` VALUES (5152,12731,36192,36192,20,0,20);      -- velvet_cuffs
INSERT INTO `guild_shops` VALUES (5152,12475,12852,89964,20,0,20);      -- velvet_hat
INSERT INTO `guild_shops` VALUES (5152,12603,19152,134064,20,0,20);     -- velvet_robe
INSERT INTO `guild_shops` VALUES (5152,12859,15624,109368,20,0,20);     -- velvet_slops
INSERT INTO `guild_shops` VALUES (5152,13322,1728,12096,20,0,20);      	-- wing_earring
INSERT INTO `guild_shops` VALUES (5152,12723,15480,108360,20,0,20);     -- wool_bracers
INSERT INTO `guild_shops` VALUES (5152,12467,18720,131040,20,0,20);     -- wool_cap
INSERT INTO `guild_shops` VALUES (5152,827,21492,52704,55,0,22);      	-- wool_cloth
INSERT INTO `guild_shops` VALUES (5152,12730,6579,46053,20,0,20);     	-- wool_cuffs
INSERT INTO `guild_shops` VALUES (5152,12595,28080,196560,20,0,20);     -- wool_gambison
INSERT INTO `guild_shops` VALUES (5152,12474,7803,54621,20,0,20);    	-- wool_hat
INSERT INTO `guild_shops` VALUES (5152,12851,21600,151200,20,0,10);   	-- wool_hose
INSERT INTO `guild_shops` VALUES (5152,12602,11628,81396,20,0,10);		-- wool_robe
INSERT INTO `guild_shops` VALUES (5152,12858,9486,66402,20,0,10);		-- wool_slops
INSERT INTO `guild_shops` VALUES (5152,12979,14400,100800,20,0,10);		-- wool_socks
INSERT INTO `guild_shops` VALUES (5152,820,2700,12528,165,0,65);    	-- wool_thread
INSERT INTO `guild_shops` VALUES (5152,841,28,35,375,0,150);        	-- yagudo_feather
INSERT INTO `guild_shops` VALUES (5152,2145,75,80,255,48,100);       -- zephyr_thread

-- Tilala (Clothcraft Guild) Selbina (S)
INSERT INTO `guild_shops` VALUES (516,847,14,40,375,0,150);        	-- bird_feather
--INSERT INTO `guild_shops` VALUES (516,13577,15190,42134,20,0,10);		-- black_cape
--INSERT INTO `guild_shops` VALUES (516,12739,37862,172339,20,0,5);		-- black_mitts
--INSERT INTO `guild_shops` VALUES (516,18865,5175,36225,20,0,5);		-- black_slacks
--INSERT INTO `guild_shops` VALUES (516,12609,7767,54369,20,0,5);		-- black_tunic
--INSERT INTO `guild_shops` VALUES (516,12722,29406,29406,20,0,5);		-- bracers
--INSERT INTO `guild_shops` VALUES (516,12848,4093,5486,20,0,5);		-- bias
--INSERT INTO `guild_shops` VALUES (516,13583,318,1683,20,0,20);		-- cape
--INSERT INTO `guild_shops` VALUES (516,12610,7866,55062,20,0,20);		-- cloak
--INSERT INTO `guild_shops` VALUES (516,12849,1800,12600,20,0,20);		-- cotton_brais
--INSERT INTO `guild_shops` VALUES (516,13584,12386,12386,20,0,20);		-- cotton_cape
INSERT INTO `guild_shops` VALUES (516,825,480,2432,80,16,32);      -- cotton_cloth
--INSERT INTO `guild_shops` VALUES (516,12593,66992,66992,20,0,10);   	-- cotton_doublet
--INSERT INTO `guild_shops` VALUES (516,12977,2316,16212,20,0,10);   	-- cotton_giaters
--INSERT INTO `guild_shops` VALUES (516,12721,1674,11718,20,0,10);   	-- cotton_gloves
--INSERT INTO `guild_shops` VALUES (516,12498,1800,12600,20,0,10);   	-- cotton_headband
--INSERT INTO `guild_shops` VALUES (516,12465,35315,35135,20,0,10);   	-- cotton_doublet
INSERT INTO `guild_shops` VALUES (516,818,312,582,255,48,100);     -- cotton_thread
INSERT INTO `guild_shops` VALUES (516,839,280,624,255,48,100);    	-- crawler_cocoon
--INSERT INTO `guild_shops` VALUES (516,12728,246,644,20,0,10);   	 	-- cuffs
--INSERT INTO `guild_shops` VALUES (516,12592,5325,13066,20,0,10);   	-- doublet
INSERT INTO `guild_shops` VALUES (516,13075,372,2604,20,0,10);   		-- feather_collar
INSERT INTO `guild_shops` VALUES (516,835,187,430,375,75,100);     -- flax_flower
--INSERT INTO `guild_shops` VALUES (516,12499,14160,78080,20,0,5);    	-- flax_headband
--INSERT INTO `guild_shops` VALUES (516,12976,2538,5188,20,0,15);		-- gaiters
--INSERT INTO `guild_shops` VALUES (516,12594,11250,78750,20,0,15);		-- gambison
INSERT INTO `guild_shops` VALUES (516,842,687,4809,55,0,22);      	-- giant_bird_feather
--INSERT INTO `guild_shops` VALUES (516,12720,2787,7391,20,0,15);    	-- gloves
INSERT INTO `guild_shops` VALUES (516,823,18240,95760,165,33,65);  -- gold_thread
INSERT INTO `guild_shops` VALUES (516,824,240,588,80,16,32);       -- grass_cloth
INSERT INTO `guild_shops` VALUES (516,817,58,146,255,48,100);      -- grass_thread
--INSERT INTO `guild_shops` VALUES (516,12464,1452,5468,20,0,20);     	-- headgear
--INSERT INTO `guild_shops` VALUES (516,13085,972,4838,20,0,20);     	-- hemp_gorget
--INSERT INTO `guild_shops` VALUES (516,12850,7875,55125,20,0,20);     	-- hose
INSERT INTO `guild_shops` VALUES (516,826,5970,14400,80,0,32);    	-- linen_cloth
--INSERT INTO `guild_shops` VALUES (516,12729,1569,10983,20,0,15);   	-- linen_cuffs
--INSERT INTO `guild_shops` VALUES (516,13750,87178,87178,20,0,10);		-- linen_doublet
--INSERT INTO `guild_shops` VALUES (516,12738,3726,26082,20,0,15);   	-- linen_mitts
--INSERT INTO `guild_shops` VALUES (516,12601,14684,14684,20,0,15);   	-- linen_robe
--INSERT INTO `guild_shops` VALUES (516,12866,8487,59409,20,0,15);   	-- linen_slacks
--INSERT INTO `guild_shops` VALUES (516,12857,336,2352,20,0,15);   		-- linen_slops
INSERT INTO `guild_shops` VALUES (516,819,750,750,255,0,100);     	-- linen_thread
--INSERT INTO `guild_shops` VALUES (516,12736,1290,3196,20,0,15);     	-- mitts
INSERT INTO `guild_shops` VALUES (516,833,15,90,375,75,150);       -- moko_grass
INSERT INTO `guild_shops` VALUES (516,821,5940,41580,32,0,12);     	-- rainbow_thread
--INSERT INTO `guild_shops` VALUES (516,12466,23200,39400,20,0,10);   	-- red_cap
--INSERT INTO `guild_shops` VALUES (516,13586,94960,94960,20,0,10);   	-- red_cape
--INSERT INTO `guild_shops` VALUES (516,12600,424,1046,20,0,20);      	-- robe
INSERT INTO `guild_shops` VALUES (516,834,80,200,255,48,100);      -- saruta_cotton
--INSERT INTO `guild_shops` VALUES (516,13568,5100,5100,20,0,10);   	-- scarelet_ribbon
INSERT INTO `guild_shops` VALUES (516,832,675,855,255,48,100);    -- sheep_wool
INSERT INTO `guild_shops` VALUES (516,829,4725,33075,32,0,12);     	-- silk_cloth
INSERT INTO `guild_shops` VALUES (516,816,710,3865,255,48,100);    -- silk_thread
INSERT INTO `guild_shops` VALUES (516,822,685,3000,255,48,100);     -- silver_thread
--INSERT INTO `guild_shops` VALUES (516,12864,4562,4562,20,0,10);   	-- slacks
--INSERT INTO `guild_shops` VALUES (516,12856,372,936,20,0,20);			-- slops
--INSERT INTO `guild_shops` VALUES (516,12978,21000,147000,20,0,20);	-- socks
INSERT INTO `guild_shops` VALUES (516,838,9438,34557,55,0,22);      	-- spider_web
INSERT INTO `guild_shops` VALUES (516,2128,75,80,375,75,150);      -- spindle
--INSERT INTO `guild_shops` VALUES (516,12608,1260,8820,20,0,20);      	-- tunic
--INSERT INTO `guild_shops` VALUES (516,828,25520,25520,32,0,12);     	-- velvet_cloth
--INSERT INTO `guild_shops` VALUES (516,12731,36192,36192,20,0,20);     -- velvet_cuffs
--INSERT INTO `guild_shops` VALUES (516,12475,12852,89964,20,0,20);     -- velvet_hat
--INSERT INTO `guild_shops` VALUES (516,12603,19152,134064,20,0,20);    -- velvet_robe
--INSERT INTO `guild_shops` VALUES (516,12859,15624,109368,20,0,20);    -- velvet_slops
--INSERT INTO `guild_shops` VALUES (516,13322,1728,12096,20,0,20);      -- wing_earring
--INSERT INTO `guild_shops` VALUES (516,12723,15480,108360,20,0,20);    -- wool_bracers
--INSERT INTO `guild_shops` VALUES (516,12467,18720,131040,20,0,20);    -- wool_cap
INSERT INTO `guild_shops` VALUES (516,827,21492,52704,55,0,22);      	-- wool_cloth
--INSERT INTO `guild_shops` VALUES (516,12730,6579,46053,20,0,20);     	-- wool_cuffs
--INSERT INTO `guild_shops` VALUES (516,12595,28080,196560,20,0,20);    -- wool_gambison
--INSERT INTO `guild_shops` VALUES (516,12474,7803,54621,20,0,20);    	-- wool_hat
--INSERT INTO `guild_shops` VALUES (516,12851,21600,151200,20,0,10);   	-- wool_hose
--INSERT INTO `guild_shops` VALUES (516,12602,11628,81396,20,0,10);		-- wool_robe
--INSERT INTO `guild_shops` VALUES (516,12858,9486,66402,20,0,10);		-- wool_slops
--INSERT INTO `guild_shops` VALUES (516,12979,14400,100800,20,0,10);	-- wool_socks
INSERT INTO `guild_shops` VALUES (516,820,2700,12528,165,0,65);    	-- wool_thread
INSERT INTO `guild_shops` VALUES (516,841,28,35,375,0,150);        	-- yagudo_feather
--INSERT INTO `guild_shops` VALUES (516,2145,75,80,255,48,100);       -- zephyr_thread

-- Babubu (Port Windurst) Fishing Guild
INSERT INTO `guild_shops` VALUES (517,624,24,136,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4288,5572,13888,165,0,65);
INSERT INTO `guild_shops` VALUES (517,4290,1008,1289,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4291,582,634,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4304,13930,32200,30,0,12);
INSERT INTO `guild_shops` VALUES (517,4307,10746,24624,30,0,12);
INSERT INTO `guild_shops` VALUES (517,4354,120,624,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4360,64,98,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4361,1216,1289,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4379,240,348,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4383,1244,2949,165,0,65);
INSERT INTO `guild_shops` VALUES (517,4384,5250,6720,165,0,65);
INSERT INTO `guild_shops` VALUES (517,4385,308,520,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4399,1503,6264,165,0,65);
INSERT INTO `guild_shops` VALUES (517,4401,91,191,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4402,3546,8064,165,0,65);
INSERT INTO `guild_shops` VALUES (517,4403,108,160,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4426,195,272,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4427,1350,2952,165,0,65);
INSERT INTO `guild_shops` VALUES (517,4428,60,352,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4429,979,5068,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4443,28,134,255,48,100);
INSERT INTO `guild_shops` VALUES (517,4451,5160,19520,30,0,12);
INSERT INTO `guild_shops` VALUES (517,4461,4050,18792,30,0,12);
INSERT INTO `guild_shops` VALUES (517,4462,1350,4824,30,0,12);
INSERT INTO `guild_shops` VALUES (517,4464,172,1122,255,0,100);
INSERT INTO `guild_shops` VALUES (517,4469,580,2400,55,0,22);
INSERT INTO `guild_shops` VALUES (517,4470,4112,4186,55,0,22);
INSERT INTO `guild_shops` VALUES (517,4471,2100,13328,55,0,22);
INSERT INTO `guild_shops` VALUES (517,4472,30,65,255,48,100);        -- crayfish
INSERT INTO `guild_shops` VALUES (517,4473,2310,2833,55,0,22);       -- crescent_fish
INSERT INTO `guild_shops` VALUES (517,4477,7400,7880,30,0,12);       -- gavial_fish
INSERT INTO `guild_shops` VALUES (517,4479,1368,8280,55,0,22);       -- bhefhel_marlin
INSERT INTO `guild_shops` VALUES (517,4480,995,2400,55,0,22);        -- gugru_tuna
INSERT INTO `guild_shops` VALUES (517,4481,320,601,255,0,100);       -- ogre_eel
INSERT INTO `guild_shops` VALUES (517,4482,300,656,255,0,100);       -- nosteau_herring
INSERT INTO `guild_shops` VALUES (517,4483,195,1248,255,0,100);      -- tiger_cod
INSERT INTO `guild_shops` VALUES (517,4484,1350,3582,55,0,22);       -- shall_shell
INSERT INTO `guild_shops` VALUES (517,4485,2576,5572,30,0,12);       -- noble_lady
INSERT INTO `guild_shops` VALUES (517,4500,63,208,255,0,100);        -- greedie
INSERT INTO `guild_shops` VALUES (517,4514,60,128,255,0,100);        -- quus
INSERT INTO `guild_shops` VALUES (517,4515,158,274,255,0,100);       -- copper_frog
INSERT INTO `guild_shops` VALUES (517,4579,3062,8680,55,0,22);       -- elshimo_newt
INSERT INTO `guild_shops` VALUES (517,4580,1940,1940,55,0,22);       -- coral_butterfly
INSERT INTO `guild_shops` VALUES (517,16992,52,294,255,48,100);      -- slice_of_bluetail
INSERT INTO `guild_shops` VALUES (517,16993,52,294,255,48,100);      -- peeled_crayfish
INSERT INTO `guild_shops` VALUES (517,16994,52,294,255,48,100);      -- slice_of_carp
INSERT INTO `guild_shops` VALUES (517,16996,52,240,255,48,100);      -- sardine_ball
INSERT INTO `guild_shops` VALUES (517,16997,52,240,255,48,100);      -- crayfish_ball
INSERT INTO `guild_shops` VALUES (517,16998,38,214,255,48,100);      -- insect_ball
INSERT INTO `guild_shops` VALUES (517,16999,52,240,255,48,100);      -- trout_ball
INSERT INTO `guild_shops` VALUES (517,17000,52,240,255,48,100);      -- meatball
INSERT INTO `guild_shops` VALUES (517,17380,25740,25740,30,5,5);
INSERT INTO `guild_shops` VALUES (517,17382,9657,9657,30,5,10);      -- s.h._fishing_rod
INSERT INTO `guild_shops` VALUES (517,17383,1980,1980,30,10,20);     -- clothespole
INSERT INTO `guild_shops` VALUES (517,17387,4077,4077,30,5,15);      -- tarutaru_f._rod
INSERT INTO `guild_shops` VALUES (517,17388,934,934,30,10,20);       -- fastwater_f._rod
INSERT INTO `guild_shops` VALUES (517,17389,332,332,30,10,20);       -- bamboo_fish._rod
INSERT INTO `guild_shops` VALUES (517,17390,145,145,30,10,20);       -- yew_fishing_rod
INSERT INTO `guild_shops` VALUES (517,17391,44,44,30,10,20);         -- willow_fish._rod
INSERT INTO `guild_shops` VALUES (517,17392,213,283,255,48,100);     -- sliced_sardine
INSERT INTO `guild_shops` VALUES (517,17393,213,283,255,48,100);     -- sliced_cod
INSERT INTO `guild_shops` VALUES (517,17394,220,300,255,48,100);     -- peeled_lobster
INSERT INTO `guild_shops` VALUES (517,17395,8,9,255,48,100);         -- lugworm
INSERT INTO `guild_shops` VALUES (517,17396,3,8,255,48,100);         -- little_worm
INSERT INTO `guild_shops` VALUES (517,17399,2394,2394,20,6,12);      -- sabiki_rig
INSERT INTO `guild_shops` VALUES (517,17404,540,540,20,6,12);        -- worm_lure
INSERT INTO `guild_shops` VALUES (517,17405,540,540,20,6,12);        -- fly_lure
INSERT INTO `guild_shops` VALUES (517,17407,303,303,20,6,12);        -- minnow

-- Graegham (Selbina) Fishing Guild (S)
INSERT INTO `guild_shops` VALUES (518,624,58,172,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4354,257,488,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4360,32,140,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4379,134,214,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4383,2016,5989,165,0,65);
INSERT INTO `guild_shops` VALUES (518,4384,5250,13790,165,33,65);
INSERT INTO `guild_shops` VALUES (518,4385,261,489,255,48,100);
INSERT INTO `guild_shops` VALUES (518,4399,2520,7560,165,33,65);
INSERT INTO `guild_shops` VALUES (518,4402,3546,8064,165,0,65);
INSERT INTO `guild_shops` VALUES (518,4403,30,390,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4426,195,272,255,48,100);
INSERT INTO `guild_shops` VALUES (518,4428,136,452,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4443,64,154,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4451,3400,16000,30,6,12);
INSERT INTO `guild_shops` VALUES (518,4461,6048,20792,30,6,12);
INSERT INTO `guild_shops` VALUES (518,4469,770,2856,55,0,22);
INSERT INTO `guild_shops` VALUES (518,4470,1790,3056,55,0,22);
INSERT INTO `guild_shops` VALUES (518,4472,79,238,255,48,100);
INSERT INTO `guild_shops` VALUES (518,4477,3000,5220,30,0,12);
INSERT INTO `guild_shops` VALUES (518,4479,1368,8280,55,11,22);
INSERT INTO `guild_shops` VALUES (518,4480,675,1984,55,0,22);
INSERT INTO `guild_shops` VALUES (518,4481,320,601,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4482,716,1056,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4483,520,1848,255,48,100);
INSERT INTO `guild_shops` VALUES (518,4484,1350,3582,55,0,22);
INSERT INTO `guild_shops` VALUES (518,4485,2170,13440,30,6,12);
INSERT INTO `guild_shops` VALUES (518,4500,24,76,255,48,100);
INSERT INTO `guild_shops` VALUES (518,4514,60,329,255,0,100);
INSERT INTO `guild_shops` VALUES (518,4515,132,248,255,0,100);
INSERT INTO `guild_shops` VALUES (518,17382,9657,9657,30,5,10);
INSERT INTO `guild_shops` VALUES (518,17383,1980,1980,30,10,20);     -- clothespole
INSERT INTO `guild_shops` VALUES (518,17387,4077,4077,30,5,15);      -- tarutaru_f._rod
INSERT INTO `guild_shops` VALUES (518,17388,934,934,30,10,20);       -- fastwater_f._rod
INSERT INTO `guild_shops` VALUES (518,17399,2394,2394,20,6,12);      -- sabiki_rig

-- Mendoline    (Selbina) Fishing Guild (S)
INSERT INTO `guild_shops` VALUES (5182,624,58,172,255,0,100);        -- pamtam_kelp
INSERT INTO `guild_shops` VALUES (5182,4354,257,488,255,0,100);      -- shining_trout
INSERT INTO `guild_shops` VALUES (5182,4360,32,140,255,0,100);       -- bastore_sardine
INSERT INTO `guild_shops` VALUES (5182,4379,134,214,255,0,100);      -- cheval_salmon
INSERT INTO `guild_shops` VALUES (5182,4383,2016,5989,165,0,65);     -- gold_lobster
INSERT INTO `guild_shops` VALUES (5182,4384,5250,13790,165,33,65);   -- black_sole
INSERT INTO `guild_shops` VALUES (5182,4385,261,489,255,48,100);     -- zafmlug_bass
INSERT INTO `guild_shops` VALUES (5182,4399,2520,7560,165,33,65);    -- bluetail
INSERT INTO `guild_shops` VALUES (5182,4402,3546,8064,165,0,65);     -- red_terrapin
INSERT INTO `guild_shops` VALUES (5182,4403,30,390,255,0,100);       -- yellow_globe
INSERT INTO `guild_shops` VALUES (5182,4426,195,272,255,48,100);     -- tricolored_carp
INSERT INTO `guild_shops` VALUES (5182,4428,136,452,255,0,100);      -- dark_bass
INSERT INTO `guild_shops` VALUES (5182,4443,64,154,255,0,100);       -- cobalt_jellyfish
INSERT INTO `guild_shops` VALUES (5182,4451,3400,16000,30,6,12);     -- silver_shark
INSERT INTO `guild_shops` VALUES (5182,4461,6048,20792,30,6,12);     -- bastore_bream
INSERT INTO `guild_shops` VALUES (5182,4469,770,2856,55,0,22);       -- giant_catfish
INSERT INTO `guild_shops` VALUES (5182,4470,1790,3056,55,0,22);      -- icefish
INSERT INTO `guild_shops` VALUES (5182,4472,79,238,255,48,100);      -- crayfish
INSERT INTO `guild_shops` VALUES (5182,4477,3000,5220,30,0,12);      -- gavial_fish
INSERT INTO `guild_shops` VALUES (5182,4479,1368,8280,55,11,22);     -- bhefhel_marlin
INSERT INTO `guild_shops` VALUES (5182,4480,675,1984,55,0,22);       -- gugru_tuna
INSERT INTO `guild_shops` VALUES (5182,4481,320,601,255,0,100);      -- ogre_eel
INSERT INTO `guild_shops` VALUES (5182,4482,716,1056,255,0,100);     -- nosteau_herring
INSERT INTO `guild_shops` VALUES (5182,4483,520,1848,255,48,100);    -- tiger_cod
INSERT INTO `guild_shops` VALUES (5182,4484,1350,3582,55,0,22);      -- shall_shell
INSERT INTO `guild_shops` VALUES (5182,4485,2170,13440,30,6,12);     -- noble_lady
INSERT INTO `guild_shops` VALUES (5182,4500,24,76,255,48,100);       -- greedie
INSERT INTO `guild_shops` VALUES (5182,4514,60,329,255,0,100);       -- quus
INSERT INTO `guild_shops` VALUES (5182,4515,132,248,255,0,100);      -- copper_frog
INSERT INTO `guild_shops` VALUES (5182,17382,9657,9657,30,5,10);     -- s.h._fishing_rod
INSERT INTO `guild_shops` VALUES (5182,17383,1980,1980,30,10,20);
INSERT INTO `guild_shops` VALUES (5182,17387,4077,4077,30,5,15);
INSERT INTO `guild_shops` VALUES (5182,17388,934,934,30,10,20);
INSERT INTO `guild_shops` VALUES (5182,17399,2394,2394,20,6,12);

-- Mep Nhapopoluko (Bibiki Bay) Fishing Guild
INSERT INTO `guild_shops` VALUES (519,624,24,39,255,48,100);
INSERT INTO `guild_shops` VALUES (519,4314,300,300,255,48,100);
INSERT INTO `guild_shops` VALUES (519,4317,120,237,255,48,100);
INSERT INTO `guild_shops` VALUES (519,4318,3375,3375,80,16,32);
INSERT INTO `guild_shops` VALUES (519,4385,115,546,255,48,100);
INSERT INTO `guild_shops` VALUES (519,4399,1350,5487,165,33,65);
INSERT INTO `guild_shops` VALUES (519,4443,15,32,255,48,100);
INSERT INTO `guild_shops` VALUES (519,4484,1350,1800,55,11,22);
INSERT INTO `guild_shops` VALUES (519,4485,2172,13882,30,6,12);
INSERT INTO `guild_shops` VALUES (519,17382,7081,8369,30,5,10);
INSERT INTO `guild_shops` VALUES (519,17388,766,906,30,10,20);

-- Rajmonda (Ship bound for Selbina) Fishing Guild
INSERT INTO `guild_shops` VALUES (520,624,47,158,255,48,100);
INSERT INTO `guild_shops` VALUES (520,4360,41,153,255,0,100);
INSERT INTO `guild_shops` VALUES (520,4361,1216,1289,255,0,100);
INSERT INTO `guild_shops` VALUES (520,4383,4251,5529,165,0,65);
INSERT INTO `guild_shops` VALUES (520,4384,5250,13930,165,0,65);
INSERT INTO `guild_shops` VALUES (520,4385,235,737,255,48,100);
INSERT INTO `guild_shops` VALUES (520,4399,1350,5487,165,33,65);
INSERT INTO `guild_shops` VALUES (520,4403,155,398,255,0,100);
INSERT INTO `guild_shops` VALUES (520,4443,63,157,255,0,100);
INSERT INTO `guild_shops` VALUES (520,4451,3400,18080,30,6,12);
INSERT INTO `guild_shops` VALUES (520,4461,4050,9828,30,0,12);
INSERT INTO `guild_shops` VALUES (520,4479,1368,8280,55,0,22);
INSERT INTO `guild_shops` VALUES (520,4480,375,2000,55,0,22);
INSERT INTO `guild_shops` VALUES (520,4481,320,601,255,0,100);
INSERT INTO `guild_shops` VALUES (520,4482,736,752,255,0,100);
INSERT INTO `guild_shops` VALUES (520,4483,509,1812,255,48,100);
INSERT INTO `guild_shops` VALUES (520,4484,3312,8784,55,0,22);
INSERT INTO `guild_shops` VALUES (520,4485,2100,12544,30,0,12);
INSERT INTO `guild_shops` VALUES (520,4500,24,126,255,0,100);
INSERT INTO `guild_shops` VALUES (520,4514,60,259,255,0,100);
INSERT INTO `guild_shops` VALUES (520,17387,4077,4077,30,5,15);
INSERT INTO `guild_shops` VALUES (520,17395,8,9,255,48,100);
INSERT INTO `guild_shops` VALUES (520,17399,2394,2394,20,6,12);
INSERT INTO `guild_shops` VALUES (520,17400,691,691,20,6,12);
INSERT INTO `guild_shops` VALUES (520,17407,303,303,20,6,12);

-- Lokhong (Ship bound for Mhaura) Fishing Guild
INSERT INTO `guild_shops` VALUES (521,624,47,158,255,48,100);
INSERT INTO `guild_shops` VALUES (521,4360,41,153,255,0,100);
INSERT INTO `guild_shops` VALUES (521,4361,1216,1289,255,0,100);
INSERT INTO `guild_shops` VALUES (521,4383,4251,5529,165,0,65);
INSERT INTO `guild_shops` VALUES (521,4384,5250,13930,165,0,65);
INSERT INTO `guild_shops` VALUES (521,4385,235,737,255,48,100);
INSERT INTO `guild_shops` VALUES (521,4399,1350,5487,165,33,65);
INSERT INTO `guild_shops` VALUES (521,4403,155,398,255,0,100);
INSERT INTO `guild_shops` VALUES (521,4443,63,157,255,0,100);
INSERT INTO `guild_shops` VALUES (521,4451,3400,18080,30,6,12);
INSERT INTO `guild_shops` VALUES (521,4461,4050,9828,30,0,12);
INSERT INTO `guild_shops` VALUES (521,4479,1368,8280,55,0,22);
INSERT INTO `guild_shops` VALUES (521,4480,375,2000,55,0,22);
INSERT INTO `guild_shops` VALUES (521,4481,320,601,255,0,100);
INSERT INTO `guild_shops` VALUES (521,4482,736,752,255,0,100);
INSERT INTO `guild_shops` VALUES (521,4483,509,1812,255,48,100);
INSERT INTO `guild_shops` VALUES (521,4484,3312,8784,55,0,22);
INSERT INTO `guild_shops` VALUES (521,4485,2100,12544,30,0,12);
INSERT INTO `guild_shops` VALUES (521,4500,24,126,255,0,100);
INSERT INTO `guild_shops` VALUES (521,4514,60,259,255,0,100);
INSERT INTO `guild_shops` VALUES (521,17387,4077,4077,30,5,15);
INSERT INTO `guild_shops` VALUES (521,17395,8,9,255,48,100);
INSERT INTO `guild_shops` VALUES (521,17399,2394,2394,20,6,12);
INSERT INTO `guild_shops` VALUES (521,17400,691,691,20,6,12);
INSERT INTO `guild_shops` VALUES (521,17407,303,303,20,6,12);

-- Cehn Teyohngo (Open sea route to Al Zahbi) Fishing Guild
INSERT INTO `guild_shops` VALUES (522,624,47,158,255,0,100);
INSERT INTO `guild_shops` VALUES (522,4360,41,153,255,0,100);
INSERT INTO `guild_shops` VALUES (522,4399,5487,8712,165,0,65);
INSERT INTO `guild_shops` VALUES (522,4403,155,398,255,48,100);
INSERT INTO `guild_shops` VALUES (522,4461,4050,26784,30,0,12);
INSERT INTO `guild_shops` VALUES (522,4480,564,2440,55,11,22);
INSERT INTO `guild_shops` VALUES (522,4484,3412,8928,55,0,22);
INSERT INTO `guild_shops` VALUES (522,4485,2100,12544,30,0,12);
INSERT INTO `guild_shops` VALUES (522,4500,24,126,255,0,100);
INSERT INTO `guild_shops` VALUES (522,4514,114,393,255,48,100);
INSERT INTO `guild_shops` VALUES (522,17387,4077,4077,30,5,15);
INSERT INTO `guild_shops` VALUES (522,17395,8,9,255,48,100);
INSERT INTO `guild_shops` VALUES (522,17399,2394,2394,20,6,12);
INSERT INTO `guild_shops` VALUES (522,17400,691,691,20,6,12);
INSERT INTO `guild_shops` VALUES (522,17407,270,270,20,6,12);

-- Pashi Maccaleh (Open sea route to Mhaura) Fishing Guild
INSERT INTO `guild_shops` VALUES (523,624,47,158,255,0,100);
INSERT INTO `guild_shops` VALUES (523,4360,41,153,255,0,100);
INSERT INTO `guild_shops` VALUES (523,4399,5487,8712,165,0,65);
INSERT INTO `guild_shops` VALUES (523,4403,155,398,255,48,100);
INSERT INTO `guild_shops` VALUES (523,4461,4050,26784,30,0,12);
INSERT INTO `guild_shops` VALUES (523,4480,564,2440,55,11,22);
INSERT INTO `guild_shops` VALUES (523,4484,3412,8928,55,0,22);
INSERT INTO `guild_shops` VALUES (523,4485,2100,12544,30,0,12);
INSERT INTO `guild_shops` VALUES (523,4500,24,126,255,0,100);
INSERT INTO `guild_shops` VALUES (523,4514,114,393,255,48,100);
INSERT INTO `guild_shops` VALUES (523,17387,4077,4077,30,5,15);
INSERT INTO `guild_shops` VALUES (523,17395,8,9,255,48,100);
INSERT INTO `guild_shops` VALUES (523,17399,2394,2394,20,6,12);
INSERT INTO `guild_shops` VALUES (523,17400,691,691,20,6,12);
INSERT INTO `guild_shops` VALUES (523,17407,270,270,20,6,12);

-- Jidwahn (Silver Sea route to Nashmau) Fishing Guild
INSERT INTO `guild_shops` VALUES (524,2177,36,224,8910,1782,3564);
INSERT INTO `guild_shops` VALUES (524,2180,36,224,8910,1782,3564);
INSERT INTO `guild_shops` VALUES (524,2182,36,224,8910,1782,3564);
INSERT INTO `guild_shops` VALUES (524,2183,36,224,8910,1782,3564);
INSERT INTO `guild_shops` VALUES (524,4399,8856,8928,165,0,65);
INSERT INTO `guild_shops` VALUES (524,4403,155,398,255,0,100);
INSERT INTO `guild_shops` VALUES (524,4480,2280,2480,55,0,22);
INSERT INTO `guild_shops` VALUES (524,4485,2100,12544,30,0,12);
INSERT INTO `guild_shops` VALUES (524,5140,69888,75504,15,0,6);
INSERT INTO `guild_shops` VALUES (524,5448,8296,8432,15,0,6);
INSERT INTO `guild_shops` VALUES (524,5449,92,136,255,48,100);
INSERT INTO `guild_shops` VALUES (524,5452,5472,5904,55,11,22);
INSERT INTO `guild_shops` VALUES (524,17387,4077,4077,30,5,15);
INSERT INTO `guild_shops` VALUES (524,17395,8,9,255,48,100);
INSERT INTO `guild_shops` VALUES (524,17399,2394,2394,20,6,12);
INSERT INTO `guild_shops` VALUES (524,17400,691,691,20,6,12);
INSERT INTO `guild_shops` VALUES (524,17407,270,270,20,6,12);


-- Yahliq (Silver Sea route to Al Zahbi) Fishing Guild
INSERT INTO `guild_shops` VALUES (525,2177,36,224,8910,1782,3564);
INSERT INTO `guild_shops` VALUES (525,2180,36,224,8910,1782,3564);
INSERT INTO `guild_shops` VALUES (525,2182,36,224,8910,1782,3564);
INSERT INTO `guild_shops` VALUES (525,2183,36,224,8910,1782,3564);
INSERT INTO `guild_shops` VALUES (525,4399,8856,8928,165,0,65);
INSERT INTO `guild_shops` VALUES (525,4403,155,398,255,0,100);
INSERT INTO `guild_shops` VALUES (525,4480,2280,2480,55,0,22);
INSERT INTO `guild_shops` VALUES (525,4485,2100,12544,30,0,12);
INSERT INTO `guild_shops` VALUES (525,5140,69888,75504,15,0,6);
INSERT INTO `guild_shops` VALUES (525,5448,8296,8432,15,0,6);
INSERT INTO `guild_shops` VALUES (525,5449,92,136,255,48,100);
INSERT INTO `guild_shops` VALUES (525,5452,5472,5904,55,11,22);
INSERT INTO `guild_shops` VALUES (525,17387,4077,4077,30,5,15);
INSERT INTO `guild_shops` VALUES (525,17395,8,9,255,48,100);
INSERT INTO `guild_shops` VALUES (525,17399,2394,2394,20,6,12);
INSERT INTO `guild_shops` VALUES (525,17400,691,691,20,6,12);
INSERT INTO `guild_shops` VALUES (525,17407,270,270,20,6,12);

-- Maymunah (Bastok Mines) Alchemist Guild (S)
INSERT INTO `guild_shops` VALUES (5262,16430,13392,93744,20,0,10);		-- acid_claws
INSERT INTO `guild_shops` VALUES (5262,17605,7725,54075,20,0,10);		-- acid_dagger
INSERT INTO `guild_shops` VALUES (5262,16501,84716,84716,20,0,10);		-- acid_knife
INSERT INTO `guild_shops` VALUES (5262,937,135,945,165,0,65);      		-- animal_glue
INSERT INTO `guild_shops` VALUES (5262,4148,486,1124,165,0,65);      	-- antidote
INSERT INTO `guild_shops` VALUES (5262,1109,930,4563,255,0,100);     	-- artificial_lens
INSERT INTO `guild_shops` VALUES (5262,922,300,300,255,0,100);       	-- bat_wing
INSERT INTO `guild_shops` VALUES (5262,18228,114,114,2970,0,1188);		-- battery
INSERT INTO `guild_shops` VALUES (5262,16572,5781,5781,20,0,10);		-- bee_spatha
INSERT INTO `guild_shops` VALUES (5262,912,192,360,255,0,100);       	-- beehive_chip
INSERT INTO `guild_shops` VALUES (5262,913,135,945,165,0,65);      		-- lump_of_beeswax
INSERT INTO `guild_shops` VALUES (5262,929,1875,6900,80,0,32);       	-- black_ink
INSERT INTO `guild_shops` VALUES (5262,16454,1904,1904,20,0,15);		-- blind_dagger
INSERT INTO `guild_shops` VALUES (5262,16471,519,3024,20,0,10);			-- blind_knife
INSERT INTO `guild_shops` VALUES (5262,928,1004,2513,165,0,65);     	-- bomb_ash
INSERT INTO `guild_shops` VALUES (5262,17343,12,84,8910,0,3564);		-- bronze_bullet
INSERT INTO `guild_shops` VALUES (5262,17340,392,392,8910,0,3564);		-- bullet
INSERT INTO `guild_shops` VALUES (5262,932,1020,1080,165,0,65);      	-- carbon_fiber
INSERT INTO `guild_shops` VALUES (5262,931,19520,19520,15,0,6);      	-- cermet_chunk
INSERT INTO `guild_shops` VALUES (5262,636,97,369,255,48,100);       -- chamomile
INSERT INTO `guild_shops` VALUES (5262,4443,114,153,255,48,100);	 -- cobalt_jellyfish
INSERT INTO `guild_shops` VALUES (5262,621,21,40,255,0,100);         	-- crying_mustard
INSERT INTO `guild_shops` VALUES (5262,4166,750,4200,165,0,65);     	-- flask_of_deodorizer
INSERT INTO `guild_shops` VALUES (5262,4509,9,58,375,0,150);			-- flask_of_distilled_water
INSERT INTO `guild_shops` VALUES (5262,622,36,51,255,48,100);       -- dried_marjoram
INSERT INTO `guild_shops` VALUES (5262,17322,63,441,8910,0,3564);		-- fire_arrow
INSERT INTO `guild_shops` VALUES (5262,16543,5940,41580,20,0,3);		-- fire_sword
INSERT INTO `guild_shops` VALUES (5262,947,3449,19532,55,0,22);      	-- firesand
INSERT INTO `guild_shops` VALUES (5262,16564,34875,244125,20,0,3);		-- flame_blade
INSERT INTO `guild_shops` VALUES (5262,16588,4374,30618,20,0,3);		-- flame_claymore
INSERT INTO `guild_shops` VALUES (5262,16522,25200,176400,20,0,3);		-- flame_degen
INSERT INTO `guild_shops` VALUES (5262,925,1012,4017,55,0,22);      	-- giant_stinger
INSERT INTO `guild_shops` VALUES (5262,933,600,3040,165,0,65);      	-- glass_fiber
INSERT INTO `guild_shops` VALUES (5262,17313,774,5418,8910,0,3564);		-- grenade
INSERT INTO `guild_shops` VALUES (5262,16523,25200,176400,20,0,3);		-- holy_degen
INSERT INTO `guild_shops` VALUES (5262,17041,60178,60178,20,0,3);		-- holy_mace
INSERT INTO `guild_shops` VALUES (5262,16581,33368,167872,20,0,3);		-- holy_sword
INSERT INTO `guild_shops` VALUES (5262,4154,5250,5250,55,0,22);     	-- holy_water
INSERT INTO `guild_shops` VALUES (5262,18232,114,114,2970,0,1188);	-- hydro_pump
INSERT INTO `guild_shops` VALUES (5262,17323,242,242,8910,0,3564);		-- ice_arrow
INSERT INTO `guild_shops` VALUES (5262,16709,1569,10983,20,0,3);		-- inferno_axe
INSERT INTO `guild_shops` VALUES (5262,16594,15696,109872,20,0,3);		-- inferno_sword
INSERT INTO `guild_shops` VALUES (5262,17324,63,441,8910,0,3564);		-- lightning_arrow
INSERT INTO `guild_shops` VALUES (5262,920,1084,5899,165,48,65);     -- malboro_vine
INSERT INTO `guild_shops` VALUES (5262,914,1125,4320,165,33,65);     -- mercury
INSERT INTO `guild_shops` VALUES (5262,16410,9504,66528,20,0,5);		-- psn._baghnakhs
INSERT INTO `guild_shops` VALUES (5262,16458,4980,34860,20,0,5);		-- poison_baselard
INSERT INTO `guild_shops` VALUES (5262,16387,13471,33886,20,0,10);		-- poison_cesti
INSERT INTO `guild_shops` VALUES (5262,16417,10800,75600,20,0,10);		-- poison_claws
INSERT INTO `guild_shops` VALUES (5262,16496,4464,31248,20,0,10);		-- poison_dagger
INSERT INTO `guild_shops` VALUES (5262,943,246,1305,255,0,100);      	-- poison_dust
INSERT INTO `guild_shops` VALUES (5262,16403,108218,108218,20,0,3);		-- poison_katars
INSERT INTO `guild_shops` VALUES (5262,16472,13020,13020,20,0,3);		-- poison_knife
INSERT INTO `guild_shops` VALUES (5262,16478,19148,19148,20,0,5);		-- poison_kukri
INSERT INTO `guild_shops` VALUES (5262,4157,800,2240,80,0,32);     		-- flask_of_poison_potion
INSERT INTO `guild_shops` VALUES (5262,4164,1050,3304,165,0,65);     	-- prism_powder
INSERT INTO `guild_shops` VALUES (5262,17315,2970,20790,8910,0,3564);	-- riot_grenade
INSERT INTO `guild_shops` VALUES (5262,638,138,777,255,48,100);    	 -- sage
INSERT INTO `guild_shops` VALUES (5262,16429,3711,25977,20,0,5);		-- slc._baghnakhs
INSERT INTO `guild_shops` VALUES (5262,16495,9906,9906,20,0,10);		-- silence_dagger
INSERT INTO `guild_shops` VALUES (5262,4162,675,4725,80,0,32);     		-- silencing_potion
INSERT INTO `guild_shops` VALUES (5262,4165,1870,1870,165,0,65);      	-- silent_oil
INSERT INTO `guild_shops` VALUES (5262,17341,392,392,2970,0,1188);		-- silver_bullet
INSERT INTO `guild_shops` VALUES (5262,637,1870,1870,165,0,65);      	-- slime_oil
INSERT INTO `guild_shops` VALUES (5262,1108,573,765,255,48,100);   	 -- sulfur
INSERT INTO `guild_shops` VALUES (5262,2131,75,242,255,48,100);      -- triturator
INSERT INTO `guild_shops` VALUES (5262,4171,360,2284,80,0,100);		 	-- flask_of_vitriol
INSERT INTO `guild_shops` VALUES (5262,16600,300,2100,20,0,3);			-- wax_sword
INSERT INTO `guild_shops` VALUES (5262,951,90,95,255,48,100);       -- wijnruit
INSERT INTO `guild_shops` VALUES (5262,18236,21,21,2970,48,1188);	-- wind_fan
-- TODO: All items purchasable from Curio Moogle commented out pending research on price changes
-- INSERT INTO `guild_shops` VALUES (5262,4112,682,728,80,16,32);       -- potion
-- INSERT INTO `guild_shops` VALUES (5262,4116,3375,7560,55,0,22);      -- hi-potion
-- INSERT INTO `guild_shops` VALUES (5262,4128,3624,17201,30,0,12);     -- ether
-- INSERT INTO `guild_shops` VALUES (5262,4148,1200,1377,80,0,32);      -- antidote
-- INSERT INTO `guild_shops` VALUES (5262,4150,1945,9549,80,0,32);      -- eye_drops
-- INSERT INTO `guild_shops` VALUES (5262,4151,880,2944,80,0,32);       -- echo_drops


-- Visala (Goldsmith Guild) Bastok Markets (S)
INSERT INTO `guild_shops` VALUES (5272,640,9,36,255,48,100);         -- copper_ore
INSERT INTO `guild_shops` VALUES (5272,642,595,620,165,33,65);       -- zinc_ore
INSERT INTO `guild_shops` VALUES (5272,644,1500,9200,165,33,65);     -- mythril_ore
INSERT INTO `guild_shops` VALUES (5272,653,19900,36400,55,0,22);     -- mythril_ingot
INSERT INTO `guild_shops` VALUES (5272,661,1171,1171,255,0,100);     -- brass_sheet
INSERT INTO `guild_shops` VALUES (5272,663,20240,45600,80,16,32);    -- mythril_sheet
INSERT INTO `guild_shops` VALUES (5272,673,210,1108,255,48,100);     -- brass_scales
INSERT INTO `guild_shops` VALUES (5272,681,10500,30800,30,6,12);     -- mythril_chain
INSERT INTO `guild_shops` VALUES (5272,736,315,1260,255,48,100);     -- silver_ore
INSERT INTO `guild_shops` VALUES (5272,738,58032,116245,30,0,12);    -- platinum_ore
INSERT INTO `guild_shops` VALUES (5272,744,4095,9996,80,0,32);       -- silver_ingot
INSERT INTO `guild_shops` VALUES (5272,760,29172,74880,55,0,22);     -- silver_chain
INSERT INTO `guild_shops` VALUES (5272,769,1288,7000,165,33,65);     -- red_rock
INSERT INTO `guild_shops` VALUES (5272,770,1288,7000,165,33,65);     -- blue_rock
INSERT INTO `guild_shops` VALUES (5272,771,1288,7000,165,33,65);     -- yellow_rock
INSERT INTO `guild_shops` VALUES (5272,772,1288,7000,165,33,65);     -- green_rock
INSERT INTO `guild_shops` VALUES (5272,773,1288,7000,165,33,65);     -- translucent_rock
INSERT INTO `guild_shops` VALUES (5272,774,1288,7000,165,33,65);     -- purple_rock
INSERT INTO `guild_shops` VALUES (5272,775,1288,7000,165,33,65);     -- black_rock
INSERT INTO `guild_shops` VALUES (5272,776,1288,7000,165,0,65);      -- white_rock
INSERT INTO `guild_shops` VALUES (5272,784,23400,124800,15,0,3);     -- jadeite
INSERT INTO `guild_shops` VALUES (5272,785,106400,116736,15,0,3);    -- emerald
INSERT INTO `guild_shops` VALUES (5272,786,45600,116736,15,0,3);     -- ruby
INSERT INTO `guild_shops` VALUES (5272,787,106400,116736,15,0,3);    -- diamond
INSERT INTO `guild_shops` VALUES (5272,788,12000,56160,15,0,6);      -- peridot
INSERT INTO `guild_shops` VALUES (5272,789,106400,116736,15,0,3);    -- topaz
INSERT INTO `guild_shops` VALUES (5272,790,3600,9000,15,0,6);        -- garnet
INSERT INTO `guild_shops` VALUES (5272,791,23400,136032,15,1,3);     -- aquamarine
INSERT INTO `guild_shops` VALUES (5272,795,1396,2794,80,16,32);      -- lapis_lazuli
INSERT INTO `guild_shops` VALUES (5272,796,1396,2794,80,0,32);       -- light_opal
INSERT INTO `guild_shops` VALUES (5272,797,44304,49608,15,3,6);
INSERT INTO `guild_shops` VALUES (5272,799,1396,2794,80,16,32);
INSERT INTO `guild_shops` VALUES (5272,800,1396,2794,80,0,32);
INSERT INTO `guild_shops` VALUES (5272,801,23400,70200,15,0,3);
INSERT INTO `guild_shops` VALUES (5272,802,23400,70200,15,0,3);
INSERT INTO `guild_shops` VALUES (5272,803,23400,70200,15,0,3);
INSERT INTO `guild_shops` VALUES (5272,804,106400,116736,15,0,3);
INSERT INTO `guild_shops` VALUES (5272,805,23400,70200,15,2,3);
INSERT INTO `guild_shops` VALUES (5272,806,1396,2794,80,16,32);
INSERT INTO `guild_shops` VALUES (5272,807,1396,2794,80,0,32);
INSERT INTO `guild_shops` VALUES (5272,808,9000,24000,15,3,6);
INSERT INTO `guild_shops` VALUES (5272,809,1396,2794,80,0,32);
INSERT INTO `guild_shops` VALUES (5272,810,23400,70200,15,0,3);
INSERT INTO `guild_shops` VALUES (5272,811,9000,27000,15,0,6);
INSERT INTO `guild_shops` VALUES (5272,812,106400,116736,15,0,3);
INSERT INTO `guild_shops` VALUES (5272,813,106400,116736,15,3,3);
INSERT INTO `guild_shops` VALUES (5272,814,1396,2794,80,0,32);
INSERT INTO `guild_shops` VALUES (5272,815,9000,27000,15,3,6);
INSERT INTO `guild_shops` VALUES (5272,1588,20400,20400,30,0,12);
INSERT INTO `guild_shops` VALUES (5272,12425,17100,43776,20,0,15);
INSERT INTO `guild_shops` VALUES (5272,12433,18176,30208,20,0,15);
INSERT INTO `guild_shops` VALUES (5272,12449,1503,4300,20,0,15);
INSERT INTO `guild_shops` VALUES (5272,12472,153,214,20,0,20);
INSERT INTO `guild_shops` VALUES (5272,12495,4398,4398,20,0,10);
INSERT INTO `guild_shops` VALUES (5272,12496,117,234,20,0,20);
INSERT INTO `guild_shops` VALUES (5272,12497,970,1190,20,0,15);
INSERT INTO `guild_shops` VALUES (5272,12561,14000,24000,20,0,20);
INSERT INTO `guild_shops` VALUES (5272,12689,11000,22000,20,0,20);
INSERT INTO `guild_shops` VALUES (5272,12705,1023,2620,20,0,15);
INSERT INTO `guild_shops` VALUES (5272,12833,3840,7360,20,0,15);
INSERT INTO `guild_shops` VALUES (5272,12945,11440,11440,20,0,15);   -- brass_greaves
INSERT INTO `guild_shops` VALUES (5272,12961,2380,3720,20,0,15);     -- brass_leggings
INSERT INTO `guild_shops` VALUES (5272,13196,52284,52284,20,0,10);   -- silver_belt
INSERT INTO `guild_shops` VALUES (5272,13317,12800,12800,20,5,10);   -- pearl_earring
INSERT INTO `guild_shops` VALUES (5272,13327,5850,5850,20,0,15);     -- silver_earring
INSERT INTO `guild_shops` VALUES (5272,13330,1238,1238,20,5,10);     -- tml._earring
INSERT INTO `guild_shops` VALUES (5272,13331,1522,1522,20,0,10);     -- sardonyx_earring
INSERT INTO `guild_shops` VALUES (5272,13332,1186,1238,20,0,20);     -- clear_earring
INSERT INTO `guild_shops` VALUES (5272,13333,1186,1238,20,0,20);     -- amethyst_earring
INSERT INTO `guild_shops` VALUES (5272,13334,1186,1238,20,0,20);     -- lapis_laz._earring
INSERT INTO `guild_shops` VALUES (5272,13340,12880,12880,20,0,10);   -- ametrine_earring
INSERT INTO `guild_shops` VALUES (5272,13342,12250,12250,20,0,10);   -- sphene_earring
INSERT INTO `guild_shops` VALUES (5272,13343,1775,5000,20,0,10);     -- green_earring
INSERT INTO `guild_shops` VALUES (5272,13344,1987,5000,20,0,10);     -- sun_earring
INSERT INTO `guild_shops` VALUES (5272,13454,72,179,20,0,20);        -- copper_ring
INSERT INTO `guild_shops` VALUES (5272,13468,1875,2400,20,0,15);     -- tourmaline_ring
INSERT INTO `guild_shops` VALUES (5272,13470,1875,2400,20,0,15);     -- clear_ring
INSERT INTO `guild_shops` VALUES (5272,13471,1875,2400,20,0,15);     -- amethyst_ring
INSERT INTO `guild_shops` VALUES (5272,13472,1875,2400,20,0,15);     -- lapis_lazuli_ring
INSERT INTO `guild_shops` VALUES (5272,13473,1875,2400,20,0,15);     -- amber_ring
INSERT INTO `guild_shops` VALUES (5272,13474,1875,2400,20,0,15);     -- onyx_ring
INSERT INTO `guild_shops` VALUES (5272,13979,20088,20088,20,3,10);   -- silver_bangles
INSERT INTO `guild_shops` VALUES (5272,16391,2700,13989,20,0,10);    -- brass_knuckles
INSERT INTO `guild_shops` VALUES (5272,16407,2399,13554,20,5,10);    -- brass_baghnakhs
INSERT INTO `guild_shops` VALUES (5272,16449,3422,15656,20,5,10);    -- brass_dagger
INSERT INTO `guild_shops` VALUES (5272,16551,3631,15487,20,0,10);    -- sapara
INSERT INTO `guild_shops` VALUES (5272,16641,2870,13845,20,0,10);    -- brass_axe
INSERT INTO `guild_shops` VALUES (5272,16769,2245,13221,20,0,10);    -- brass_zaghnal
INSERT INTO `guild_shops` VALUES (5272,17043,1735,1839,20,0,10);     -- brass_hammer

-- Yabby Tanmikey (Goldsmith Guild) Mhaura (S)
INSERT INTO `guild_shops` VALUES (528,640,9,20,255,48,100);
INSERT INTO `guild_shops` VALUES (528,736,315,945,255,48,100);
INSERT INTO `guild_shops` VALUES (528,769,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (528,770,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (528,771,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (528,772,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (528,773,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (528,774,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (528,775,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (528,776,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (528,2143,320,320,255,48,100);
INSERT INTO `guild_shops` VALUES (528,2144,75,75,255,48,100);

-- Kueh Igunahmori (Leathercraft Guild) Southern San d'Oria (S)
INSERT INTO `guild_shops` VALUES (529,505,62,349,255,48,100);
INSERT INTO `guild_shops` VALUES (529,506,9600,11333,165,0,65);
INSERT INTO `guild_shops` VALUES (529,695,120,184,255,48,100);
INSERT INTO `guild_shops` VALUES (529,832,1000,2800,80,20,40);
INSERT INTO `guild_shops` VALUES (529,848,2912,4636,80,0,32);
INSERT INTO `guild_shops` VALUES (529,850,390,390,80,0,32);
INSERT INTO `guild_shops` VALUES (529,851,2718,7139,80,0,32);
INSERT INTO `guild_shops` VALUES (529,852,630,640,255,0,100);
INSERT INTO `guild_shops` VALUES (529,853,2400,6000,165,36,65);
INSERT INTO `guild_shops` VALUES (529,854,2650,3304,165,33,65);
INSERT INTO `guild_shops` VALUES (529,855,9077,10874,30,0,12);
INSERT INTO `guild_shops` VALUES (529,856,45,130,255,48,100);
INSERT INTO `guild_shops` VALUES (529,857,1290,1990,255,0,100);
INSERT INTO `guild_shops` VALUES (529,858,483,1161,165,33,65);
INSERT INTO `guild_shops` VALUES (529,859,937,2650,80,33,32);
INSERT INTO `guild_shops` VALUES (529,861,1312,3124,55,11,22);
INSERT INTO `guild_shops` VALUES (529,863,4000,8000,55,11,22);
INSERT INTO `guild_shops` VALUES (529,917,481,963,255,0,100);
INSERT INTO `guild_shops` VALUES (529,1116,5000,8600,30,6,12);
INSERT INTO `guild_shops` VALUES (529,1117,8385,15000,30,0,12);
INSERT INTO `guild_shops` VALUES (529,2129,75,75,255,48,100);
INSERT INTO `guild_shops` VALUES (529,4509,9,23,375,75,150);
INSERT INTO `guild_shops` VALUES (529,12294,13500,14000,10,0,10);
INSERT INTO `guild_shops` VALUES (529,12440,330,880,20,0,20);
INSERT INTO `guild_shops` VALUES (529,12441,3318,8407,20,0,15);
INSERT INTO `guild_shops` VALUES (529,12442,8000,9000,20,0,10);
INSERT INTO `guild_shops` VALUES (529,12443,8500,9300,20,0,20);
INSERT INTO `guild_shops` VALUES (529,12444,9200,10000,20,0,5);
INSERT INTO `guild_shops` VALUES (529,12568,987,1323,20,0,20);
INSERT INTO `guild_shops` VALUES (529,12569,5145,16189,20,0,15);     -- lizard_jerkin
INSERT INTO `guild_shops` VALUES (529,12570,44232,44916,20,0,10);    -- studded_vest
INSERT INTO `guild_shops` VALUES (529,12571,32340,84946,20,0,5);     -- cuir_bouilli
INSERT INTO `guild_shops` VALUES (529,12572,44460,116781,20,0,5);    -- raptor_jerkin
INSERT INTO `guild_shops` VALUES (529,12696,318,1612,20,0,20);       -- leather_gloves
INSERT INTO `guild_shops` VALUES (529,12697,2700,7092,20,0,15);      -- lizard_gloves
INSERT INTO `guild_shops` VALUES (529,12698,11610,53625,20,0,10);    -- studded_gloves
INSERT INTO `guild_shops` VALUES (529,12699,17052,44789,20,0,5);     -- cuir_gloves
INSERT INTO `guild_shops` VALUES (529,12700,29700,150480,20,0,5);    -- raptor_gloves
INSERT INTO `guild_shops` VALUES (529,12724,589,1055,20,0,20);       -- battle_bracers
INSERT INTO `guild_shops` VALUES (529,12825,5819,10714,20,0,15);     -- lizard_trousers
INSERT INTO `guild_shops` VALUES (529,12826,32002,36232,20,0,10);    -- studded_trousers
INSERT INTO `guild_shops` VALUES (529,12827,25200,66192,20,0,5);     -- cuir_trousers
INSERT INTO `guild_shops` VALUES (529,12828,42900,112684,20,0,5);    -- raptor_trousers
INSERT INTO `guild_shops` VALUES (529,12952,504,1639,20,0,20);       -- leather_highboots
INSERT INTO `guild_shops` VALUES (529,12953,2578,16777,20,0,15);     -- lizard_ledelsens
INSERT INTO `guild_shops` VALUES (529,12955,15624,41039,20,0,5);     -- cuir_highboots
INSERT INTO `guild_shops` VALUES (529,12956,58027,72811,20,0,5);     -- raptor_ledelsens
INSERT INTO `guild_shops` VALUES (529,12992,453,1815,20,0,20);       -- solea
INSERT INTO `guild_shops` VALUES (529,12993,3366,8841,20,0,15);      -- sandals
INSERT INTO `guild_shops` VALUES (529,12994,11481,28273,20,0,10);    -- shoes
INSERT INTO `guild_shops` VALUES (529,12995,48960,76296,20,0,5);     -- moccasins
INSERT INTO `guild_shops` VALUES (529,13081,211,1003,20,0,20);       -- leather_gorget
INSERT INTO `guild_shops` VALUES (529,13089,6384,15662,20,0,15);     -- wolf_gorget
INSERT INTO `guild_shops` VALUES (529,13192,837,1224,20,10,20);      -- leather_belt
INSERT INTO `guild_shops` VALUES (529,13193,4590,12420,20,0,15);     -- lizard_belt
INSERT INTO `guild_shops` VALUES (529,13194,16896,20803,20,0,5);     -- warriors_belt
INSERT INTO `guild_shops` VALUES (529,13195,2277,5980,20,0,10);      -- magic_belt
INSERT INTO `guild_shops` VALUES (529,13200,13860,35112,20,0,10);    -- waistbelt
INSERT INTO `guild_shops` VALUES (529,13203,2277,5980,20,0,10);      -- barbarians_belt
INSERT INTO `guild_shops` VALUES (529,13469,937,2087,20,0,20);       -- leather_ring
INSERT INTO `guild_shops` VALUES (529,13570,10800,25488,20,0,10);    -- ram_mantle
INSERT INTO `guild_shops` VALUES (529,13571,6426,31530,20,0,10);     -- wolf_mantle
INSERT INTO `guild_shops` VALUES (529,13588,2484,14440,20,0,10);     -- dhalmel_mantle
INSERT INTO `guild_shops` VALUES (529,13592,2065,9804,20,0,15);      -- lizard_mantle
INSERT INTO `guild_shops` VALUES (529,13593,24000,62080,20,0,5);     -- raptor_mantle
INSERT INTO `guild_shops` VALUES (529,13594,132,316,20,10,20);       -- rabbit_mantle
INSERT INTO `guild_shops` VALUES (529,13703,44100,108192,20,0,3);    -- brigandine
INSERT INTO `guild_shops` VALUES (529,16385,279,283,20,0,20);        -- cesti
INSERT INTO `guild_shops` VALUES (529,16386,945,5997,20,0,15);       -- lizard_cesti
INSERT INTO `guild_shops` VALUES (529,16388,11970,27700,20,0,5);     -- himantes

-- Kopopo (Windurst Waters) Cooking Guild (S)
INSERT INTO `guild_shops` VALUES (530,4510,27,189,255,0,100);			-- acorn_cookie
INSERT INTO `guild_shops` VALUES (530,4423,225,876,55,0,22);        	-- apple_juice
INSERT INTO `guild_shops` VALUES (530,4413,225,876,165,0,65);     		-- apple_pie
INSERT INTO `guild_shops` VALUES (530,625,66,334,255,48,100);		-- apple_vinegar
INSERT INTO `guild_shops` VALUES (530,4406,638,2200,165,0,65);     		-- baked_apple
INSERT INTO `guild_shops` VALUES (530,4436,240,1600,165,0,65);       	-- baked_popoto
INSERT INTO `guild_shops` VALUES (530,4360,114,160,255,0,100);			-- bastore_sardine
INSERT INTO `guild_shops` VALUES (530,4367,36,238,255,48,100);      -- batagreens
INSERT INTO `guild_shops` VALUES (530,4572,1360,7260,55,0,22);      	-- beaugr._saute
INSERT INTO `guild_shops` VALUES (530,4571,75,460,255,48,100);      -- beaugreens
INSERT INTO `guild_shops` VALUES (530,4570,48,188,255,48,100);      -- bird_egg
INSERT INTO `guild_shops` VALUES (530,4364,90,576,255,0,100);       	-- black_bread
INSERT INTO `guild_shops` VALUES (530,618,21,50,255,48,100);		-- blue_peas			
INSERT INTO `guild_shops` VALUES (530,4399,2700,2700,165,0,65);     	-- bluetail
INSERT INTO `guild_shops` VALUES (530,4456,1856,10980,165,0,65);    	-- boiled_crab
INSERT INTO `guild_shops` VALUES (530,4391,41,274,165,0,65);    		-- bretzel
INSERT INTO `guild_shops` VALUES (530,4397,12,12,165,0,65);    			-- cinna_cookie
INSERT INTO `guild_shops` VALUES (530,628,195,572,255,48,100);		-- cinnamon
INSERT INTO `guild_shops` VALUES (530,4435,3520,3968,165,0,65);      	-- cockatrice_meat
INSERT INTO `guild_shops` VALUES (530,1555,1061,1188,255,48,100);	-- coriander
INSERT INTO `guild_shops` VALUES (530,4472,147,198,255,0,100);			-- crayfish			
INSERT INTO `guild_shops` VALUES (530,621,21,40,255,48,100);		--crying_mustard
INSERT INTO `guild_shops` VALUES (530,1475,741,5187,255,0,100);			-- curry_powder
INSERT INTO `guild_shops` VALUES (530,4359,424,1017,255,0,100);			-- dhalmel_meat
INSERT INTO `guild_shops` VALUES (530,4438,2736,7084,55,0,22);      	-- dhalmel_steak
INSERT INTO `guild_shops` VALUES (530,622,36,220,255,48,100);		-- dried_marjoram
INSERT INTO `guild_shops` VALUES (530,4457,4800,13920,165,0,65);     	-- eel_kabob
INSERT INTO `guild_shops` VALUES (530,4417,3960,16236,165,0,65);     	-- egg_soup
INSERT INTO `guild_shops` VALUES (530,4363,39,220,255,48,100);		-- faerie_apple
INSERT INTO `guild_shops` VALUES (530,4398,2127,3256,165,0,65);     	-- fish_mithkabob
INSERT INTO `guild_shops` VALUES (530,2110,457,530,255,48,100);		-- fish_stock
INSERT INTO `guild_shops` VALUES (530,4382,158,160,165,0,65);          	-- frost_turnip
INSERT INTO `guild_shops` VALUES (530,1111,450,2760,255,0,100);			-- gelatin
INSERT INTO `guild_shops` VALUES (530,4372,93,236,255,0,100);			-- g._sheep_meat
INSERT INTO `guild_shops` VALUES (530,4394,9,55,255,0,100);          	-- ginger_cookie
INSERT INTO `guild_shops` VALUES (530,4383,3906,5760,165,0,65);			-- gold_lobster
INSERT INTO `guild_shops` VALUES (530,4441,720,4650,165,0,65);      	-- grape_juice
INSERT INTO `guild_shops` VALUES (530,4371,266,853,55,0,22);       		-- grilled_hare
INSERT INTO `guild_shops` VALUES (530,4409,72,371,165,0,65);      	 	-- hard-boiled_egg
INSERT INTO `guild_shops` VALUES (530,4358,139,136,255,0,100);			-- hare_meat
INSERT INTO `guild_shops` VALUES (530,1590,536,680,255,48,100);		-- holy_basil
INSERT INTO `guild_shops` VALUES (530,4370,240,590,255,0,100);       	-- honey
INSERT INTO `guild_shops` VALUES (530,631,200,200,255,0,100);       	-- horo_flour
INSERT INTO `guild_shops` VALUES (530,4556,10644,10644,55,0,22);    	-- icecap_rolanberry
INSERT INTO `guild_shops` VALUES (530,4499,77,320,165,0,65);         	-- iron_bread
INSERT INTO `guild_shops` VALUES (530,612,45,194,255,48,100);		-- kazham_peppers
INSERT INTO `guild_shops` VALUES (530,4432,115,261,255,48,100);     -- kazham_pineapl.
INSERT INTO `guild_shops` VALUES (530,4366,18,43,255,48,100);      	-- la_theine_cbg.
INSERT INTO `guild_shops` VALUES (530,4362,300,300,255,0,100);			-- lizard_egg	
INSERT INTO `guild_shops` VALUES (530,627,200,200,255,0,100);			-- maple_sugar
INSERT INTO `guild_shops` VALUES (530,4376,90,364,255,0,100);       	-- meat_jerky
INSERT INTO `guild_shops` VALUES (530,4381,1382,3872,165,0,65);     	-- meat_mithkabob
INSERT INTO `guild_shops` VALUES (530,4424,1573,3872,55,0,22);       	-- melon_juice
INSERT INTO `guild_shops` VALUES (530,614,60,631,255,48,100);		-- mhaura_garlic
INSERT INTO `guild_shops` VALUES (530,629,36,182,255,48,100);		-- 	millioncorn
INSERT INTO `guild_shops` VALUES (530,4390,78,195,255,48,100);      -- mithran_tomato
INSERT INTO `guild_shops` VALUES (530,4401,45,315,165,0,65);			-- moat_carp
INSERT INTO `guild_shops` VALUES (530,4156,3872,3936,55,0,22);			-- mulsum
INSERT INTO `guild_shops` VALUES (530,4419,34720,34720,165,0,65);    	-- mushroom_soup
INSERT INTO `guild_shops` VALUES (530,4459,8568,8568,165,0,65);    		-- nebimonite_bake
INSERT INTO `guild_shops` VALUES (530,4482,1408,1984,255,0,100);     	-- nosteau_herring
INSERT INTO `guild_shops` VALUES (530,4422,150,888,55,0,22);        	-- orange_juice
INSERT INTO `guild_shops` VALUES (530,4563,15360,15360,15,0,6);       	-- pamama_tart
INSERT INTO `guild_shops` VALUES (530,4468,148,384,165,33,65);      -- pamamas
INSERT INTO `guild_shops` VALUES (530,4416,2716,6944,165,0,65);      	-- pea_soup
INSERT INTO `guild_shops` VALUES (530,4455,968,984,165,0,65);       	-- pebble_soup
INSERT INTO `guild_shops` VALUES (530,4490,955,2284,165,0,65);       	-- pickled_herring
INSERT INTO `guild_shops` VALUES (530,616,60,368,255,48,100);		-- pie_dough	
INSERT INTO `guild_shops` VALUES (530,4442,300,1600,55,0,22);       	-- pineapple_juice
INSERT INTO `guild_shops` VALUES (530,619,36,40,255,48,100);       	-- popoto
INSERT INTO `guild_shops` VALUES (530,4492,1182,2845,55,0,22);      	-- puls
INSERT INTO `guild_shops` VALUES (530,4444,44,117,165,0,65);         	-- rarab_tail
INSERT INTO `guild_shops` VALUES (530,4537,1040,1768,165,0,65);      	-- roast_carp
INSERT INTO `guild_shops` VALUES (530,4410,670,1706,165,0,65);      	-- roast_mushroom
INSERT INTO `guild_shops` VALUES (530,4437,1288,3024,55,0,22);       	-- roast_mutton
INSERT INTO `guild_shops` VALUES (530,4538,1628,4232,165,0,65);    		-- roast_pipira
INSERT INTO `guild_shops` VALUES (530,4404,918,918,165,0,65);     		-- roast_trout
INSERT INTO `guild_shops` VALUES (530,4415,124,620,165,0,65);         	-- roasted_corn
INSERT INTO `guild_shops` VALUES (530,936,25,73,255,48,65);     	-- rock_salt
INSERT INTO `guild_shops` VALUES (530,4365,585,590,255,0,100);       	-- rolanberry
INSERT INTO `guild_shops` VALUES (530,611,30,60,255,48,100);		-- rye_flour
INSERT INTO `guild_shops` VALUES (530,4355,1946,4973,165,0,65);     	-- salmon_sub
INSERT INTO `guild_shops` VALUES (530,4389,60,157,255,48,100);      -- san_dor._carrot
INSERT INTO `guild_shops` VALUES (530,610,52,252,255,48,100);		-- san_dor._flour
INSERT INTO `guild_shops` VALUES (530,4431,63,367,255,48,100);      -- san_dor._grape
INSERT INTO `guild_shops` VALUES (530,4392,58,152,255,48,100);      -- saruta_orange
INSERT INTO `guild_shops` VALUES (530,615,45,292,255,0,100);			-- selbina_butter
INSERT INTO `guild_shops` VALUES (530,4378,57,264,255,48,100);       -- selbina_milk
INSERT INTO `guild_shops` VALUES (530,1840,1500,2800,255,48,100);	 -- semolina	
INSERT INTO `guild_shops` VALUES (530,4354,117,819,255,0,100);			-- shining_trout
INSERT INTO `guild_shops` VALUES (530,4380,165,924,165,33,65);      -- smoked_salmon
INSERT INTO `guild_shops` VALUES (530,2111,525,530,255,48,100);		-- soy_stock
INSERT INTO `guild_shops` VALUES (530,620,45,276,255,48,100);		-- tarutaru_rice
INSERT INTO `guild_shops` VALUES (530,4412,287,1235,165,33,65);     -- thundermelon
INSERT INTO `guild_shops` VALUES (530,4483,937,1289,165,0,65);     		-- tiger_cod
INSERT INTO `guild_shops` VALUES (530,4425,559,1446,55,0,22);       	-- tomato_juice
INSERT INTO `guild_shops` VALUES (530,4420,13124,13230,165,0,65);    	-- tomato_soup
INSERT INTO `guild_shops` VALUES (530,4408,105,560,165,0,65);       	-- tortilla
INSERT INTO `guild_shops` VALUES (530,1554,431,438,255,48,100);		-- turmeric	
INSERT INTO `guild_shops` VALUES (530,2112,530,540,255,48,100);		-- vanilla
INSERT INTO `guild_shops` VALUES (530,4489,1950,1950,255,0,100);      	-- vegetable_gruel
INSERT INTO `guild_shops` VALUES (530,4560,2861,2861,55,0,22);      	-- vegetable_soup
INSERT INTO `guild_shops` VALUES (530,4491,158,760,165,33,65);       -- watermelon
INSERT INTO `guild_shops` VALUES (530,4356,210,992,165,0,65);			-- white_bread
INSERT INTO `guild_shops` VALUES (530,4387,1794,1950,255,0,100);      	-- wild_onion
INSERT INTO `guild_shops` VALUES (530,4555,3701,3701,255,0,100);		-- windurst_salad
INSERT INTO `guild_shops` VALUES (530,4445,114,114,165,0,65);         	-- yagudo_cherry

-- Doggomehr (Northern San d'Oria) Smithing Guild (S)
INSERT INTO `guild_shops` VALUES (531,640,9,36,255,48,100);
INSERT INTO `guild_shops` VALUES (531,641,30,66,255,48,100);
INSERT INTO `guild_shops` VALUES (531,643,675,981,165,33,65);
INSERT INTO `guild_shops` VALUES (531,649,115,349,165,33,65);
INSERT INTO `guild_shops` VALUES (531,651,2700,10800,165,33,65);
INSERT INTO `guild_shops` VALUES (531,652,25620,25620,80,16,32);
INSERT INTO `guild_shops` VALUES (531,660,69,294,165,33,65);
INSERT INTO `guild_shops` VALUES (531,662,4050,9898,165,33,65);
INSERT INTO `guild_shops` VALUES (531,666,14868,39984,165,0,65);
INSERT INTO `guild_shops` VALUES (531,672,81,254,165,0,65);
INSERT INTO `guild_shops` VALUES (531,676,13720,13720,80,0,32);
INSERT INTO `guild_shops` VALUES (531,680,11781,11781,80,0,32);
INSERT INTO `guild_shops` VALUES (531,1155,2400,2400,165,33,65);
INSERT INTO `guild_shops` VALUES (531,2143,320,320,255,48,100);
INSERT INTO `guild_shops` VALUES (531,2144,75,75,255,48,100);
INSERT INTO `guild_shops` VALUES (531,12424,7695,26676,20,0,15);
INSERT INTO `guild_shops` VALUES (531,12432,2711,2856,20,10,20);
INSERT INTO `guild_shops` VALUES (531,12688,1666,5664,20,7,15);
INSERT INTO `guild_shops` VALUES (531,12944,1519,5294,20,0,15);
INSERT INTO `guild_shops` VALUES (531,13783,81084,162345,20,0,10);
INSERT INTO `guild_shops` VALUES (531,13871,27216,47355,20,0,10);
INSERT INTO `guild_shops` VALUES (531,13873,61107,70963,20,3,5);
INSERT INTO `guild_shops` VALUES (531,14001,42476,88529,20,0,10);
INSERT INTO `guild_shops` VALUES (531,14003,79745,84198,20,0,5);
INSERT INTO `guild_shops` VALUES (531,14245,52785,166096,20,0,5);
INSERT INTO `guild_shops` VALUES (531,16412,56544,56544,20,0,10);
INSERT INTO `guild_shops` VALUES (531,16448,240,761,20,0,20);
INSERT INTO `guild_shops` VALUES (531,16532,36503,36503,20,0,10);
INSERT INTO `guild_shops` VALUES (531,16535,509,1056,20,0,20);
INSERT INTO `guild_shops` VALUES (531,16537,25800,32680,20,0,10);    -- mythril_sword
INSERT INTO `guild_shops` VALUES (531,16565,1395,8853,20,0,15);      -- spatha
INSERT INTO `guild_shops` VALUES (531,16589,10444,67958,20,0,10);    -- two-hand._sword
INSERT INTO `guild_shops` VALUES (531,16650,18270,36987,20,5,10);    -- war_pick
INSERT INTO `guild_shops` VALUES (531,16651,66555,168606,20,2,5);    -- mythril_pick
INSERT INTO `guild_shops` VALUES (531,16768,643,677,20,0,20);        -- bronze_zaghnal
INSERT INTO `guild_shops` VALUES (531,16770,16803,24703,20,0,15);    -- zaghnal
INSERT INTO `guild_shops` VALUES (531,17034,313,917,20,0,15);        -- bronze_mace

-- Kamilah (Mhaura) Smithing Guild (S)
INSERT INTO `guild_shops` VALUES (532,640,9,20,255,48,100);
INSERT INTO `guild_shops` VALUES (532,641,30,66,255,48,100);
INSERT INTO `guild_shops` VALUES (532,643,675,1224,165,33,65);
INSERT INTO `guild_shops` VALUES (532,652,3517,22890,80,16,32);
INSERT INTO `guild_shops` VALUES (532,660,61,423,165,33,65);
INSERT INTO `guild_shops` VALUES (532,672,72,209,165,0,65);
INSERT INTO `guild_shops` VALUES (532,680,12400,12411,80,0,32);
INSERT INTO `guild_shops` VALUES (532,12706,21945,21945,20,0,15);

-- Amulya (Metalworks) Smithing Guild (S)
INSERT INTO `guild_shops` VALUES (5332,640,9,44,255,48,100);         -- copper_ore
INSERT INTO `guild_shops` VALUES (5332,641,30,66,255,48,100);        -- tin_ore
INSERT INTO `guild_shops` VALUES (5332,643,675,1656,165,33,65);      -- iron_ore
INSERT INTO `guild_shops` VALUES (5332,644,2000,10000,165,33,65);    -- mythril_ore
INSERT INTO `guild_shops` VALUES (5332,649,103,349,165,33,65);       -- bronze_ingot
INSERT INTO `guild_shops` VALUES (5332,651,2700,4680,165,33,65);     -- iron_ingot
INSERT INTO `guild_shops` VALUES (5332,660,69,294,165,33,65);        -- bronze_sheet
INSERT INTO `guild_shops` VALUES (5332,662,4050,7020,165,33,65);     -- iron_sheet
INSERT INTO `guild_shops` VALUES (5332,664,66690,66690,30,0,12);     -- darksteel_sheet
INSERT INTO `guild_shops` VALUES (5332,672,81,106,165,0,65);         -- bronze_scales
INSERT INTO `guild_shops` VALUES (5332,674,4945,12411,165,0,65);     -- iron_scales
INSERT INTO `guild_shops` VALUES (5332,676,7350,11466,80,0,32);      -- steel_scales
INSERT INTO `guild_shops` VALUES (5332,680,4725,11592,80,0,32);      -- iron_chain
INSERT INTO `guild_shops` VALUES (5332,2143,75,75,255,48,100);       -- mandrel
INSERT INTO `guild_shops` VALUES (5332,2144,75,75,255,48,100);       -- workshop_anvil
INSERT INTO `guild_shops` VALUES (5332,12299,708,2835,20,0,15);      -- aspis
INSERT INTO `guild_shops` VALUES (5332,12450,15300,15300,20,0,10);   -- padded_cap
INSERT INTO `guild_shops` VALUES (5332,12544,36855,83538,20,0,5);    -- breastplate
INSERT INTO `guild_shops` VALUES (5332,12578,61086,81086,20,0,10);   -- padded_armor
INSERT INTO `guild_shops` VALUES (5332,12672,19440,23328,20,0,15);   -- gauntlets
INSERT INTO `guild_shops` VALUES (5332,12704,191,394,20,0,20);       -- bronze_mittens
INSERT INTO `guild_shops` VALUES (5332,12706,12960,12960,20,0,15);   -- iron_mittens
INSERT INTO `guild_shops` VALUES (5332,12800,34020,69552,20,0,10);   -- cuisses
INSERT INTO `guild_shops` VALUES (5332,12832,409,818,20,0,20);       -- bronze_subligar
INSERT INTO `guild_shops` VALUES (5332,12836,19008,38565,20,0,10);   -- iron_subligar
INSERT INTO `guild_shops` VALUES (5332,12928,34927,45144,20,0,5);    -- plate_leggings
INSERT INTO `guild_shops` VALUES (5332,12962,27866,76830,20,0,5);    -- leggings
INSERT INTO `guild_shops` VALUES (5332,13080,13770,14412,20,0,10);   -- gorget
INSERT INTO `guild_shops` VALUES (5332,16406,10713,17020,20,0,10);   -- baghnakhs
INSERT INTO `guild_shops` VALUES (5332,16465,229,754,20,0,20);       -- bronze_knife
INSERT INTO `guild_shops` VALUES (5332,16467,22422,22422,20,0,10);
INSERT INTO `guild_shops` VALUES (5332,16552,8914,8914,20,0,15);
INSERT INTO `guild_shops` VALUES (5332,16558,10200,81600,20,0,10);
INSERT INTO `guild_shops` VALUES (5332,16640,622,2898,20,0,20);
INSERT INTO `guild_shops` VALUES (5332,16657,95040,314160,20,0,3);
INSERT INTO `guild_shops` VALUES (5332,16704,1323,3565,20,0,10);
INSERT INTO `guild_shops` VALUES (5332,16706,30912,90783,20,0,10);
INSERT INTO `guild_shops` VALUES (5332,17045,11970,29366,20,0,10);
INSERT INTO `guild_shops` VALUES (5332,17298,598,620,2970,0,1188);
INSERT INTO `guild_shops` VALUES (5332,17336,4,11,2970,0,1188);

-- Beugungel (Carpenter's Landing) Woodworking Guild
INSERT INTO `guild_shops` VALUES (534,688,12,30,255,48,100);
INSERT INTO `guild_shops` VALUES (534,693,640,1622,255,48,100);
INSERT INTO `guild_shops` VALUES (534,695,120,184,255,48,100);
INSERT INTO `guild_shops` VALUES (534,696,330,686,255,48,100);
INSERT INTO `guild_shops` VALUES (534,698,93,182,255,48,100);
INSERT INTO `guild_shops` VALUES (534,1021,312,500,255,48,100);
INSERT INTO `guild_shops` VALUES (534,1657,75,255,255,48,100);

-- Akamafula (Lower Jeuno) Tenshodo Merchent
INSERT INTO `guild_shops` VALUES (60417,16896,517,592,20,10,20);  		-- kunai
INSERT INTO `guild_shops` VALUES (60417,16900,1404,1608,20,7,15); 		-- wakizashi
INSERT INTO `guild_shops` VALUES (60417,16960,3121,3575,20,5,10);		-- uchigatana
INSERT INTO `guild_shops` VALUES (60417,16974,224510,697840,20,1,3);	-- dotanuki
INSERT INTO `guild_shops` VALUES (60417,16975,11583,13266,20,5,10);		-- kanesada
INSERT INTO `guild_shops` VALUES (60417,16966,1836,2103,20,10,20);		-- tachi
INSERT INTO `guild_shops` VALUES (60417,16982,4752,38670,20,0,10);		-- nodachi
INSERT INTO `guild_shops` VALUES (60417,16987,12253,14033,20,5,10);		-- okanehira
INSERT INTO `guild_shops` VALUES (60417,17265,25372,25732,20,5,10);		-- tanegashima
INSERT INTO `guild_shops` VALUES (60417,17301,43,150,2970,594,1188);	-- shuriken
INSERT INTO `guild_shops` VALUES (60417,17302,347,347,2970,594,1188);	-- juji_shuriken
INSERT INTO `guild_shops` VALUES (60417,17285,101745,101745,20,1,5);	-- Moonring Blade 
INSERT INTO `guild_shops` VALUES (60417,12456,552,858,20,10,20);		-- hachimaki
INSERT INTO `guild_shops` VALUES (60417,12457,3272,5079,20,7,15);		-- cotton_hachimaki
INSERT INTO `guild_shops` VALUES (60417,12458,8972,13927,20,5,10);		-- soil_hachimaki
INSERT INTO `guild_shops` VALUES (60417,13111,20061,29942,20,5,10);		-- nodowa
INSERT INTO `guild_shops` VALUES (60417,13088,43890,52440,20,1,3);      -- darksteel_Nodowa
INSERT INTO `guild_shops` VALUES (60417,12584,833,1294,20,10,20);		-- kenpogi
INSERT INTO `guild_shops` VALUES (60417,12585,4931,7654,20,7,15);		-- cotton_dogi
INSERT INTO `guild_shops` VALUES (60417,12586,13266,14850,20,5,10);		-- soil_gi
INSERT INTO `guild_shops` VALUES (60417,12712,458,712,20,10,20);		-- tekko		
INSERT INTO `guild_shops` VALUES (60417,12713,2528,3924,20,7,15);		-- cotton_tekko
INSERT INTO `guild_shops` VALUES (60417,12714,2713,8316,20,5,10);		-- soil_tekko
INSERT INTO `guild_shops` VALUES (60417,12840,666,1034,20,10,20);		-- sitabaki
INSERT INTO `guild_shops` VALUES (60417,12841,3951,8847,20,7,15);		-- cotton_sitabaki
INSERT INTO `guild_shops` VALUES (60417,12842,2713,8316,20,5,10);		-- soil_sitabaki
INSERT INTO `guild_shops` VALUES (60417,12968,424,660,20,10,20);		-- kyahan
INSERT INTO `guild_shops` VALUES (60417,12969,2528,11925,20,7,15);		-- cotton_kyahan	
INSERT INTO `guild_shops` VALUES (60417,12970,11071,12393,20,5,10);		-- soil_kyahan

-- Blabbivix (Port Bastok) / Gaudylox (Northern San dOria) / Scavnix (Windurst Walls) (Chip Vendors pseudo guild shop)
INSERT INTO `guild_shops` VALUES (60418,474,21000,21000,255,255,255);
INSERT INTO `guild_shops` VALUES (60418,475,21000,21000,255,255,255);
INSERT INTO `guild_shops` VALUES (60418,476,21000,21000,255,255,255);
INSERT INTO `guild_shops` VALUES (60418,477,21000,21000,255,255,255);
INSERT INTO `guild_shops` VALUES (60418,478,21000,21000,255,255,255);
INSERT INTO `guild_shops` VALUES (60418,479,21000,21000,255,255,255);
INSERT INTO `guild_shops` VALUES (60418,480,21000,21000,255,255,255);
INSERT INTO `guild_shops` VALUES (60418,481,21000,21000,255,255,255);

-- Jabbar (Port Bastok) Tenshodo Merchant
INSERT INTO `guild_shops` VALUES (60419,704,96,149,255,48,100);
INSERT INTO `guild_shops` VALUES (60419,657,4690,10500,165,33,65);
INSERT INTO `guild_shops` VALUES (60419,4928,1561,1747,30,6,12);
INSERT INTO `guild_shops` VALUES (60419,4934,1561,1747,30,6,12);
INSERT INTO `guild_shops` VALUES (60419,4937,1561,1747,30,6,12);
INSERT INTO `guild_shops` VALUES (60419,4943,1561,1747,30,6,12);
INSERT INTO `guild_shops` VALUES (60419,4878,37800,41370,30,6,12);
INSERT INTO `guild_shops` VALUES (60419,4879,14070,15750,30,6,12);
INSERT INTO `guild_shops` VALUES (60419,4880,14070,15750,30,6,12);
INSERT INTO `guild_shops` VALUES (60419,1554,431,512,255,48,100);
INSERT INTO `guild_shops` VALUES (60419,1555,1061,1259,255,48,100);
INSERT INTO `guild_shops` VALUES (60419,1590,536,700,255,48,100);
INSERT INTO `guild_shops` VALUES (60419,1475,579,1188,255,48,100);
INSERT INTO `guild_shops` VALUES (60419,5164,1945,2854,255,48,100);
INSERT INTO `guild_shops` VALUES (60419,1652,150,160,255,48,100);
INSERT INTO `guild_shops` VALUES (60419,1164,30,120,2970,0,1188);
INSERT INTO `guild_shops` VALUES (60419,4874,39270,41370,15,0,6);
INSERT INTO `guild_shops` VALUES (60419,4876,39270,41370,15,0,6);
INSERT INTO `guild_shops` VALUES (60419,4877,39270,41370,15,0,6);
INSERT INTO `guild_shops` VALUES (60419,5236,509,525,255,48,100);

-- Silver Owl (Port Bastok) Tenshodo Merchant
INSERT INTO `guild_shops` VALUES (60420,16896,517,592,20,10,20);     -- Kunai
INSERT INTO `guild_shops` VALUES (60420,16919,2728,17167,20,7,15);   -- Shinobi Gatana
INSERT INTO `guild_shops` VALUES (60420,16975,11583,13266,20,5,10);  -- Kanesada
INSERT INTO `guild_shops` VALUES (60420,16966,1836,2103,20,7,15);    -- Tachi
INSERT INTO `guild_shops` VALUES (60420,16988,14676,16808,20,7,15);  -- Kotetsu
INSERT INTO `guild_shops` VALUES (60420,12456,552,858,20,10,20);     -- Hachimaki
INSERT INTO `guild_shops` VALUES (60420,12457,3272,5079,20,7,15);    -- Cotton Hachimaki
INSERT INTO `guild_shops` VALUES (60420,13111,20061,29942,20,5,10);  -- Nodowa
INSERT INTO `guild_shops` VALUES (60420,13088,43890,52440,20,1,3);   -- Darksteel Nodowa
INSERT INTO `guild_shops` VALUES (60420,12584,833,1294,20,10,20);    -- Kenpogi
INSERT INTO `guild_shops` VALUES (60420,12585,4931,7654,20,7,15);    -- Cotton Dogi
INSERT INTO `guild_shops` VALUES (60420,12712,458,712,20,10,20);     -- Tekko
INSERT INTO `guild_shops` VALUES (60420,12713,2528,3924,20,7,15);    -- Cotton Tekko 
INSERT INTO `guild_shops` VALUES (60420,12840,666,1034,20,10,20);    -- Sitabaki
INSERT INTO `guild_shops` VALUES (60420,12841,3951,8847,20,10,20);   -- Cotton Sitabaki
INSERT INTO `guild_shops` VALUES (60420,12968,424,660,20,10,20);     -- Kyahan
INSERT INTO `guild_shops` VALUES (60420,12969,2528,11925,20,7,15);    -- Cotton Kyahan
INSERT INTO `guild_shops` VALUES (60420,16405,104,225,20,0,20);
INSERT INTO `guild_shops` VALUES (60420,17314,7333,7446,15,0,6);

-- Achika (Norg) Tenshodo Merchant
INSERT INTO `guild_shops` VALUES (60421,12456,552,858,20,10,20);	-- Hachimaki
INSERT INTO `guild_shops` VALUES (60421,12457,3272,5079,20,7,15);	-- Cotton Hachimaki
INSERT INTO `guild_shops` VALUES (60421,12458,8972,13927,20,5,10);	-- Soil Hachimaki 
INSERT INTO `guild_shops` VALUES (60421,13111,20061,29942,20,5,10);	-- Nodowa
INSERT INTO `guild_shops` VALUES (60421,13088,43890,52440,20,1,3);	-- Darksteel Nodowa
INSERT INTO `guild_shops` VALUES (60421,12584,833,1294,20,10,20);	-- Kenpogi
INSERT INTO `guild_shops` VALUES (60421,12585,4931,7654,20,7,15);	-- Cotton Dogi
INSERT INTO `guild_shops` VALUES (60421,12586,13266,14850,20,5,10); -- Soil Gi
INSERT INTO `guild_shops` VALUES (60421,12712,458,712,20,10,20);	-- Tekko
INSERT INTO `guild_shops` VALUES (60421,12713,2528,3924,20,7,15);   -- Cotton Tekko
INSERT INTO `guild_shops` VALUES (60421,12714,2713,8316,20,5,10);	-- Soil Tekko
INSERT INTO `guild_shops` VALUES (60421,12840,666,1034,20,10,20);	-- Sitabaki
INSERT INTO `guild_shops` VALUES (60421,12841,3951,8847,20,7,15);	-- Cotton Sitabaki
INSERT INTO `guild_shops` VALUES (60421,12842,2713,8316,20,5,10);	-- Soil Sitabaki
INSERT INTO `guild_shops` VALUES (60421,12968,424,660,20,10,20);	-- Kyahan
INSERT INTO `guild_shops` VALUES (60421,12969,2830,11925,20,7,15);	-- Cotton Kyahan
INSERT INTO `guild_shops` VALUES (60421,12970,11071,12393,20,5,10);	-- Soil Kyahan

-- Chiyo (Norg) Tenshodo Merchant
INSERT INTO `guild_shops` VALUES (60422,4876,41370,41370,15,3,6);	-- Absorb VIT
INSERT INTO `guild_shops` VALUES (60422,4879,14070,15750,30,6,12);	-- Absorb MND
INSERT INTO `guild_shops` VALUES (60422,4880,14070,15750,30,6,12);	-- Absorb CHR
INSERT INTO `guild_shops` VALUES (60422,4928,1561,1747,30,6,12);	-- Katon Ichi
INSERT INTO `guild_shops` VALUES (60422,4931,1561,1747,30,6,12);	-- Hyton Ichi
INSERT INTO `guild_shops` VALUES (60422,4934,1561,1747,30,6,12);	-- Huton Ichi
INSERT INTO `guild_shops` VALUES (60422,4937,1561,1747,30,6,12);	-- Doton Ichi
INSERT INTO `guild_shops` VALUES (60422,4940,1561,1747,30,6,12);	-- Raiton Ichi
INSERT INTO `guild_shops` VALUES (60422,4943,1561,1747,30,6,12);	-- Suiton Ichi
INSERT INTO `guild_shops` VALUES (60422,4877,39270,41370,15,3,6);	-- Absorb AGI
INSERT INTO `guild_shops` VALUES (60422,4878,37800,41370,30,6,12);	-- Absorb INT


-- Jirokichi (Norg) Tenshodo Merchant
INSERT INTO `guild_shops` VALUES (60423,16406,14428,35251,20,5,10);		-- baghnakhs
INSERT INTO `guild_shops` VALUES (60423,16411,11746,46986,20,5,10);		-- claws
INSERT INTO `guild_shops` VALUES (60423,16419,76419,168396,20,5,10);	-- patas
INSERT INTO `guild_shops` VALUES (60423,16896,517,592,20,10,20);		-- kunai
INSERT INTO `guild_shops` VALUES (60423,16917,4226,4226,20,7,15);		-- suzume
INSERT INTO `guild_shops` VALUES (60423,16900,1404,1608,20,7,15);		-- wakizashi
INSERT INTO `guild_shops` VALUES (60423,16919,2728,17167,20,7,15);		-- shinobi-gatana
INSERT INTO `guild_shops` VALUES (60423,16960,3121,3575,20,7,15);		-- uchigatana
INSERT INTO `guild_shops` VALUES (60423,16975,11583,13266,20,5,10);		-- kanesada
INSERT INTO `guild_shops` VALUES (60423,16966,1836,2103,20,10,20);		-- tachi
INSERT INTO `guild_shops` VALUES (60423,16982,4752,38670,20,5,10);		-- nodachi
INSERT INTO `guild_shops` VALUES (60423,16987,12253,14033,20,5,10);		-- okanehira
INSERT INTO `guild_shops` VALUES (60423,16988,14676,16808,20,5,10);		-- kotetsu
INSERT INTO `guild_shops` VALUES (60423,17802,189945,464059,20,2,3);	-- kiku-ichimonji
INSERT INTO `guild_shops` VALUES (60423,16871,183516,404395,20,2,3);	-- kamayari
INSERT INTO `guild_shops` VALUES (60423,17259,72144,158976,20,5,10);	-- pirates_gun
INSERT INTO `guild_shops` VALUES (60423,17301,43,150,2970,594,1188);	-- shuriken	
INSERT INTO `guild_shops` VALUES (60423,17302,347,347,2970,594,1188);	-- Juji Shuriken
INSERT INTO `guild_shops` VALUES (60423,17303,7333,7446,2970,594,1188); -- Manji Shuriken
INSERT INTO `guild_shops` VALUES (60423,17285,101745,101745,20,1,5);	-- Moonring Blade 
INSERT INTO `guild_shops` VALUES (60423,17314,7333,7446,15,3,6);		-- quake_grenade
INSERT INTO `guild_shops` VALUES (60423,17320,7,18,2970,594,1188);		-- iron_arrow
INSERT INTO `guild_shops` VALUES (60423,17322,128,330,2970,594,1188);	-- fire_arrow
INSERT INTO `guild_shops` VALUES (60423,17340,58,174,2970,594,1188);	-- bullet

-- Vuliaie (Norg) Tenshodo Merchant
INSERT INTO `guild_shops` VALUES (60424,704,96,149,375,75,150);			-- bamboo_stick
INSERT INTO `guild_shops` VALUES (60424,915,2700,16120,165,33,165);		-- Toad Oil
INSERT INTO `guild_shops` VALUES (60424,1134,810,2095,255,48,100);		-- sheet_of_bast_parchment
INSERT INTO `guild_shops` VALUES (60424,1155,436,645,165,33,165);		-- handful_of_iron_sand
INSERT INTO `guild_shops` VALUES (60424,657,4690,21000,165,33,65);		-- lump_of_tama-hagane
INSERT INTO `guild_shops` VALUES (60424,1415,55147,55147,165,33,65);	-- pot_of_urushi
INSERT INTO `guild_shops` VALUES (60424,1161,66,174,2970,594,1188);		-- uchitake
INSERT INTO `guild_shops` VALUES (60424,1164,30,120,2970,594,1188);		-- tsurara
INSERT INTO `guild_shops` VALUES (60424,1167,58,107,2970,594,1188);		-- kawahori-ogi
INSERT INTO `guild_shops` VALUES (60424,1170,58,107,2970,594,1188);		-- makibishi
INSERT INTO `guild_shops` VALUES (60424,1173,56,174,2970,594,1188);		-- hiraishin
INSERT INTO `guild_shops` VALUES (60424,1176,44,174,2970,594,1188);		-- mizu-deppo
INSERT INTO `guild_shops` VALUES (60424,1472,369,369,255,48,100);		-- gardenia_seed
INSERT INTO `guild_shops` VALUES (60424,1554,431,512,255,48,100);		-- onz_of_turmeric
INSERT INTO `guild_shops` VALUES (60424,1555,1061,1259,255,48,100);		-- onz_of_coriander
INSERT INTO `guild_shops` VALUES (60424,1590,536,700,255,48,100);		-- sprig_of_holy_basil
INSERT INTO `guild_shops` VALUES (60424,1475,579,1188,255,48,100);		-- onz_of_curry_powder
INSERT INTO `guild_shops` VALUES (60424,5164,1945,2854,255,48,100);		-- jar_of_ground_wasabi
INSERT INTO `guild_shops` VALUES (60424,1652,233,250,255,48,100);		-- bottle_of_rice_vinegar
INSERT INTO `guild_shops` VALUES (60424,5235,1284,1350,255,48,100);		-- head_of_napa

-- Wahraga (Alchemy Guild) Aht Urhgan Whitegate
INSERT INTO `guild_shops` VALUES (60425,16430,13392,93744,20,0,10);		-- acid_claws
INSERT INTO `guild_shops` VALUES (60425,17605,7725,54075,20,0,10);		-- acid_dagger
INSERT INTO `guild_shops` VALUES (60425,16501,84716,84716,20,0,10);		-- acid_knife
INSERT INTO `guild_shops` VALUES (60425,937,135,945,165,0,65);      	-- animal_glue
INSERT INTO `guild_shops` VALUES (60425,4148,486,1124,165,0,65);      	-- antidote
INSERT INTO `guild_shops` VALUES (60425,1109,930,4563,255,0,100);     	-- artificial_lens
INSERT INTO `guild_shops` VALUES (60425,922,300,300,255,0,100);       	-- bat_wing
INSERT INTO `guild_shops` VALUES (60425,18228,114,114,2970,0,1188);		-- battery
INSERT INTO `guild_shops` VALUES (60425,16572,5781,5781,20,0,10);		-- bee_spatha
INSERT INTO `guild_shops` VALUES (60425,912,192,360,255,0,100);       	-- beehive_chip
INSERT INTO `guild_shops` VALUES (60425,913,135,945,165,0,65);      	-- lump_of_beeswax
INSERT INTO `guild_shops` VALUES (60425,929,1875,6900,80,0,32);       	-- black_ink
INSERT INTO `guild_shops` VALUES (60425,16454,1904,1904,20,0,15);		-- blind_dagger
INSERT INTO `guild_shops` VALUES (60425,16471,519,3024,20,0,10);		-- blind_knife
INSERT INTO `guild_shops` VALUES (60425,928,1004,2513,165,0,65);     	-- bomb_ash
INSERT INTO `guild_shops` VALUES (60425,17343,12,84,8910,0,3564);		-- bronze_bullet
INSERT INTO `guild_shops` VALUES (60425,17340,392,392,8910,0,3564);		-- bullet
INSERT INTO `guild_shops` VALUES (60425,932,1020,1080,165,0,65);      	-- carbon_fiber
INSERT INTO `guild_shops` VALUES (60425,931,19520,19520,15,0,6);      	-- cermet_chunk
INSERT INTO `guild_shops` VALUES (60425,636,97,369,255,48,100);      -- chamomile
INSERT INTO `guild_shops` VALUES (60425,4443,114,153,255,48,100);	 -- cobalt_jellyfish
INSERT INTO `guild_shops` VALUES (60425,621,21,40,255,0,100);         	-- crying_mustard
INSERT INTO `guild_shops` VALUES (60425,4166,750,4200,165,0,65);     	-- flask_of_deodorizer
INSERT INTO `guild_shops` VALUES (60425,4509,9,58,375,0,150);			-- flask_of_distilled_water
INSERT INTO `guild_shops` VALUES (60425,622,36,51,255,48,100);       -- dried_marjoram
INSERT INTO `guild_shops` VALUES (60425,17322,63,441,8910,0,3564);		-- fire_arrow
INSERT INTO `guild_shops` VALUES (60425,16543,5940,41580,20,0,3);		-- fire_sword
INSERT INTO `guild_shops` VALUES (60425,947,3449,19532,55,0,22);      	-- firesand
INSERT INTO `guild_shops` VALUES (60425,16564,34875,244125,20,0,3);		-- flame_blade
INSERT INTO `guild_shops` VALUES (60425,16588,4374,30618,20,0,3);		-- flame_claymore
INSERT INTO `guild_shops` VALUES (60425,16522,25200,176400,20,0,3);		-- flame_degen
INSERT INTO `guild_shops` VALUES (60425,925,1012,4017,55,0,22);      	-- giant_stinger
INSERT INTO `guild_shops` VALUES (60425,933,600,3040,165,0,65);      	-- glass_fiber
INSERT INTO `guild_shops` VALUES (60425,17313,774,5418,8910,0,3564);	-- grenade
INSERT INTO `guild_shops` VALUES (60425,16523,25200,176400,20,0,3);		-- holy_degen
INSERT INTO `guild_shops` VALUES (60425,17041,60178,60178,20,0,3);		-- holy_mace
INSERT INTO `guild_shops` VALUES (60425,16581,33368,167872,20,0,3);		-- holy_sword
INSERT INTO `guild_shops` VALUES (60425,4154,5250,5250,55,0,22);     	-- holy_water
INSERT INTO `guild_shops` VALUES (60425,18232,114,114,2970,0,1188);		-- hydro_pump
INSERT INTO `guild_shops` VALUES (60425,17323,242,242,8910,0,3564);		-- ice_arrow
INSERT INTO `guild_shops` VALUES (60425,16709,1569,10983,20,0,3);		-- inferno_axe
INSERT INTO `guild_shops` VALUES (60425,16594,15696,109872,20,0,3);		-- inferno_sword
INSERT INTO `guild_shops` VALUES (60425,17324,63,441,8910,0,3564);		-- lightning_arrow
INSERT INTO `guild_shops` VALUES (60425,920,1084,5899,165,48,65);     -- malboro_vine
INSERT INTO `guild_shops` VALUES (60425,914,1125,4320,165,33,65);     -- mercury
INSERT INTO `guild_shops` VALUES (60425,16410,9504,66528,20,0,5);		-- psn._baghnakhs
INSERT INTO `guild_shops` VALUES (60425,16458,4980,34860,20,0,5);		-- poison_baselard
INSERT INTO `guild_shops` VALUES (60425,16387,13471,33886,20,0,10);		-- poison_cesti
INSERT INTO `guild_shops` VALUES (60425,16417,10800,75600,20,0,10);		-- poison_claws
INSERT INTO `guild_shops` VALUES (60425,16496,4464,31248,20,0,10);		-- poison_dagger
INSERT INTO `guild_shops` VALUES (60425,943,246,1305,255,0,100);      	-- poison_dust
INSERT INTO `guild_shops` VALUES (60425,16403,108218,108218,20,0,3);	-- poison_katars
INSERT INTO `guild_shops` VALUES (60425,16472,13020,13020,20,0,3);		-- poison_knife
INSERT INTO `guild_shops` VALUES (60425,16478,19148,19148,20,0,5);		-- poison_kukri
INSERT INTO `guild_shops` VALUES (60425,4157,800,2240,80,0,32);     	-- flask_of_poison_potion
INSERT INTO `guild_shops` VALUES (60425,4164,1050,3304,165,0,65);     	-- prism_powder
INSERT INTO `guild_shops` VALUES (60425,17315,2970,20790,8910,0,3564);	-- riot_grenade
INSERT INTO `guild_shops` VALUES (60425,638,138,777,255,48,100);    	 -- sage
INSERT INTO `guild_shops` VALUES (60425,16429,3711,25977,20,0,5);		-- slc._baghnakhs
INSERT INTO `guild_shops` VALUES (60425,16495,9906,9906,20,0,10);		-- silence_dagger
INSERT INTO `guild_shops` VALUES (60425,4162,675,4725,80,0,32);     	-- silencing_potion
INSERT INTO `guild_shops` VALUES (60425,4165,1870,1870,165,0,65);      	-- silent_oil
INSERT INTO `guild_shops` VALUES (60425,17341,392,392,2970,0,1188);		-- silver_bullet
INSERT INTO `guild_shops` VALUES (60425,637,1870,1870,165,0,65);      	-- slime_oil
INSERT INTO `guild_shops` VALUES (60425,1108,573,765,255,48,100);   	 -- sulfur
INSERT INTO `guild_shops` VALUES (60425,2131,75,242,255,48,100);      -- triturator
INSERT INTO `guild_shops` VALUES (60425,4171,360,2284,80,0,100);		-- flask_of_vitriol
INSERT INTO `guild_shops` VALUES (60425,16600,300,2100,20,0,3);			-- wax_sword
INSERT INTO `guild_shops` VALUES (60425,951,90,95,255,48,100);       -- wijnruit
INSERT INTO `guild_shops` VALUES (60425,18236,21,21,2970,48,1188);	 -- wind_fan
INSERT INTO `guild_shops` VALUES (60425,2229,3744,3744,80,0,100);		-- chimera_blood
INSERT INTO `guild_shops` VALUES (60425,2171,1231,4250,80,0,100);		-- colibri_beak
INSERT INTO `guild_shops` VALUES (60425,2175,156,1092,80,0,100);		-- flan_meat
INSERT INTO `guild_shops` VALUES (60425,2309,963,963,80,0,100);			-- homncl._nerves
INSERT INTO `guild_shops` VALUES (60425,2301,6,6,80,0,100);				-- polyflan
INSERT INTO `guild_shops` VALUES (60425,2159,111,777,80,0,100);			-- qutrub_bandage

-- Wahnid (Fishing Guild) Aht Urhgan Whitegate
INSERT INTO `guild_shops` VALUES (60426,2216,1045,1045,255,0,100);
INSERT INTO `guild_shops` VALUES (60426,4426,364,728,255,0,100);
INSERT INTO `guild_shops` VALUES (60426,4428,192,272,255,0,100);
INSERT INTO `guild_shops` VALUES (60426,4451,3540,16000,30,0,12);
INSERT INTO `guild_shops` VALUES (60426,4470,4369,4369,55,0,22);
INSERT INTO `guild_shops` VALUES (60426,4471,12544,12544,55,0,22);
INSERT INTO `guild_shops` VALUES (60426,4472,30,48,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,4477,8000,8000,30,0,12);
INSERT INTO `guild_shops` VALUES (60426,4485,10080,13328,30,0,12);
INSERT INTO `guild_shops` VALUES (60426,5134,89700,89700,6,0,2);
INSERT INTO `guild_shops` VALUES (60426,5140,74256,74256,6,0,2);
INSERT INTO `guild_shops` VALUES (60426,5141,7992,7992,15,0,6);
INSERT INTO `guild_shops` VALUES (60426,5447,21,128,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,5448,2652,7072,165,0,65);
INSERT INTO `guild_shops` VALUES (60426,5449,21,21,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,5453,4560,5952,80,16,32);
INSERT INTO `guild_shops` VALUES (60426,5454,5130,25920,80,16,32);
INSERT INTO `guild_shops` VALUES (60426,5456,1503,1503,165,0,65);
INSERT INTO `guild_shops` VALUES (60426,5458,900,900,255,0,100);
INSERT INTO `guild_shops` VALUES (60426,5459,1350,1350,255,0,100);
INSERT INTO `guild_shops` VALUES (60426,5460,3487,11532,165,0,65);
INSERT INTO `guild_shops` VALUES (60426,16992,52,254,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,16993,52,254,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,16994,52,254,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,16996,52,254,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,16997,52,254,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,16998,30,184,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,16999,52,254,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,17000,52,254,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,17380,25740,25740,30,5,5);
INSERT INTO `guild_shops` VALUES (60426,17382,9657,9657,30,5,10);
INSERT INTO `guild_shops` VALUES (60426,17383,1980,1980,30,10,20);
INSERT INTO `guild_shops` VALUES (60426,17387,4077,4077,30,5,15);
INSERT INTO `guild_shops` VALUES (60426,17388,934,934,30,10,20);
INSERT INTO `guild_shops` VALUES (60426,17389,332,332,30,10,20);
INSERT INTO `guild_shops` VALUES (60426,17390,145,145,30,10,20);
INSERT INTO `guild_shops` VALUES (60426,17391,44,44,30,10,20);
INSERT INTO `guild_shops` VALUES (60426,17392,213,283,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,17393,213,283,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,17394,220,300,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,17395,8,9,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,17396,3,8,255,48,100);
INSERT INTO `guild_shops` VALUES (60426,17399,2394,2394,20,6,12);
INSERT INTO `guild_shops` VALUES (60426,17404,540,540,20,6,12);
INSERT INTO `guild_shops` VALUES (60426,17405,540,540,20,6,12);
INSERT INTO `guild_shops` VALUES (60426,17407,303,303,20,6,12);

-- Ndego (Smithing Guild) Al Zahbi
INSERT INTO `guild_shops` VALUES (60427,640,9,36,255,48,100);
INSERT INTO `guild_shops` VALUES (60427,641,30,43,255,48,100);
INSERT INTO `guild_shops` VALUES (60427,643,675,2700,165,33,65);
INSERT INTO `guild_shops` VALUES (60427,649,288,349,165,33,65);
INSERT INTO `guild_shops` VALUES (60427,651,2700,3060,165,33,65);
INSERT INTO `guild_shops` VALUES (60427,660,69,294,165,33,65);
INSERT INTO `guild_shops` VALUES (60427,662,4050,9898,165,33,65);
INSERT INTO `guild_shops` VALUES (60427,2143,320,320,255,48,100);
INSERT INTO `guild_shops` VALUES (60427,2144,75,75,255,48,100);

-- Dehbi Moshal (Woodworking Guild) Al Zahbi
INSERT INTO `guild_shops` VALUES (60428,23,829,2035,20,0,15);
INSERT INTO `guild_shops` VALUES (60428,688,15,30,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,689,27,59,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,690,1401,10295,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,691,45,192,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,693,640,2459,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,694,2119,4182,165,33,65);
INSERT INTO `guild_shops` VALUES (60428,695,120,184,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,696,330,686,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,697,528,930,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,698,72,86,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,699,4740,29072,165,33,65);
INSERT INTO `guild_shops` VALUES (60428,700,9075,10103,165,33,65);
INSERT INTO `guild_shops` VALUES (60428,701,6615,18345,165,33,65);
INSERT INTO `guild_shops` VALUES (60428,702,9600,45568,165,33,65);
INSERT INTO `guild_shops` VALUES (60428,704,108,248,375,100,150);
INSERT INTO `guild_shops` VALUES (60428,705,7,18,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,706,27,97,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,707,1723,1838,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,708,45,276,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,710,2119,2543,165,33,65);
INSERT INTO `guild_shops` VALUES (60428,712,120,256,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,713,330,426,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,714,607,2559,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,715,72,215,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,716,4740,26544,165,33,65);
INSERT INTO `guild_shops` VALUES (60428,721,704,2465,255,48,100);
INSERT INTO `guild_shops` VALUES (60428,17318,6,13,8910,0,3564);
INSERT INTO `guild_shops` VALUES (60428,17320,21,26,5940,0,2376);
INSERT INTO `guild_shops` VALUES (60428,17321,48,60,2970,0,1188);

-- Bornahn (Goldsmithing Guild) Al Zahbi
INSERT INTO `guild_shops` VALUES (60429,640,9,36,255,48,100);
INSERT INTO `guild_shops` VALUES (60429,644,1500,6000,165,0,65);
INSERT INTO `guild_shops` VALUES (60429,673,210,600,255,48,100);
INSERT INTO `guild_shops` VALUES (60429,681,10500,16000,30,6,12);
INSERT INTO `guild_shops` VALUES (60429,736,315,945,255,48,100);
INSERT INTO `guild_shops` VALUES (60429,769,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (60429,770,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (60429,771,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (60429,772,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (60429,773,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (60429,774,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (60429,775,1400,4200,165,33,65);
INSERT INTO `guild_shops` VALUES (60429,776,1400,4200,165,0,65);
INSERT INTO `guild_shops` VALUES (60429,795,1396,2794,80,16,32);
INSERT INTO `guild_shops` VALUES (60429,796,1396,2794,80,0,32);
INSERT INTO `guild_shops` VALUES (60429,799,1396,2794,80,16,32);
INSERT INTO `guild_shops` VALUES (60429,800,1396,2794,80,0,32);
INSERT INTO `guild_shops` VALUES (60429,806,1396,2794,80,16,32);
INSERT INTO `guild_shops` VALUES (60429,807,1396,2794,80,0,32);
INSERT INTO `guild_shops` VALUES (60429,809,1396,2794,80,0,32);
INSERT INTO `guild_shops` VALUES (60429,814,1396,2794,80,0,32);
INSERT INTO `guild_shops` VALUES (60429,2144,75,75,255,48,100);
INSERT INTO `guild_shops` VALUES (60429,13446,21060,21060,20,0,10);

-- Taten-Bilten (Clothcraft Guild) Al Zahbi
INSERT INTO `guild_shops` VALUES (60430,847,14,40,375,0,150);        	-- bird_feather
INSERT INTO `guild_shops` VALUES (60430,13577,15190,42134,20,0,10);		-- black_cape
INSERT INTO `guild_shops` VALUES (60430,12739,37862,172339,20,0,5);		-- black_mitts
INSERT INTO `guild_shops` VALUES (60430,18865,5175,36225,20,0,5);		-- black_slacks
INSERT INTO `guild_shops` VALUES (60430,12609,7767,54369,20,0,5);		-- black_tunic
INSERT INTO `guild_shops` VALUES (60430,12722,29406,29406,20,0,5);		-- bracers
INSERT INTO `guild_shops` VALUES (60430,12848,4093,5486,20,0,5);		-- bias
INSERT INTO `guild_shops` VALUES (60430,13583,318,1683,20,0,20);		-- cape
INSERT INTO `guild_shops` VALUES (60430,12610,7866,55062,20,0,20);		-- cloak
INSERT INTO `guild_shops` VALUES (60430,12849,1800,12600,20,0,20);		-- cotton_brais
INSERT INTO `guild_shops` VALUES (60430,13584,12386,12386,20,0,20);		-- cotton_cape
INSERT INTO `guild_shops` VALUES (60430,825,480,2432,80,16,32);      -- cotton_cloth
INSERT INTO `guild_shops` VALUES (60430,12593,66992,66992,20,0,10);   	-- cotton_doublet
INSERT INTO `guild_shops` VALUES (60430,12977,2316,16212,20,0,10);   	-- cotton_giaters
INSERT INTO `guild_shops` VALUES (60430,12721,1674,11718,20,0,10);   	-- cotton_gloves
INSERT INTO `guild_shops` VALUES (60430,12498,1800,12600,20,0,10);   	-- cotton_headband
INSERT INTO `guild_shops` VALUES (60430,12465,35315,35135,20,0,10);   	-- cotton_doublet
INSERT INTO `guild_shops` VALUES (60430,818,312,582,255,48,100);     -- cotton_thread
INSERT INTO `guild_shops` VALUES (60430,839,280,624,255,48,100);    	-- crawler_cocoon
INSERT INTO `guild_shops` VALUES (60430,12728,246,644,20,0,10);   	 	-- cuffs
INSERT INTO `guild_shops` VALUES (60430,12592,5325,13066,20,0,10);   	-- doublet
INSERT INTO `guild_shops` VALUES (60430,13075,372,2604,20,0,10);   		-- feather_collar
INSERT INTO `guild_shops` VALUES (60430,835,187,430,375,75,100);     -- flax_flower
INSERT INTO `guild_shops` VALUES (60430,12499,14160,78080,20,0,5);    	-- flax_headband
INSERT INTO `guild_shops` VALUES (60430,12976,2538,5188,20,0,15);		-- gaiters
INSERT INTO `guild_shops` VALUES (60430,12594,11250,78750,20,0,15);		-- gambison
INSERT INTO `guild_shops` VALUES (60430,842,687,4809,55,0,22);      	-- giant_bird_feather
INSERT INTO `guild_shops` VALUES (60430,12720,2787,7391,20,0,15);    	-- gloves
INSERT INTO `guild_shops` VALUES (60430,823,18240,95760,165,33,65);  -- gold_thread
INSERT INTO `guild_shops` VALUES (60430,824,240,588,80,16,32);       -- grass_cloth
INSERT INTO `guild_shops` VALUES (60430,817,58,146,255,48,100);      -- grass_thread
INSERT INTO `guild_shops` VALUES (60430,12464,1452,5468,20,0,20);     	-- headgear
INSERT INTO `guild_shops` VALUES (60430,13085,972,4838,20,0,20);     	-- hemp_gorget
INSERT INTO `guild_shops` VALUES (60430,12850,7875,55125,20,0,20);     	-- hose
INSERT INTO `guild_shops` VALUES (60430,826,5970,14400,80,0,32);    	-- linen_cloth
INSERT INTO `guild_shops` VALUES (60430,12729,1569,10983,20,0,15);   	-- linen_cuffs
INSERT INTO `guild_shops` VALUES (60430,13750,87178,87178,20,0,10);		-- linen_doublet
INSERT INTO `guild_shops` VALUES (60430,12738,3726,26082,20,0,15);   	-- linen_mitts
INSERT INTO `guild_shops` VALUES (60430,12601,14684,14684,20,0,15);   	-- linen_robe
INSERT INTO `guild_shops` VALUES (60430,12866,8487,59409,20,0,15);   	-- linen_slacks
INSERT INTO `guild_shops` VALUES (60430,12857,336,2352,20,0,15);   		-- linen_slops
INSERT INTO `guild_shops` VALUES (60430,819,750,750,255,0,100);     	-- linen_thread
INSERT INTO `guild_shops` VALUES (60430,12736,1290,3196,20,0,15);     	-- mitts
INSERT INTO `guild_shops` VALUES (60430,833,15,90,375,75,150);       -- moko_grass
INSERT INTO `guild_shops` VALUES (60430,821,5940,41580,32,0,12);     	-- rainbow_thread
INSERT INTO `guild_shops` VALUES (60430,12466,23200,39400,20,0,10);   	-- red_cap
INSERT INTO `guild_shops` VALUES (60430,13586,94960,94960,20,0,10);   	-- red_cape
INSERT INTO `guild_shops` VALUES (60430,12600,424,1046,20,0,20);      	-- robe
INSERT INTO `guild_shops` VALUES (60430,834,80,200,255,48,100);      -- saruta_cotton
INSERT INTO `guild_shops` VALUES (60430,13568,5100,5100,20,0,10);   	-- scarelet_ribbon
INSERT INTO `guild_shops` VALUES (60430,832,675,855,255,48,100);    -- sheep_wool
INSERT INTO `guild_shops` VALUES (60430,829,4725,33075,32,0,12);     	-- silk_cloth
INSERT INTO `guild_shops` VALUES (60430,816,710,3865,255,48,100);    -- silk_thread
INSERT INTO `guild_shops` VALUES (60430,822,685,3000,255,48,100);     -- silver_thread
INSERT INTO `guild_shops` VALUES (60430,12864,4562,4562,20,0,10);   	-- slacks
INSERT INTO `guild_shops` VALUES (60430,12856,372,936,20,0,20);			-- slops
INSERT INTO `guild_shops` VALUES (60430,12978,21000,147000,20,0,20);	-- socks
INSERT INTO `guild_shops` VALUES (60430,838,9438,34557,55,0,22);      	-- spider_web
INSERT INTO `guild_shops` VALUES (60430,2128,75,80,375,75,150);      -- spindle
INSERT INTO `guild_shops` VALUES (60430,12608,1260,8820,20,0,20);      	-- tunic
INSERT INTO `guild_shops` VALUES (60430,828,25520,25520,32,0,12);     	-- velvet_cloth
INSERT INTO `guild_shops` VALUES (60430,12731,36192,36192,20,0,20);     -- velvet_cuffs
INSERT INTO `guild_shops` VALUES (60430,12475,12852,89964,20,0,20);     -- velvet_hat
INSERT INTO `guild_shops` VALUES (60430,12603,19152,134064,20,0,20);    -- velvet_robe
INSERT INTO `guild_shops` VALUES (60430,12859,15624,109368,20,0,20);    -- velvet_slops
INSERT INTO `guild_shops` VALUES (60430,13322,1728,12096,20,0,20);      -- wing_earring
INSERT INTO `guild_shops` VALUES (60430,12723,15480,108360,20,0,20);    -- wool_bracers
INSERT INTO `guild_shops` VALUES (60430,12467,18720,131040,20,0,20);    -- wool_cap
INSERT INTO `guild_shops` VALUES (60430,827,21492,52704,55,0,22);      	-- wool_cloth
INSERT INTO `guild_shops` VALUES (60430,12730,6579,46053,20,0,20);     	-- wool_cuffs
INSERT INTO `guild_shops` VALUES (60430,12595,28080,196560,20,0,20);    -- wool_gambison
INSERT INTO `guild_shops` VALUES (60430,12474,7803,54621,20,0,20);    	-- wool_hat
INSERT INTO `guild_shops` VALUES (60430,12851,21600,151200,20,0,10);   	-- wool_hose
INSERT INTO `guild_shops` VALUES (60430,12602,11628,81396,20,0,10);		-- wool_robe
INSERT INTO `guild_shops` VALUES (60430,12858,9486,66402,20,0,10);		-- wool_slops
INSERT INTO `guild_shops` VALUES (60430,12979,14400,100800,20,0,10);	-- wool_socks
INSERT INTO `guild_shops` VALUES (60430,820,2700,12528,165,0,65);    	-- wool_thread
INSERT INTO `guild_shops` VALUES (60430,841,28,35,375,0,150);        	-- yagudo_feather
INSERT INTO `guild_shops` VALUES (60430,2145,75,80,255,48,100);       -- zephyr_thread
INSERT INTO `guild_shops` VALUES (60430,2149,687,4809,375,0,150);       -- apkallu_feather
INSERT INTO `guild_shops` VALUES (60430,2150,687,4809,375,0,150);       -- colibri_feather
INSERT INTO `guild_shops` VALUES (60430,2288,8235,57645,375,0,150);     -- karakul_cloth
INSERT INTO `guild_shops` VALUES (60430,2287,14400,17280,375,0,150);    -- karakul_thread
INSERT INTO `guild_shops` VALUES (60430,2148,687,4809,375,0,150);       -- puk_wing
INSERT INTO `guild_shops` VALUES (60430,2289,4890,34230,375,0,150);     -- wamoura_cloth
INSERT INTO `guild_shops` VALUES (60430,2173,748,748,375,0,150);      	-- wamoura_cocoon



-- Tsutsuroon (Tenshodo Merchant) Nashmau
INSERT INTO `guild_shops` VALUES (60431,16896,517,592,20,10,20);	-- Kunai    
INSERT INTO `guild_shops` VALUES (60431,16917,4226,4226,20,7,15);   -- Suzume
INSERT INTO `guild_shops` VALUES (60431,16900,1404,1608,20,7,15);	-- Wakizash
INSERT INTO `guild_shops` VALUES (60431,16919,2728,17167,20,7,15);	-- Shinobi-gatana
INSERT INTO `guild_shops` VALUES (60431,16960,3121,3575,20,5,10);	-- Uchigatana
INSERT INTO `guild_shops` VALUES (60431,16975,11583,13266,20,5,10); -- Kanesada
INSERT INTO `guild_shops` VALUES (60431,16966,1836,2103,20,10,20);  -- Tachi
INSERT INTO `guild_shops` VALUES (60431,16982,4752,38670,20,0,10);  -- Nodachi
INSERT INTO `guild_shops` VALUES (60431,16987,12253,14033,20,5,10); -- Okanehira
INSERT INTO `guild_shops` VALUES (60431,16988,14676,16808,20,7,15); -- Kotetsu
INSERT INTO `guild_shops` VALUES (60431,17802,189945,464059,20,2,3); -- Kiku-Ichimonji
INSERT INTO `guild_shops` VALUES (60431,16871,183516,404395,20,2,3); -- Kamayari
INSERT INTO `guild_shops` VALUES (60431,17259,72144,158976,20,5,10); -- Pirate's Gun
INSERT INTO `guild_shops` VALUES (60431,17301,43,150,2970,594,1188);  -- Shuriken
INSERT INTO `guild_shops` VALUES (60431,17302,347,347,2970,594,1188); -- Juji Shuriken
INSERT INTO `guild_shops` VALUES (60431,17304,57960,57960,2970,594,1188); -- Fuma Shuriken
INSERT INTO `guild_shops` VALUES (60431,17285,101745,101745,2970,594,1188); -- Moonring Blade
INSERT INTO `guild_shops` VALUES (60431,17322,116,187,2970,594,1188);	-- Fire Arrow
INSERT INTO `guild_shops` VALUES (60431,17340,58,174,8910,0,3564);		-- Bullet
INSERT INTO `guild_shops` VALUES (60431,12456,552,858,20,10,20);		-- Hachimaki
INSERT INTO `guild_shops` VALUES (60431,12457,3272,5079,20,7,15);		-- Cotton Hachimaki
INSERT INTO `guild_shops` VALUES (60431,12458,8972,13927,20,5,10);		-- Soil Hachimaki
INSERT INTO `guild_shops` VALUES (60431,13111,20061,29942,20,5,10);		-- Nodowa
INSERT INTO `guild_shops` VALUES (60431,12584,833,1294,20,10,20);		-- Kenpog
INSERT INTO `guild_shops` VALUES (60431,12585,4931,7654,20,7,15);		-- Cotton Dogi
INSERT INTO `guild_shops` VALUES (60431,12586,13266,14850,20,5,10);		-- Soil Gi
INSERT INTO `guild_shops` VALUES (60431,12712,458,712,20,10,20);		-- Tekko
INSERT INTO `guild_shops` VALUES (60431,12713,2528,3924,20,7,15);		-- Cotton Tekko
INSERT INTO `guild_shops` VALUES (60431,12714,2713,8316,20,5,10);		-- Soil Tekko
INSERT INTO `guild_shops` VALUES (60431,12840,666,1034,20,10,20);		-- Sitabaki
INSERT INTO `guild_shops` VALUES (60431,12841,3951,8847,20,7,15);		-- Cotton Sitabaki
INSERT INTO `guild_shops` VALUES (60431,12842,2713,8316,20,5,10);		-- Soil Sitabaki
INSERT INTO `guild_shops` VALUES (60431,12968,424,660,20,10,20);		-- Kyahan
INSERT INTO `guild_shops` VALUES (60431,12969,2528,11925,20,7,15);		-- Cotton Kyahan
INSERT INTO `guild_shops` VALUES (60431,12970,11070,12393,20,5,10);		-- Soil Kyahan
INSERT INTO `guild_shops` VALUES (60431,704,108,149,375,75,150);		-- Bamboo Stick
INSERT INTO `guild_shops` VALUES (60431,915,6048,16120,165,33,165);		-- Toad Oil 
INSERT INTO `guild_shops` VALUES (60431,1134,993,2095,255,48,100);		-- Bast Parchment
INSERT INTO `guild_shops` VALUES (60431,1155,436,645,165,33,165);		-- Iron Sand
INSERT INTO `guild_shops` VALUES (60431,657,4690,21000,165,33,65);		-- Tama-Hagane
INSERT INTO `guild_shops` VALUES (60431,1415,55147,55147,165,33,65);	-- Urushi
INSERT INTO `guild_shops` VALUES (60431,1161,94,174,2970,594,1188);		-- Uchitake
INSERT INTO `guild_shops` VALUES (60431,1164,65,120,2970,594,1188);		-- Tsurara
INSERT INTO `guild_shops` VALUES (60431,1167,94,174,2970,594,1188);		-- Kawahori-Ogi
INSERT INTO `guild_shops` VALUES (60431,1170,94,174,2970,594,1188);		-- Makibishi
INSERT INTO `guild_shops` VALUES (60431,1173,94,174,2970,594,1188);		-- Hiraishin
INSERT INTO `guild_shops` VALUES (60431,1176,94,174,2970,594,1188);		-- Mizu-Deppo
INSERT INTO `guild_shops` VALUES (60431,1472,369,369,255,48,100);		--Gardenia Seed
INSERT INTO `guild_shops` VALUES (60431,1554,431,512,255,48,100);		-- Turmeric
INSERT INTO `guild_shops` VALUES (60431,1555,1061,1259,255,48,100);		-- Coriander
INSERT INTO `guild_shops` VALUES (60431,1590,536,700,255,48,100);		-- Holy Basil
INSERT INTO `guild_shops` VALUES (60431,1475,579,1188,255,48,100);		-- Curry Powder
INSERT INTO `guild_shops` VALUES (60431,5164,1945,2854,255,48,100);		-- Ground Wasabi
INSERT INTO `guild_shops` VALUES (60431,1652,233,250,255,48,100);		-- Rice Vinegar
INSERT INTO `guild_shops` VALUES (60431,5235,1284,1350,255,48,100);		-- Napa


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-29 15:16:13
