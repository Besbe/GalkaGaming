--------------------------------------------------------------
-- func: craft <page number>
-- desc: opens the custom moogle shop menu for craftinganywhere in the world
-- revised by: Marathon Mar. 2016
--------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player,page)
    if (page == 0 or page == nil) then
        player:PrintToPlayer( "1: Smithing, 2: Goldsmithing, 3: Clothcraft");
        player:PrintToPlayer( "4: Woodworking, 5: Leathercraft, 6: Bonecraft");
		player:PrintToPlayer( "7: Alchemy, 8: Cooking, 9: Fish");
    elseif (page == 1) then -- Smithing
        local stock_1 =
        {
			683,	100,	--	Adaman Chain
			655,	100,	--	Adaman Ingot
			1229,	100,	--	Adaman Nugget
			646,	100,	--	Adaman Ore
			675,	100,	--	Adaman Scales
			665,	100,	--	Adaman Sheet
			649,	100,	--	Bronze Ingot
			1232,	100,	--	Bronze Nugget
			672,	100,	--	Bronze Scales
			660,	100,	--	Bronze Sheet
			648,	100,	--	Copper Ingot
			1230,	100,	--	Copper Nugget
			640,	100,	--	Copper Ore
			2001,	100,	--	Dark Adaman
			2000,	100,	--	Dark Adaman Ingot
			1989,	100,	--	Dark Bronze Ingot
			1990,	100,	--	Dark Bronze Sheet
			682,	100,	--	Darksteel Chain
			654,	100,	--	Darksteel Ingot
			1228,	100,	--	Darksteel Nugget
			645	,	100,	--	Darksteel Ore
			1773,	100,	--	Darksteel Scales
			664,	100,	--	Darksteel Sheet
			2363,	100,	--	Firebrick
			1287,	100,	--	Frigid Core
			1654,	100,	--	Igneous Rock
			1284,	100,	--	Inferno Core
			2823,	100,	--	Iridium Ingot
			680,	100,	--	Iron Chain
			651,	100,	--	Iron Ingot
			1234,	100,	--	Iron Nugget
			643,	100,	--	Iron Ore
			1155,	100,	--	Iron Sand
			674,	100,	--	Iron Scales
			662,	100,	--	Iron Sheet
			2006,	100,	--	Iyo Scale
			2711,	100,	--	Khroma Nugget
			1650,	100,	--	Kopparnickel Ore
			1681,	100,	--	Light Steel Ingot
			2008,	100,	--	Lightweight Steel
			2134,	100,	--	Lucent Iron Ingot
			2135,	100,	--	Lucent Steel Ingot
			1285,	100,	--	Luminous Core
			2886,	100,	--	Mildewy Ingot
			2531,	100,	--	Obsidian
			1635,	100,	--	Paktong Ingot
			1738,	100,	--	Shakudo Ingot
			2860,	100,	--	Slab Of Plumbago
			1286,	100,	--	Spirit Core
			652,	100,	--	Steel Ingot
			1235,	100,	--	Steel Nugget
			676,	100,	--	Steel Scales
			666,	100,	--	Steel Sheet
			657,	100,	--	Tama-hagane
			659,	100,	--	Tin Ingot
			641,	100,	--	Tin Ore
			2302,	100,	--	Troll Bronze Ingot
			2303,	100,	--	Troll Bronze Sheet
			2144,	100,	--	Workshop Anvil
        };
        tpz.shop.general(player, stock_1);
        player:PrintToPlayer( "Smithing: Welcome, Kupo!");
    elseif (page == 2) then -- Goldsmithing
        local stock_2 =
        {
			2417, 100,	--	Aht Urhgan Brass
			2418, 100,	--	Aht Urhgan Brass Ingot
			2419, 100,	--	Aht Urhgan Brass Sheet
			684, 100,	--	Aluminum Chain
			679, 100,	--	Aluminum Ingot
			678, 100,	--	Aluminum Ore
			670, 100,	--	Aluminum Sheet
			814, 100,	--	Amber
			800, 100,	--	Amethyst
			813, 100,	--	Angelstone
			791, 100,	--	Aquamarine
			775, 100,	--	Black Rock
			770, 100,	--	Blue Rock
			764, 100,	--	Brass Chain
			650, 100,	--	Brass Ingot
			1231, 100,	--	Brass Nugget
			673, 100,	--	Brass Scales
			661, 100,	--	Brass Sheet
			801, 100,	--	Chrysoberyl
			809, 100,	--	Clear Topaz
			1262, 100,	--	Dark Ore
			812, 100,	--	Deathstone
			787, 100,	--	Diamond
			1258, 100,	--	Earth Ore
			2551, 100,	--	Electrum Chain
			2536, 100,	--	Electrum Ingot
			785, 100,	--	Emerald
			1255, 100,	--	Fire Ore
			810, 100,	--	Fluorite
			761, 100,	--	Gold Chain
			745, 100,	--	Gold Ingot
			1225, 100,	--	Gold Nugget
			737, 100,	--	Gold Ore
			752, 100,	--	Gold Sheet
			772, 100,	--	Green Rock
			1256, 100,	--	Ice Ore
			784, 100,	--	Jadeite
			795, 100,	--	Lapis Lazuli
			796, 100,	--	Light Opal
			1261, 100,	--	Light Ore
			1259, 100,	--	Lightning Ore
			802, 100,	--	Moonstone
			681, 100,	--	Mythril Chain
			653, 100,	--	Mythril Ingot
			1226, 100,	--	Mythril Nugget
			644, 100,	--	Mythril Ore
			663, 100,	--	Mythril Sheet
			799, 100,	--	Onyx
			763, 100,	--	Orichalcum Chain
			739, 100,	--	Orichalcum Ore
			668, 100,	--	Orichalcum Sheet
			797, 100,	--	Painite
			762, 100,	--	Platinum Chain
			746, 100,	--	Platinum Ingot
			1227, 100,	--	Platinum Nugget
			738, 100,	--	Platinum Ore
			754, 100,	--	Platinum Sheet
			774, 100,	--	Purple Rock
			769, 100,	--	Red Rock
			786, 100,	--	Ruby
			794, 100,	--	Sapphire
			807, 100,	--	Sardonyx
			760, 100,	--	Silver Chain
			744, 100,	--	Silver Ingot
			1233, 100,	--	Silver Nugget
			736, 100,	--	Silver Ore
			671, 100,	--	Silver Sheet
			804, 100,	--	Spinel
			803, 100,	--	Sunstone
			789, 100,	--	Topaz
			806, 100,	--	Tourmaline
			773, 100,	--	Translucent Rock
			1260, 100,	--	Water Ore
			776, 100,	--	White Rock
			1257, 100,	--	Wind Ore
			771, 100,	--	Yellow Rock
			642, 100,	--	Zinc Ore
			805, 100,	--	Zircon
		};
        tpz.shop.general(player, stock_2);
        player:PrintToPlayer( "Goldsmithing: Welcome, Kupo!");
    elseif (page == 3) then -- Clothcraft
        local stock_3 =
        {
			2138, 100,	--	Alluring Cotton Cloth
			2149, 100,	--	Apkallu Feather
			1294, 100,	--	Arachne Thread
			1270, 100,	--	Arachne Web
			1739, 100,	--	Balloon Cloth
			847, 100,	--	Bird Feather
			845, 100,	--	Black Chocobo Feather
			1700, 100,	--	Bloodthread
			1966, 100,	--	Brilliant Gold Thread
			840, 100,	--	Chocobo Feather
			2150, 100,	--	Colibri Feather
			825, 100,	--	Cotton Cloth
			818, 100,	--	Cotton Thread
			839, 100,	--	Crawler Cocoon
			1994, 100,	--	Ether Cotton
			1701, 100,	--	Fine Linen Cloth
			835, 100,	--	Flax Flower
			842, 100,	--	Giant Bird Feather
			843, 100,	--	Giant Bird Plume
			2522, 100,	--	Gnat Wing
			1999, 100,	--	Gold Brocade
			823, 100,	--	Gold Thread
			824, 100,	--	Grass Cloth
			817, 100,	--	Grass Thread
			1619, 100,	--	Hippogryph Feather
			1690, 100,	--	Hippogryph Tailfeather
			2340, 100,	--	Imperial Silk Cloth
			846, 100,	--	Insect Wing
			2288, 100,	--	Karakul Cloth
			2287, 100,	--	Karakul Thread
			2315, 100,	--	Karakul Wool
			2506, 100,	--	Ladybug Wing
			826, 100,	--	Linen Cloth
			819, 100,	--	Linen Thread
			529, 100,	--	Luminicloth
			837, 100,	--	Malboro Fiber
			1163, 100,	--	Manticore Hair
			2166, 100,	--	Marid Hair
			1651, 100,	--	Moblin Thread
			1636, 100,	--	Moblinweave
			2274, 100,	--	Mohbwa Cloth
			2295, 100,	--	Mohbwa Grass
			2296, 100,	--	Mohbwa Thread
			833, 100,	--	Moko Grass
			3504, 100,	--	Peapuk Wing
			844, 100,	--	Phoenix Feather
			2476, 100,	--	Platinum Silk Thread
			2148, 100,	--	Puk Wing
			830, 100,	--	Rainbow Cloth
			821, 100,	--	Rainbow Thread
			1996, 100,	--	Rainbow Velvet
			1132, 100,	--	Raxa
			1829, 100,	--	Red Grass Cloth
			1828, 100,	--	Red Grass Thread
			1845, 100,	--	Red Moko Grass
			834, 100,	--	Saruta Cotton
			832, 100,	--	Sheep Wool
			1968, 100,	--	Shiny Gold Thread
			829, 100,	--	Silk Cloth
			816, 100,	--	Silk Thread
			1991, 100,	--	Silver Brocade
			822, 100,	--	Silver Thread
			1702, 100,	--	Smooth Velvet Cloth
			838, 100,	--	Spider Web
			2128, 100,	--	Spindle
			2539, 100,	--	Tuft Of Dhalmel Hair
			1278, 100,	--	Twinthread
			828, 100,	--	Velvet Cloth
			2289, 100,	--	Wamoura Cloth
			2173, 100,	--	Wamoura Cocoon
			2337, 100,	--	Wamoura Hair
			2304, 100,	--	Wamoura Silk
			2198, 100,	--	Water Spider's Web
			2010, 100,	--	Wolf Felt
			2011, 100,	--	Wolf Fur
			827, 100,	--	Wool Cloth
			820, 100,	--	Wool Thread
			1867, 100,	--	Yagudo Cutting
			841, 100,	--	Yagudo Feather
			2145, 100,	--	Zephyr Thread
        };
        tpz.shop.general(player, stock_3);
        player:PrintToPlayer( "Clothcraft: Welcome, Kupo!");
    elseif (page == 4) then -- Woodworking
        local stock_4 =
        {
			720, 100,	--	Ancient Lumber
			731, 100,	--	Aquilaria Log
			688, 100,	--	Arrowwood Log
			705, 100,	--	Arrowwood Lumber
			698, 100,	--	Ash Log
			715, 100,	--	Ash Lumber
			704, 100,	--	Bamboo Stick
			1134, 100,	--	Bast Parchment
			692, 100,	--	Beech Log
			709, 100,	--	Beech Lumber
			729, 100,	--	Bloodwood Log
			730, 100,	--	Bloodwood Lumber
			1657, 100,	--	Bundling Twine
			694, 100,	--	Chestnut Log
			710, 100,	--	Chestnut Lumber
			727, 100,	--	Dogwood Log
			728, 100,	--	Dogwood Lumber
			702, 100,	--	Ebony Log
			719, 100,	--	Ebony Lumber
			690, 100,	--	Elm Log
			707, 100,	--	Elm Lumber
			2761, 100,	--	Feyweald Log
			2762, 100,	--	Feyweald Lumber
			697, 100,	--	Holly Log
			714, 100,	--	Holly Lumber
			732, 100,	--	Kapor Log
			1446, 100,	--	Lacquer Tree Log
			1447, 100,	--	Lacquer Tree Lumber
			689, 100,	--	Lauan Log
			706, 100,	--	Lauan Lumber
			700, 100,	--	Mahogany Log
			717, 100,	--	Mahogany Lumber
			691, 100,	--	Maple Log
			708, 100,	--	Maple Lumber
			699, 100,	--	Oak Log
			716, 100,	--	Oak Lumber
			703, 100,	--	Petrified Log
			701, 100,	--	Rosewood Log
			718, 100,	--	Rosewood Lumber
			2532, 100,	--	Teak Log
			2533, 100,	--	Teak Lumber
			1415, 100,	--	Pot of Urushi
			693, 100,	--	Walnut Log
			711, 100,	--	Walnut Lumber
			695, 100,	--	Willow Log
			712, 100,	--	Willow Lumber
			696, 100,	--	Yew Log
			713, 100,	--	Yew Lumber
			2292, 1,	--	Apkallu Fletchings x99
			1223, 1,	--	Bird Fletchings x99
			1254, 1,	--	Blk. Chocobo Fletchings x99
			1221, 1,	--	Chocobo Fletchings x99
			2649, 1,	--	Colibri Fletchings x99
			1417, 1,	--	Giant Bird Fletchings x99
			2548, 1,	--	Gnat Fletchings x99
			1224, 1,	--	Insect Fletchings x99
			3506, 1,	--	Peapuk Fletchings x99
			2291, 1,	--	Puk Fletchings x99
			1222, 1,	--	Yagudo Fletchings x99
			1243, 1,	--	Acid Bolt Heads x99
			1248, 1,	--	Beetle Arrowheads x99
			1242, 1,	--	Blind Bolt Heads x99
			1246, 1,	--	Bloody Bolt Heads x99
			1211, 1,	--	Bronze Bolt Heads x99
			1213, 1,	--	Darksteel Bolt Heads x99
			1251, 1,	--	Demon Arrowheads x99
			1961, 1,	--	Gold Arrowheads x99
			1244, 1,	--	Holy Bolt Heads x99
			1216, 1,	--	Iron Arrowheads x99
			1252, 1,	--	Poison Arrowheads x99
			1250, 1,	--	Scorpion Arrowheads x99
			1217, 1,	--	Silver Arrowheads x99
			1253, 1,	--	Sleep Arrowheads x99
			1247, 1,	--	Sleep Bolt Heads x99
			1214, 1,	--	Stone Arrowheads x99
			1245, 1,	--	Venom Bolt Heads x99
        };
        tpz.shop.general(player, stock_4);
        player:PrintToPlayer( "Woodworking: Welcome, Kupo!");

    elseif (page == 5) then -- Leathercraft
        local stock_5 =
        {
			2751, 100,	--	Amph Leather
			1978, 100,	--	Bloody Ram Leather
			1628, 100,	--	Buffalo Hide
			1629, 100,	--	Buffalo Leather
			1637, 100,	--	Bugard Leather
			1640, 100,	--	Bugard Skin
			2123, 100,	--	Catoblepas Hide
			2124, 100,	--	Catoblepas Leather
			854, 100,	--	Cockatrice Skin
			863, 100,	--	Coeurl Hide
			506, 100,	--	Coeurl Leather
			857, 100,	--	Dhalmel Hide
			848, 100,	--	Dhalmel Leather
			1623, 100,	--	Eft Skin
			2189, 100,	--	Fiendish Skin
			2773, 100,	--	Fine Parchment
			2139, 100,	--	Fragrant Dhalmel Hide
			2140, 100,	--	Fragrant Ram Skin
			1972, 100,	--	Glossy Bugard Leather
			1516, 100,	--	Griffon Hide
			1459, 100,	--	Griffon Leather
			1680, 100,	--	High-quality Bugard Skin
			1591, 100,	--	High-quality Coeurl Hide
			1741, 100,	--	High-quality Eft Skin
			1992, 100,	--	Holy Leather
			879, 100,	--	Karakul Leather
			878, 100,	--	Karakul Skin
			2703, 100,	--	Khromated Leather
			1869, 100,	--	Lamia Skin
			1655, 100,	--	Leather Pouch
			873, 100,	--	Light Ram Leather
			869, 100,	--	Lizard Molt
			852, 100,	--	Lizard Skin
			2512, 100,	--	Lynx Hide
			2530, 100,	--	Lynx Leather
			877, 100,	--	Manta Leather
			876, 100,	--	Manta Skin
			1116, 100,	--	Manticore Hide
			1117, 100,	--	Manticore Leather
			2151, 100,	--	Marid Hide
			2152, 100,	--	Marid Leather
			1865, 100,	--	Orc Cutting
			2121, 100,	--	Ovinnik Hide
			2122, 100,	--	Ovinnik Leather
			917, 100,	--	Parchment
			2538, 100,	--	Peiste Leather
			2523, 100,	--	Peiste Skin
			856, 100,	--	Rabbit Hide
			851, 100,	--	Ram Leather
			859, 100,	--	Ram Skin
			853, 100,	--	Raptor Skin
			1969, 100,	--	Rugged Bugard Leather
			2755, 100,	--	Ruszor Hide
			2756, 100,	--	Ruszor Leather
			2824, 100,	--	Shagreen
			1998, 100,	--	Sheep Chammy
			850, 100,	--	Sheep Leather
			505, 100,	--	Sheepskin
			2737, 100,	--	Silky Suede
			2518, 100,	--	Smilodon Hide
			2529, 100,	--	Smilodon Leather
			870, 100,	--	Smooth Sheep Leather
			1971, 100,	--	Soft Bugard Leather
			2733, 100,	--	Spirit Smilodon Leather
			1276, 100,	--	Tarasque Skin
			861, 100,	--	Tiger Hide
			855, 100,	--	Tiger Leather
			1970, 100,	--	Tough Bugard Leather
			872, 100,	--	Tough Dhalmel Leather
			849, 100,	--	Undead Skin
			2550, 100,	--	Vellum
			1977, 100,	--	Vivio Sheep Leather
			2003, 100,	--	White Mouton
			635, 100,	--	Windurstian Tea Leaves
			2428, 100,	--	Wivre Hide
			858, 100,	--	Wolf Hide
			1122, 100,	--	Wyvern Skin
			2188, 100,	--	Wyvern Tailskin
			1124, 100,	--	Wyvern Wing
			2125, 100,	--	Yellow Mouton
        };
        tpz.shop.general(player, stock_5);
        player:PrintToPlayer( "Leathercraft: Welcome, Kupo!");
    elseif (page == 6) then -- Bonecraft
     local stock_6 =
        {
			1312, 100,	--	Angel Skin
			1616, 100,	--	Antlion Jaw
			891, 100,	--	Bat Fang
			2002, 100,	--	Beast Horn
			894, 100,	--	Beetle Jaw
			889, 100,	--	Beetle Shell
			884, 100,	--	Black Tiger Fang
			880, 100,	--	Bone Chip
			1615, 100,	--	Buffalo Horn
			1622, 100,	--	Bugard Tusk
			2004, 100,	--	Carapace Powder
			898, 100,	--	Chicken Bone
			2171, 100,	--	Colibri Beak
			1518, 100,	--	Colossal Skull
			887, 100,	--	Coral Fragment
			2009, 100,	--	Coral Horn
			881, 100,	--	Crab Shell
			902, 100,	--	Demon Horn
			886, 100,	--	Demon Skull
			1771, 100,	--	Dragon Bone
			867, 100,	--	Dragon Scales			
			900, 100,	--	Fish Bones
			864, 100,	--	Fish Scales
			893, 100,	--	Giant Femur
			1517, 100,	--	Giant Frozen Head
			2521, 100,	--	Gnole Claw
			1868, 100,	--	Goblin Cutting
			1719, 100,	--	Harajnite Shell
			2639, 100,	--	Hardened Bone
			1193, 100,	--	High-quality Crab Shell
			1587, 100,	--	High-quality Pugil Scales
			1473, 100,	--	High-quality Scorpion Shell
			2157, 100,	--	Imp Horn
			1458, 100,	--	Mammoth Tusk
			1123, 100,	--	Manticore Fang
			2147, 100,	--	Marid Tusk
			1718, 100,	--	Megalobugard Tusk
			2146, 100,	--	Merrow Scale
			1770, 100,	--	Oversized Fang
			1311, 100,	--	Oxblood
			868, 100,	--	Pugil Scales
			1866, 100,	--	Quadav Parts
			895, 100,	--	Ram Horn
			2754, 100,	--	Ruszor Fang
			1015, 100,	--	Sand Bat Fang
			897, 100,	--	Scorpion Claw
			896, 100,	--	Scorpion Shell
			888, 100,	--	Seashell
			2130, 100,	--	Shagreen File
			882, 100,	--	Sheep Tooth
			1883, 100,	--	Shell Powder
			1716, 100,	--	Smooth Beetle Jaw
			1620, 100,	--	Taurus Horn
			1586, 100,	--	Titanictus Shell
			885, 100,	--	Turtle Shell
			1618, 100,	--	Uragnite Shell			
			2427, 100,	--	Wivre Maul
			866, 100,	--	Wyvern Scales
		};
		tpz.shop.general(player, stock_6);
		player:PrintToPlayer( "Bonecraft: Welcome, Kupo!");
    elseif (page == 7) then -- Alchemy
		local stock_7 =
		{
			921, 100,	--	Ahriman Tears
			935, 100,	--	Ahriman Wing
			2361, 100,	--	Ameretat Vine
			937, 100,	--	Animal Glue
			1109, 100,	--	Artificial Lens
			1626, 100,	--	Avatar Blood
			2113, 100,	--	Baking Soda
			922, 100,	--	Bat Wing
			2015, 100,	--	Beast Blood
			912, 100,	--	Beehive Chip
			913, 100,	--	Beeswax
			2014, 100,	--	Bird Blood
			1110, 100,	--	Black Beetle Blood
			929, 100,	--	Black Ink
			928, 100,	--	Bomb Ash
			919, 100,	--	Boyahda Moss
			1775, 100,	--	Brimsand
			1592, 100,	--	Cactuar Root
			2464, 100,	--	Carbon Dioxide
			932, 100,	--	Carbon Fiber
			931, 100,	--	Cermet Chunk
			2229, 100,	--	Chimera Blood
			1630, 100,	--	Cluster Ash
			927, 100,	--	Coeurl Whisker
			2365, 100,	--	Demon Blood
			1165, 100,	--	Doll Shard
			1443, 100,	--	Dried Mugwort
			923	, 100,	--	Dryad Root
			2300, 100,	--	Ebonite
			924, 100,	--	Fiend Blood
			947, 100,	--	Firesand
			2175, 100,	--	Flan Meat
			1882, 100,	--	Flaxseed Oil
			1617, 100,	--	Flytrap Leaf
			1265, 100,	--	Four-leaf Korrigan Bud
			1524, 100,	--	Fresh Mugwort
			933, 100,	--	Glass Fiber
			1887, 100,	--	Glass Sheet
			1309, 100,	--	Gold Leaf
			955, 100,	--	Golem Shard
			939, 100,	--	Hecteyes Eye
			2309, 100,	--	Homunculus Nerves
			2163, 100,	--	Imp Wing
			2475, 100,	--	Kaolin
			1979, 100,	--	Leech Saliva
			2155, 100,	--	Lesser Chigoe
			2013, 100,	--	Lizard Blood
			926, 100,	--	Lizard Tail
			954, 100,	--	Magic Pot Shard
			2777, 100,	--	Magicked Blood
			920, 100,	--	Malboro Vine
			914, 100,	--	Mercury
			918, 100,	--	Mistletoe
			5165, 100,	--	Movalpolos Water
			945, 100,	--	Paralysis Dust
			2310, 100,	--	Plasma Oil
			943, 100,	--	Poison Dust
			952, 100,	--	Poison Flour
			2301, 100,	--	Polyflan
			2316, 100,	--	Polyflan Paper
			2513, 100,	--	Rafflesia Vine
			940, 100,	--	Revival Tree Root
			936, 100,	--	Rock Salt
			1893, 100,	--	Salinator
			1886, 100,	--	Sieglinde Putty
			1888, 100,	--	Silica
			1307, 100,	--	Silver Leaf
			1521, 100,	--	Slime Juice
			637, 100,	--	Slime Oil
			2335, 100,	--	Soulflayer Tentacle
			1108, 100,	--	Sulfur
			1772, 100,	--	Super Cermet
			1621, 100,	--	Taurus Wing
			915, 100,	--	Toad Oil
			953, 100,	--	Treant Bulb
			944, 100,	--	Venom Dust
			2374, 100,	--	Viper Dust
			2338, 100,	--	Wamoura Scale
			1884, 100,	--	Zinc Oxide
			1885, 100,	--	Zincite
		};
		tpz.shop.general(player, stock_7);
        player:PrintToPlayer( "Alchemy: Welcome, Kupo!");
    elseif (page == 8) then -- Cooking
        local stock_8 =
        {
			5568, 100,	--	Apkallu Egg
			625, 100,	--	Apple Vinegar
			4571, 100,	--	Beaugreens
			4570, 100,	--	Bird Egg
			626, 100,	--	Black Pepper
			4503, 100,	--	Buburimu Grapes
			5152, 100,	--	Buffalo Meat
			636, 100,	--	Chamomile
			628, 100,	--	Cinnamon
			1633, 100,	--	Clot Plasma
			4435, 100,	--	Cockatrice Meat
			4377, 100,	--	Coeurl Meat
			4450, 100,	--	Coral Fungus
			1555, 100,	--	Coriander
			4357, 100,	--	Crawler Egg
			621, 100,	--	Crying Mustard
			1475, 100,	--	Curry Powder
			5566, 100,	--	Date
			4566, 100,	--	Deathball
			4359, 100,	--	Dhalmel Meat
			4509, 100,	--	Distilled Water
			4272, 100,  --  Dragon Meat
			622, 100,	--	Dried Marjoram
			4363, 100,	--	Faerie Apple
			1522, 100,	--	Fresh Marjoram
			4382, 100,	--	Frost Turnip
			1472, 100,	--	Gardenia Seed
			1111, 100,	--	Gelatin
			5164, 100,	--	Ground Wasabi
			1695, 100,	--	Habanero Peppers
			4358, 100,	--	Hare Meat
			4370, 100,	--	Honey
			2237, 100,	--	Imperial Flour
			2214, 100,	--	Imperial Rice
			2156, 100,	--	Imperial Tea Leaves
			612, 100,	--	Kazham Peppers
			4432, 100,	--	Kazham Pineapple
			4386, 100,	--	King Truffle
			4273, 100,  --  Kitron
			632, 100,	--	Kukuru Bean
			4366, 100,	--	La Theine Cabbage
			4400, 100,	--	Land Crab Meat
			4362, 100,	--	Lizard Egg
			5667, 100,	--	Lynx Meat
			627, 100,	--	Maple Sugar
			614, 100,	--	Mhaura Garlic
			629, 100,	--	Millioncorn
			4390, 100,	--	Mithran Tomato
			5650, 100,	--	Nopales
			633, 100,	--	Olive Oil
			4468, 100,	--	Pamamas
			4274, 100,	--	Persikos
			616, 100,	--	Pie Dough
			2561, 100,	--	Pizza Dough
			618, 100,	--	Pod Of Blue Peas
			619, 100,	--	Popoto
			4448, 100,	--	Puffball
			5569, 100,	--	Puk Egg
			4444, 100,	--	Rarab Tail
			1652, 100,	--	Rice Vinegar
			4365, 100,	--	Rolanberry
			639, 100,	--	Ronfaure Chestnut
			611, 100,	--	Rye Flour
			4389, 100,	--	San D'Orian Carrot
			610, 100,	--	San D'Orian Flour
			4431, 100,	--	San D'Orian Grapes
			4392, 100,	--	Saruta Orange
			615, 100,	--	Selbina Butter
			4378, 100,	--	Selbina Milk
			4374, 100,	--	Sleepshroom
			1471, 100,	--	Sticky Rice
			620, 100,	--	Tarutaru Rice
			4412, 100,	--	Thundermelon
			1554, 100,	--	Turmeric
			5703, 100,	--	Uleguerand Milk
			5661, 100,	--	Walnut
			4491, 100,	--	Watermelon
			4387, 100,	--	Wild Onion
			4373, 100,	--	Woozyshroom
			4445, 100,	--	Yagudo Cherry
			5581, 100,	--	Ziz Meat
		};
		tpz.shop.general(player, stock_8);
		player:PrintToPlayer( "Cooking: Welcome, Kupo!");
    elseif (page == 9) then -- Fish Shop
        local stock_9 =
        {
			5455, 100,	--	Ahtapot
			5461, 100,	--	Alabaligi
			4461, 100,	--	Bastore Bream
			4360, 100,	--	Bastore Sardine
			5473, 100,	--	Bastore Sweeper
			4318, 100,	--	Bibiki Urchin
			4429, 100,	--	Black Eel
			4384, 100,	--	Black Sole
			4313, 100,	--	Blindfish
			4399, 100,	--	Bluetail
			4379, 100,	--	Cheval Salmon
			4443, 100,	--	Cobalt Jellyfish
			5128, 100,	--	Cone Calamary
			4515, 100,	--	Copper Frog
			4472, 100,	--	Crayfish
			4428, 100,	--	Dark Bass
			5447, 100,	--	Denizanasi
			5457, 100,	--	Dil
			4290, 100,	--	Elshimo Frog
			4579, 100,	--	Elshimo Newt
			4454, 100,	--	Emperor Fish
			4289, 100,	--	Forest Carp
			4469, 100,	--	Giant Catfish
			5475, 100,	--	Gigant Octopus
			4474, 100,	--	Gigant Squid
			4383, 100,	--	Gold Lobster
			4304, 100,	--	Grimmonite
			4480, 100,	--	Gugru Tuna
			5132, 100,	--	Gurnard
			5449, 100,	--	Hamsi
			4470, 100,	--	Icefish
			5453, 100,	--	Istakoz
			5136, 100,	--	Istavrit
			5456, 100,	--	Istiridye
			5123, 100,	--	Jacknife
			5448, 100,	--	Kalamar
			5140, 100,	--	Kalkanbaligi
			5464, 100,	--	Kaplumbaga
			5460, 100,	--	Kayabaligi
			5451, 100,	--	Kilicbaligi
			5450, 100,	--	Lakerda
			2216, 100,	--	Lamp Marimo
			5129, 100,	--	Lik
			4315, 100,	--	Lungfish
			5454, 100,	--	Mercanbaligi
			4462, 100,	--	Monke-onke
			5121, 100,	--	Moorish Idol
			5462, 100,	--	Morinabaligi
			4361, 100,	--	Nebimonite
			4485, 100,	--	Noble Lady
			4482, 100,	--	Nosteau Herring
			4481, 100,	--	Ogre Eel
			624, 100,	--	Pamtam Kelp
			5125, 100,	--	Phanauet Newt
			4464, 100,	--	Pipira
			4514, 100,  --  Quus
			5446, 100,	--	Red Bubble-eye
			4402, 100,	--	Red Terrapin
			5135, 100,	--	Rhinochimera
			4291, 100,	--	Sandfish
			5459, 100,	--	Sazanbaligi
			4484, 100,	--	Shall Shell
			4354, 100,	--	Shining Trout
			4451, 100,	--	Silver Shark
			4478, 100,	--	Three-eyed Fish
			4483, 100,	--	Tiger Cod
			4426, 100,	--	Tricolored Carp
			4317, 100,	--	Trilobite
			5466, 100,	--	Trumpet Shell
			5452, 100,	--	Uskumru
			5131, 100,	--	Vongola Clam
			4403, 100,	--	Yellow Globe
			5458, 100,	--	Yilanbaligi
			4385, 100,	--	Zafmlug Bass
			4288, 100,	--	Zebra Eel
		};
		tpz.shop.general(player, stock_9);
		player:PrintToPlayer( "Fish Shop: Welcome, Kupo!");
    else
        player:PrintToPlayer( string.format( "The MogShop catalog doesn't have a page %i, Kupo!", page ) );
    end
end;
