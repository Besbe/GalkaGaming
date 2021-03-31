-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-- These queries will be used to make any updates needed to the database.                          --
-- Please ANNOTATE WELL for a clear understanding of what your query is changing/adding/removing.  --
-- Overly detaling your query function is NOT needed.                                              --
-- DO NOT RUN QUERIES ON THE LIVE SERVER BEFORE TESTING IN A ISOLATED DEV ENVIRONMENT.             --
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------


--------------------------------------------------
-- ADDING MISSING DROPS OR ADJUSTING DROP RATES --
--------------------------------------------------

------------------
-- Zeruhn Mines --
------------------

INSERT INTO `mob_droplist` VALUES (3999,0,0,1000,637,140); -- Giant_Amoeba -- Slime Oil -- Creating loot table (new NM)
INSERT INTO `mob_droplist` VALUES (3999,0,0,1000,560,1000); -- Giant_Amoeba -- Zeruhn Soot -- Creating loot table (new NM)

----------------
-- Bibiki Bay --
----------------

UPDATE mob_droplist SET itemRate = 200 WHERE itemId = 15347; -- Serra -- Volans Greaves -- Adjusted drop rate

----------------------
-- Uleguerand Range --
----------------------

INSERT INTO mob_droplist VALUES (3998,0,0,1000,15507,350); -- Father Frost -- Purgatory Collar -- Creating loot table (new NM)
INSERT INTO mob_droplist VALUES (3998,0,0,1000,17306,200); -- Father Frost -- Snoll Arm -- Creating loot table (new NM)
UPDATE mob_droplist SET itemRate = 150 WHERE itemId = 15507 AND dropID = 820; -- Snow Maiden -- Purgatory Collar -- Adjusting drop rate


---------------------
-- Quicksand Caves --
---------------------

INSERT INTO mob_droplist VALUES (2144,0,0,1000,644,656); -- Sagittarius X-XIII -- Mythril Ore -- Drop was missing
INSERT INTO mob_droplist VALUES (2144,0,0,1000,644,656); -- Sagittarius X-XIII -- Mythril Ore -- Drop was missing
INSERT INTO mob_droplist VALUES (2144,0,0,1000,643,1000); -- Sagittarius X-XIII -- Iron Ore -- Drop was missing
INSERT INTO mob_droplist VALUES (2144,0,0,1000,643,1000); -- Sagittarius X-XIII -- Iron Ore -- Drop was missing
INSERT INTO mob_droplist VALUES (2144,0,0,1000,645,290); -- Sagittarius X-XIII -- Darksteel Ore -- Drop was missing
INSERT INTO mob_droplist VALUES (2144,0,0,1000,645,290); -- Sagittarius X-XIII -- Darksteel Ore -- Drop was missing
INSERT INTO mob_droplist VALUES (2144,0,0,1000,646,190); -- Sagittarius X-XIII -- Adaman Ore -- Drop was missing
INSERT INTO mob_droplist VALUES (2144,0,0,1000,646,190); -- Sagittarius X-XIII -- Adaman Ore -- Drop was missing



------------------------
-- REMOVING OOE DROPS --
------------------------

DELETE from mob_droplist where itemId = "18856"; -- deae_gratia
DELETE from mob_droplist where itemId = "3085"; -- bewitching_tusk
DELETE from mob_droplist where itemId = "19034"; -- ice_grip
DELETE from mob_droplist where itemId = "19035"; -- thunder_grip
DELETE from mob_droplist where itemId = "2504"; -- heavy_quadav_chestplate
DELETE from mob_droplist where itemId = "2505"; -- heavy_quadav_backplate
DELETE from mob_droplist where itemId = "2531"; -- shard_of_obsidian
DELETE from mob_droplist where itemId = "2532"; -- teak_log
DELETE from mob_droplist where itemId = "2652"; -- gigas_helm
DELETE from mob_droplist where itemId = "2653"; -- gigas_gauntlets
DELETE from mob_droplist where itemId = "11558"; -- nifty_mantle
DELETE from mob_droplist where itemId = "2825"; -- square_of_cambric
DELETE from mob_droplist where itemId = "3098"; -- gnarled_taurus_horn
DELETE from mob_droplist where itemId = "18500"; -- sparth
DELETE from mob_droplist where itemId = "19219"; -- iwatsubute
DELETE from mob_droplist where itemId = "3497"; -- forgotten_step
DELETE from mob_droplist where itemId = "3242"; -- high-quality_scorpion_claw
DELETE from mob_droplist where itemId = "11563"; -- mesmeric_cape
DELETE from mob_droplist where itemId = "11473"; -- mirror_tiara
DELETE from mob_droplist where itemId = "18449"; -- namioyogi
DELETE from mob_droplist where itemId = "18764"; -- oberons_knuckles
DELETE from mob_droplist where itemId = "11898"; -- wave_gages
DELETE from mob_droplist where itemId = "2750"; -- amphiptere_hide
DELETE from mob_droplist where itemId = "2752"; -- amphiptere_whisker
DELETE from mob_droplist where itemId = "2753"; -- amphiptere_claw
DELETE from mob_droplist where itemId = "5054"; -- scroll_of_fire_carol_ii
DELETE from mob_droplist where itemId = "5667"; -- slice_of_lynx_meat
DELETE from mob_droplist where itemId = "3083"; -- mangled_cockatrice_skin
DELETE from mob_droplist where itemId = "2777"; -- vial_of_magicked_blood
DELETE from mob_droplist where itemId = "3089"; -- chunk_of_orobon_cheekmeat
DELETE from mob_droplist where itemId = "11949"; -- haven_hose
DELETE from mob_droplist where itemId = "18805"; -- amicus_grip
DELETE from mob_droplist where itemId = "2893"; -- gargantuan_black_tiger_fang
DELETE from mob_droplist where itemId = "3232"; -- tiger_kings_hide
DELETE from mob_droplist where itemId = "4969"; -- scroll_of_migawari_ichi
DELETE from mob_droplist where itemId = "5668"; -- smilodon_liver
DELETE from mob_droplist where itemId = "3496"; -- frgtn._journey
DELETE from mob_droplist where itemId = "2488"; -- piece_of_alexandrite
DELETE from mob_droplist where itemId = "11743"; -- searing_sash
DELETE from mob_droplist where itemId = "19036"; -- earth_grip
DELETE from mob_droplist where itemId = "18803"; -- pax_grip
DELETE from mob_droplist where itemId = "15760"; -- marabout_sandals
DELETE from mob_droplist where itemId = "731"; -- aquilaria_log
DELETE from mob_droplist where itemId = "16355"; -- bediveres_hose
DELETE from mob_droplist where itemId = "18499"; -- alastor
DELETE from mob_droplist where itemId = "3091"; -- hardened_raptor_skin
DELETE from mob_droplist where itemId = "3249"; -- audumbla_hide
DELETE from mob_droplist where itemId = "11652"; -- miseria_ring
DELETE from mob_droplist where itemId = "11648"; -- spiral_ring
DELETE from mob_droplist where itemId = "4892"; -- scroll_of_aeroja
DELETE from mob_droplist where itemId = "5090"; -- scroll_of_gain-agi
DELETE from mob_droplist where itemId = "2476"; -- spool_of_platinum_silk_thread
DELETE from mob_droplist where itemId = "11745"; -- aristo_belt
DELETE from mob_droplist where itemId = "2534"; -- jacaranda_log
DELETE from mob_droplist where itemId = "2824"; -- square_of_shagreen
DELETE from mob_droplist where itemId = "3244"; -- sprig_of_giant_mistletoe
DELETE from mob_droplist where itemId = "2894"; -- trophy_shield
DELETE from mob_droplist where itemId = "18729"; -- djinn_arm
DELETE from mob_droplist where itemId = "2549"; -- pinch_of_djinn_ash
DELETE from mob_droplist where itemId = "5085"; -- scroll_of_regen_iv
DELETE from mob_droplist where itemId = "11801"; -- deceit_mask
DELETE from mob_droplist where itemId = "2917"; -- bloodshot_hecteye
DELETE from mob_droplist where itemId = "4761"; -- scroll_of_blizzard_v
DELETE from mob_droplist where itemId = "4890"; -- scroll_of_firaja
DELETE from mob_droplist where itemId = "5097"; -- scroll_of_boost-agi
DELETE from mob_droplist where itemId = "11937"; -- sagacity_lappas
DELETE from mob_droplist where itemId = "2506"; -- ladybug_wing
DELETE from mob_droplist where itemId = "2891"; -- dried_chigoe
DELETE from mob_droplist where itemId = "11903"; -- tide_gages
DELETE from mob_droplist where itemId = "18834"; -- vihuela
DELETE from mob_droplist where itemId = "19215"; -- amanokakoyumi
DELETE from mob_droplist where itemId = "19220"; -- goblin_cracker
DELETE from mob_droplist where itemId = "16059"; -- graiai_earring
DELETE from mob_droplist where itemId = "2522"; -- gnat_wing
DELETE from mob_droplist where itemId = "2919"; -- bloody_fang
DELETE from mob_droplist where itemId = "2513"; -- rafflesia_vine
DELETE from mob_droplist where itemId = "2514"; -- rafflesia_petal
DELETE from mob_droplist where itemId = "3258"; -- high-quality_buffalo_horn
DELETE from mob_droplist where itemId = "11740"; -- thiazis_belt
DELETE from mob_droplist where itemId = "11900"; -- savanna_gages
DELETE from mob_droplist where itemId = "3236"; -- smoldering_arm
DELETE from mob_droplist where itemId = "5680"; -- agaricus_mushroom
DELETE from mob_droplist where itemId = "11391"; -- emissary_boots
DELETE from mob_droplist where itemId = "18760"; -- useshi
DELETE from mob_droplist where itemId = "2498"; -- briareuss_sash
DELETE from mob_droplist where itemId = "5703"; -- jug_of_uleguerand_milk
DELETE from mob_droplist where itemId = "2827"; -- spool_of_rugged_gold_thread
DELETE from mob_droplist where itemId = "3234"; -- bottle_of_oasis_water
DELETE from mob_droplist where itemId = "11445"; -- etamin_gambieras
DELETE from mob_droplist where itemId = "3264"; -- jar_of_goblin_gunpowder
DELETE from mob_droplist where itemId = "4756"; -- scroll_of_fire_v
DELETE from mob_droplist where itemId = "11908"; -- brute_gauntlets
DELETE from mob_droplist where itemId = "12318"; -- argos_shield
DELETE from mob_droplist where itemId = "3238"; -- high-quality_dhalmel_hide
DELETE from mob_droplist where itemId = "2901"; -- giant_agaricus_mushroom
DELETE from mob_droplist where itemId = "2922"; -- eft_egg
DELETE from mob_droplist where itemId = "2921"; -- venomous_scorpion_stinger
DELETE from mob_droplist where itemId = "2918"; -- baleful_skull
DELETE from mob_droplist where itemId = "2778"; -- inferior_cocoon
DELETE from mob_droplist where itemId = "11696"; -- kemas_earring
DELETE from mob_droplist where itemId = "3081"; -- coeurl_round
DELETE from mob_droplist where itemId = "19054"; -- fulcio_grip
DELETE from mob_droplist where itemId = "11701"; -- skald_breloque
DELETE from mob_droplist where itemId = "3248"; -- rimed_wing
DELETE from mob_droplist where itemId = "16308"; -- feud_pendant
DELETE from mob_droplist where itemId = "3495"; -- forgotten_touch
DELETE from mob_droplist where itemId = "11561"; -- salvus_mantle
DELETE from mob_droplist where itemId = "2923"; -- chunk_of_cockatrice_tailmeat
DELETE from mob_droplist where itemId = "3092"; -- mocking_beak
DELETE from mob_droplist where itemId = "3105"; -- fortune_wing
DELETE from mob_droplist where itemId = "11390"; -- llwyds_clogs
DELETE from mob_droplist where itemId = "19218"; -- murderer
DELETE from mob_droplist where itemId = "16277"; -- bandolero_scarf
DELETE from mob_droplist where itemId = "17757"; -- merveilleuse
DELETE from mob_droplist where itemId = "2521"; -- gnole_claw
DELETE from mob_droplist where itemId = "2839"; -- coquecigrue_skin
DELETE from mob_droplist where itemId = "2888"; -- sanguinet
DELETE from mob_droplist where itemId = "2889"; -- limule_pincer
DELETE from mob_droplist where itemId = "2899"; -- winter_puk_egg
DELETE from mob_droplist where itemId = "2641"; -- amoeban_pseudopod
DELETE from mob_droplist where itemId = "19031"; -- fire_grip
DELETE from mob_droplist where itemId = "19038"; -- dark_grip
DELETE from mob_droplist where itemId = "3075"; -- vial_of_undying_ooze
DELETE from mob_droplist where itemId = "2913"; -- clouded_lens
DELETE from mob_droplist where itemId = "15923"; -- grenadier_belt
DELETE from mob_droplist where itemId = "18861"; -- grandeur
DELETE from mob_droplist where itemId = "3079"; -- gory_pincer
DELETE from mob_droplist where itemId = "2896"; -- massive_armband
DELETE from mob_droplist where itemId = "3239"; -- vial_of_puppets_blood
DELETE from mob_droplist where itemId = "3108"; -- crawler_floatstone
DELETE from mob_droplist where itemId = "11901"; -- tropic_gages
DELETE from mob_droplist where itemId = "2747"; -- gargouille_horn
DELETE from mob_droplist where itemId = "2748"; -- gargouille_shank
DELETE from mob_droplist where itemId = "2749"; -- gargouille_eye
DELETE from mob_droplist where itemId = "2823"; -- iridium_ingot
DELETE from mob_droplist where itemId = "11559"; -- ultion_mantle
DELETE from mob_droplist where itemId = "18128"; -- skystrider
DELETE from mob_droplist where itemId = "19039"; -- orca_strap
DELETE from mob_droplist where itemId = "17855"; -- ney
DELETE from mob_droplist where itemId = "4722"; -- scroll_of_enfire_ii
DELETE from mob_droplist where itemId = "3240"; -- high-quality_cockatrice_skin
DELETE from mob_droplist where itemId = "3237"; -- sand-caked_fang
DELETE from mob_droplist where itemId = "3086"; -- handful_of_molt_scraps
DELETE from mob_droplist where itemId = "16272"; -- naraenten_bead_necklace
DELETE from mob_droplist where itemId = "11649"; -- solemn_ring
DELETE from mob_droplist where itemId = "2509"; -- slug_eye
DELETE from mob_droplist where itemId = "15759"; -- mahant_sandals
DELETE from mob_droplist where itemId = "3255"; -- handful_of_whiteworm_clay
DELETE from mob_droplist where itemId = "16019"; -- forte_earring
DELETE from mob_droplist where itemId = "4727"; -- scroll_of_enwater_ii
DELETE from mob_droplist where itemId = "11902"; -- strand_gages
DELETE from mob_droplist where itemId = "3074"; -- lump_of_blanched_silver
DELETE from mob_droplist where itemId = "2890"; -- clionid_wing
DELETE from mob_droplist where itemId = "2640"; -- murex_spicule
DELETE from mob_droplist where itemId = "3256"; -- imp_sentrys_horn
DELETE from mob_droplist where itemId = "19032"; -- water_grip
DELETE from mob_droplist where itemId = "17963"; -- rainmaker
DELETE from mob_droplist where itemId = "18761"; -- acantha_shavers
DELETE from mob_droplist where itemId = "2898"; -- piceous_scale
DELETE from mob_droplist where itemId = "3267"; -- pursuers_wing
DELETE from mob_droplist where itemId = "3243"; -- handful_of_sabulous_clay
DELETE from mob_droplist where itemId = "11527"; -- hecates_crown
DELETE from mob_droplist where itemId = "16246"; -- viator_cape
DELETE from mob_droplist where itemId = "18597"; -- catalyst
DELETE from mob_droplist where itemId = "5093"; -- scroll_of_gain-chr
DELETE from mob_droplist where itemId = "16247"; -- caloyer_cape
DELETE from mob_droplist where itemId = "19217"; -- basilisk
DELETE from mob_droplist where itemId = "3088"; -- avian_remex
DELETE from mob_droplist where itemId = "11754"; -- crudelis_belt
DELETE from mob_droplist where itemId = "19261"; -- jinx_discus
DELETE from mob_droplist where itemId = "4701"; -- scroll_of_cura
DELETE from mob_droplist where itemId = "3093"; -- slice_of_high-quality_crab_meat
DELETE from mob_droplist where itemId = "3521"; -- shivite
DELETE from mob_droplist where itemId = "2776"; -- pumice_stone
DELETE from mob_droplist where itemId = "3268"; -- high-quality_wivre_hide
DELETE from mob_droplist where itemId = "17959"; -- viperine_pick
DELETE from mob_droplist where itemId = "19259"; -- clarus_stone
DELETE from mob_droplist where itemId = "2903"; -- vial_of_eft_blood
DELETE from mob_droplist where itemId = "4702"; -- scroll_of_sacrifice
DELETE from mob_droplist where itemId = "4703"; -- scroll_of_esuna
DELETE from mob_droplist where itemId = "3274"; -- jar_of_goblin_oil
DELETE from mob_droplist where itemId = "2542"; -- goblin_mess_tin
DELETE from mob_droplist where itemId = "2543"; -- goblin_weel
DELETE from mob_droplist where itemId = "3273"; -- length_of_goblin_rope
DELETE from mob_droplist where itemId = "19037"; -- light_grip
DELETE from mob_droplist where itemId = "11742"; -- cognition_belt
DELETE from mob_droplist where itemId = "11695"; -- volley_earring
DELETE from mob_droplist where itemId = "3099"; -- gargouille_stone
DELETE from mob_droplist where itemId = "11288"; -- zahaks_mail
DELETE from mob_droplist where itemId = "19212"; -- black_tathlum
DELETE from mob_droplist where itemId = "2916"; -- high-quality_limule_pincer
DELETE from mob_droplist where itemId = "3072"; -- withered_cocoon
DELETE from mob_droplist where itemId = "2915"; -- high-quality_clionid_wing
DELETE from mob_droplist where itemId = "2904"; -- giant_slug_eyestalk
DELETE from mob_droplist where itemId = "2895"; -- oversized_sock
DELETE from mob_droplist where itemId = "2908"; -- oblivispore_mushroom
DELETE from mob_droplist where itemId = "2892"; -- raw_mutton_chop
DELETE from mob_droplist where itemId = "3082"; -- withered_bud
DELETE from mob_droplist where itemId = "19208"; -- grand_crossbow
DELETE from mob_droplist where itemId = "5006"; -- scroll_of_valor_minuet_v
DELETE from mob_droplist where itemId = "6061"; -- adloquium_schema
DELETE from mob_droplist where itemId = "3106"; -- vial_of_djinn_ashes
DELETE from mob_droplist where itemId = "11556"; -- sunbeam_cape
DELETE from mob_droplist where itemId = "2906"; -- rotting_eyeball
DELETE from mob_droplist where itemId = "2860"; -- slab_of_plumbago
DELETE from mob_droplist where itemId = "2729"; -- hydrangea
DELETE from mob_droplist where itemId = "2909"; -- clump_of_snakeskin_moss
DELETE from mob_droplist where itemId = "4726"; -- scroll_of_enthunder_ii
DELETE from mob_droplist where itemId = "9082"; -- clump_of_bee_pollen
DELETE from mob_droplist where itemId = "3493"; -- frgtn._thought
DELETE from mob_droplist where itemId = "3494"; -- forgotten_hope
DELETE from mob_droplist where itemId = "3073"; -- eruca_egg
DELETE from mob_droplist where itemId = "11947"; -- nisse_slacks
DELETE from mob_droplist where itemId = "19057"; -- caecus_grip
DELETE from mob_droplist where itemId = "19314"; -- quint_spear
DELETE from mob_droplist where itemId = "18900"; -- skeld_sword
DELETE from mob_droplist where itemId = "19732"; -- miramar_gun
DELETE from mob_droplist where itemId = "11905"; -- brook_gages
DELETE from mob_droplist where itemId = "3262"; -- jaculus_wing
DELETE from mob_droplist where itemId = "3100"; -- moonbeam_clam
DELETE from mob_droplist where itemId = "2507"; -- lycopodium_flower
DELETE from mob_droplist where itemId = "19258"; -- qirmiz_tathlum
DELETE from mob_droplist where itemId = "11650"; -- heed_ring
DELETE from mob_droplist where itemId = "16210"; -- ebullient_cape
DELETE from mob_droplist where itemId = "11643"; -- odium_ring
DELETE from mob_droplist where itemId = "19058"; -- vox_grip
DELETE from mob_droplist where itemId = "19056"; -- elementa_grip
DELETE from mob_droplist where itemId = "2524"; -- peiste_stinger
DELETE from mob_droplist where itemId = "11286"; -- avalon_breastplate
DELETE from mob_droplist where itemId = "16178"; -- avalon_shield
DELETE from mob_droplist where itemId = "18428"; -- kogitsunemaru
DELETE from mob_droplist where itemId = "3245"; -- bevel_gear
DELETE from mob_droplist where itemId = "11909"; -- trigger_gloves
DELETE from mob_droplist where itemId = "2497"; -- kukulkans_skin
DELETE from mob_droplist where itemId = "16275"; -- ancient_torque
DELETE from mob_droplist where itemId = "11285"; -- morganas_cotehardie
DELETE from mob_droplist where itemId = "16344"; -- oily_trousers
DELETE from mob_droplist where itemId = "17751"; -- fragarach
DELETE from mob_droplist where itemId = "19044"; -- disciple_grip
DELETE from mob_droplist where itemId = "11562"; -- sharpeye_mantle
DELETE from mob_droplist where itemId = "18445"; -- amakura
DELETE from mob_droplist where itemId = "11421"; -- missile_boots
DELETE from mob_droplist where itemId = "2914"; -- murmuring_globule
DELETE from mob_droplist where itemId = "2849"; -- likho_talon
DELETE from mob_droplist where itemId = "3097"; -- black_rabbit_tail
DELETE from mob_droplist where itemId = "15829"; -- skirmishers_ring
DELETE from mob_droplist where itemId = "18450"; -- mukademaru
DELETE from mob_droplist where itemId = "3263"; -- naiads_lock
DELETE from mob_droplist where itemId = "11702"; -- centaurus_earring
DELETE from mob_droplist where itemId = "11418"; -- poise_shoes
DELETE from mob_droplist where itemId = "2902"; -- filthy_gnole_claw
DELETE from mob_droplist where itemId = "18802"; -- vallus_grip
DELETE from mob_droplist where itemId = "18862"; -- clearpath
DELETE from mob_droplist where itemId = "19155"; -- cruadin
DELETE from mob_droplist where itemId = "4725"; -- scroll_of_enstone_ii
DELETE from mob_droplist where itemId = "4724"; -- scroll_of_enaero_ii
DELETE from mob_droplist where itemId = "2975"; -- manigordo_tusk
DELETE from mob_droplist where itemId = "11694"; -- bloodgem_earring
DELETE from mob_droplist where itemId = "18952"; -- faucheuse
DELETE from mob_droplist where itemId = "19040"; -- shark_strap
DELETE from mob_droplist where itemId = "3250"; -- helical_gear
DELETE from mob_droplist where itemId = "15324"; -- caitiffs_socks
DELETE from mob_droplist where itemId = "16381"; -- tumbler_trunks
DELETE from mob_droplist where itemId = "2910"; -- armored_dragonhorn
DELETE from mob_droplist where itemId = "16190"; -- bloom_buckler
DELETE from mob_droplist where itemId = "3261"; -- minaruja_skull
DELETE from mob_droplist where itemId = "11573"; -- blur_mantle
DELETE from mob_droplist where itemId = "19315"; -- erebuss_lance
DELETE from mob_droplist where itemId = "2907"; -- tiny_morbol_vine
DELETE from mob_droplist where itemId = "19275"; -- tsukumo
DELETE from mob_droplist where itemId = "3241"; -- ladybird_leaf
DELETE from mob_droplist where itemId = "19053"; -- curatio_grip
DELETE from mob_droplist where itemId = "11420"; -- ruffian_leggings
DELETE from mob_droplist where itemId = "18541"; -- tjukurrpa_axe
DELETE from mob_droplist where itemId = "11923"; -- tjukurrpa_gauntlets
DELETE from mob_droplist where itemId = "11647"; -- airy_ring
DELETE from mob_droplist where itemId = "11904"; -- thicket_gages
DELETE from mob_droplist where itemId = "19055"; -- macero_grip
DELETE from mob_droplist where itemId = "19033"; -- wind_grip
DELETE from mob_droplist where itemId = "19059"; -- quire_grip
DELETE from mob_droplist where itemId = "2413"; -- coiler
DELETE from mob_droplist where itemId = "2414"; -- steam_jacket
DELETE from mob_droplist where itemId = "3310"; -- barrier_module_ii
DELETE from mob_droplist where itemId = "3312"; -- percolator
DELETE from mob_droplist where itemId = "3313"; -- vivi-valve
DELETE from mob_droplist where itemId = "3314"; -- disruptor
DELETE from mob_droplist where itemId = "16278"; -- pipers_torque
DELETE from mob_droplist where itemId = "18596"; -- kebbie
DELETE from mob_droplist where itemId = "3090"; -- spheroid_plate
DELETE from mob_droplist where itemId = "3253"; -- high-quality_marid_hide
DELETE from mob_droplist where itemId = "4723"; -- scroll_of_enblizzard_ii
DELETE from mob_droplist where itemId = "3095"; -- worm-eaten_bud
DELETE from mob_droplist where itemId = "2511"; -- orc_pauldron
DELETE from mob_droplist where itemId = "2510"; -- orc_helmet
DELETE from mob_droplist where itemId = "3087"; -- handful_of_apkallu_down
DELETE from mob_droplist where itemId = "2920"; -- clump_of_alkaline_humus
DELETE from mob_droplist where itemId = "16173"; -- pallass_shield
DELETE from mob_droplist where itemId = "19257"; -- incantor_stone
DELETE from mob_droplist where itemId = "3503"; -- cirdas_visage_iv
DELETE from mob_droplist where itemId = "11606"; -- arctiers_torque
DELETE from mob_droplist where itemId = "5056"; -- scroll_of_wind_carol_ii
DELETE from mob_droplist where itemId = "3104"; -- opaque_wing
DELETE from mob_droplist where itemId = "3504"; -- peapuk_wing
DELETE from mob_droplist where itemId = "2897"; -- transparent_insect_wing
DELETE from mob_droplist where itemId = "3102"; -- stiffened_tentacle
DELETE from mob_droplist where itemId = "11608"; -- barcarolle_medal
DELETE from mob_droplist where itemId = "2900"; -- bug-eaten_hat
DELETE from mob_droplist where itemId = "9083"; -- mandragora_dewdrop
DELETE from mob_droplist where itemId = "2905"; -- square_of_moonglow_cloth
DELETE from mob_droplist where itemId = "18968"; -- bounty_sickle
DELETE from mob_droplist where itemId = "5100"; -- scroll_of_boost-chr
DELETE from mob_droplist where itemId = "19316"; -- fetter_lance
DELETE from mob_droplist where itemId = "2911"; -- ripped_eft_skin
DELETE from mob_droplist where itemId = "11446"; -- areions_gamashes
DELETE from mob_droplist where itemId = "18899"; -- runic_anelace
DELETE from mob_droplist where itemId = "15909"; -- cascade_belt
DELETE from mob_droplist where itemId = "3078"; -- cracked_dragonscale
DELETE from mob_droplist where itemId = "3084"; -- great_root
DELETE from mob_droplist where itemId = "4704"; -- scroll_of_auspice
DELETE from mob_droplist where itemId = "15033"; -- danzo_tekko
DELETE from mob_droplist where itemId = "18951"; -- vendetta
DELETE from mob_droplist where itemId = "3109"; -- high-quality_rabbit_hide
DELETE from mob_droplist where itemId = "2754"; -- ruszor_fang
DELETE from mob_droplist where itemId = "2755"; -- ruszor_hide
DELETE from mob_droplist where itemId = "3235"; -- sandy_shard
DELETE from mob_droplist where itemId = "11526"; -- bersail_cap
DELETE from mob_droplist where itemId = "5755"; -- slab_of_ruszor_meat
DELETE from mob_droplist where itemId = "2539"; -- tuft_of_dhalmel_hair
DELETE from mob_droplist where itemId = "3076"; -- handful_of_bone_chips
DELETE from mob_droplist where itemId = "16150"; -- saurian_helm
DELETE from mob_droplist where itemId = "3271"; -- fay_teardrop
DELETE from mob_droplist where itemId = "3269"; -- decaying_molar
DELETE from mob_droplist where itemId = "17856"; -- syrinx
DELETE from mob_droplist where itemId = "11287"; -- antares_harness
DELETE from mob_droplist where itemId = "19213"; -- white_tathlum
DELETE from mob_droplist where itemId = "18954"; -- ogre_sickle
DELETE from mob_droplist where itemId = "5682"; -- purple_polypore
DELETE from mob_droplist where itemId = "3231"; -- sharabha_hide
DELETE from mob_droplist where itemId = "11653"; -- keen_ring
DELETE from mob_droplist where itemId = "16320"; -- kensei_sitabaki
DELETE from mob_droplist where itemId = "11906"; -- wild_gages
DELETE from mob_droplist where itemId = "3101"; -- dented_skull
DELETE from mob_droplist where itemId = "3259"; -- high-quality_black_tiger_hide
DELETE from mob_droplist where itemId = "3265"; -- flask_of_bubbling_oil
DELETE from mob_droplist where itemId = "18801"; -- danger_grip
DELETE from mob_droplist where itemId = "3247"; -- sisyphus_fragment
DELETE from mob_droplist where itemId = "3094"; -- chunk_of_high-quality_rock_salt
DELETE from mob_droplist where itemId = "3103"; -- black_whisker
DELETE from mob_droplist where itemId = "11494"; -- circes_hat
DELETE from mob_droplist where itemId = "3252"; -- gelid_arm
DELETE from mob_droplist where itemId = "3107"; -- shockshroom
DELETE from mob_droplist where itemId = "3077"; -- set_of_wailing_rags
DELETE from mob_droplist where itemId = "3266"; -- darkflame_arm
DELETE from mob_droplist where itemId = "3251"; -- vial_of_gear_fluid
DELETE from mob_droplist where itemId = "19111"; -- silktone
DELETE from mob_droplist where itemId = "19216"; -- failnaught
DELETE from mob_droplist where itemId = "3254"; -- ice_wyvern_scale
DELETE from mob_droplist where itemId = "3230"; -- vial_of_tablilla_mercury
DELETE from mob_droplist where itemId = "11800"; -- cenobites_coiffe
DELETE from mob_droplist where itemId = "4850"; -- scroll_of_refresh_ii
DELETE from mob_droplist where itemId = "3260"; -- teekesselchen_fragment
DELETE from mob_droplist where itemId = "16309"; -- invidia_torque
DELETE from mob_droplist where itemId = "11907"; -- torrid_gages
DELETE from mob_droplist where itemId = "11364"; -- hachiryu_sune-ate
DELETE from mob_droplist where itemId = "11744"; -- cognizant_belt
DELETE from mob_droplist where itemId = "3080"; -- extended_eyestalk
DELETE from mob_droplist where itemId = "2836"; -- woolly_pelage
DELETE from mob_droplist where itemId = "2851"; -- bukktooth
DELETE from mob_droplist where itemId = "11557"; -- fortis_mantle
DELETE from mob_droplist where itemId = "11623"; -- noetic_torque
DELETE from mob_droplist where itemId = "3272"; -- unseelie_eye
DELETE from mob_droplist where itemId = "3246"; -- snow_god_core
DELETE from mob_droplist where itemId = "15910"; -- primal_belt
DELETE from mob_droplist where itemId = "17966"; -- erlkings_tabar
DELETE from mob_droplist where itemId = "3233"; -- vial_of_vadleany_fluid
DELETE from mob_droplist where itemId = "11444"; -- frisky_sabots
DELETE from mob_droplist where itemId = "16180"; -- harpy_shield
DELETE from mob_droplist where itemId = "19272"; -- yagentoshiro
DELETE from mob_droplist where itemId = "11572"; -- vita_cape
DELETE from mob_droplist where itemId = "11574"; -- potentia_cape
DELETE from mob_droplist where itemId = "19052"; -- divinus_grip
DELETE from mob_droplist where itemId = "11753"; -- emphatikos_rope
DELETE from mob_droplist where itemId = "11910"; -- derobade_mittens
DELETE from mob_droplist where itemId = "11899"; -- weald_gages
DELETE from mob_droplist where itemId = "2520"; -- yagudo_kote
DELETE from mob_droplist where itemId = "2519"; -- yagudo_osode
DELETE from mob_droplist where itemId = "2912"; -- giant_bugard_tusk
DELETE from mob_droplist where itemId = "10984"; -- tjukurrpa_mantle
DELETE from mob_droplist where itemId = "10941"; -- tjukurrpa_medal
DELETE from mob_droplist where itemId = "18610"; -- spiro_staff
DELETE from mob_droplist where itemId = "11048"; -- cytherea_pearl
DELETE from mob_droplist where itemId = "16026"; -- elan_earring
DELETE from mob_droplist where itemId = "2853"; -- malebolge_mandrel
DELETE from mob_droplist where itemId = "2842"; -- flawed_garnet
DELETE from mob_droplist where itemId = "2832"; -- samwells_shank
DELETE from mob_droplist where itemId = "2852"; -- ingot_of_tenebrium
DELETE from mob_droplist where itemId = "2845"; -- loop_of_aramid_fiber
DELETE from mob_droplist where itemId = "19160"; -- estramacon
DELETE from mob_droplist where itemId = "2834"; -- immortal_molt
DELETE from mob_droplist where itemId = "6012"; -- voidleg_sam
DELETE from mob_droplist where itemId = "3941"; -- chapuli_wing
DELETE from mob_droplist where itemId = "3932"; -- chapuli_horn
DELETE from mob_droplist where itemId = "6015"; -- voidleg_smn
DELETE from mob_droplist where itemId = "3930"; -- twitherym_wing
DELETE from mob_droplist where itemId = "6013"; -- voidleg_nin
DELETE from mob_droplist where itemId = "3938"; -- mantid_foreleg
DELETE from mob_droplist where itemId = "3928"; -- velkk_necklace
DELETE from mob_droplist where itemId = "6014"; -- voidleg_drg
DELETE from mob_droplist where itemId = "17967"; -- felling_axe
DELETE from mob_droplist where itemId = "6016"; -- voidleg_blu
DELETE from mob_droplist where itemId = "3933"; -- craklaw_pincer
DELETE from mob_droplist where itemId = "6018"; -- voidleg_pup
DELETE from mob_droplist where itemId = "6017"; -- voidleg_cor
DELETE from mob_droplist where itemId = "11528"; -- besieger_mantle
DELETE from mob_droplist where itemId = "6020"; -- voidleg_sch
DELETE from mob_droplist where itemId = "3929"; -- velkk_mask
DELETE from mob_droplist where itemId = "6019"; -- voidleg_dnc
DELETE from mob_droplist where itemId = "3935"; -- jar_of_umbril_ooze
DELETE from mob_droplist where itemId = "3917"; -- leafkin_frond
DELETE from mob_droplist where itemId = "18604"; -- astaroth_cane
DELETE from mob_droplist where itemId = "15941"; -- headlong_belt
DELETE from mob_droplist where itemId = "11339"; -- channeling_robe
DELETE from mob_droplist where itemId = "11338"; -- aegas_doublet
DELETE from mob_droplist where itemId = "2854"; -- stately_crab_shell
DELETE from mob_droplist where itemId = "16027"; -- seeker_earring
DELETE from mob_droplist where itemId = "16014"; -- stormer_earring
DELETE from mob_droplist where itemId = "18605"; -- melampus_staff
DELETE from mob_droplist where itemId = "2198"; -- water_spiders_web
DELETE from mob_droplist where itemId = "3550"; -- spool_of_wyrdstrand
DELETE from mob_droplist where itemId = "3096"; -- spotted_flyfrond
DELETE from mob_droplist where itemId = "2840"; -- imperial_topaz
DELETE from mob_droplist where itemId = "18607"; -- ceres_spica
DELETE from mob_droplist where itemId = "16186"; -- spellcasters_ecu
DELETE from mob_droplist where itemId = "19230"; -- nous_arbalest
DELETE from mob_droplist where itemId = "2857"; -- lump_of_tokkyu_tama-hagane
DELETE from mob_droplist where itemId = "19045"; -- succubus_grip
DELETE from mob_droplist where itemId = "16024"; -- impetus_earring
DELETE from mob_droplist where itemId = "16032"; -- muffle_earring
DELETE from mob_droplist where itemId = "3552"; -- squamous_hide
DELETE from mob_droplist where itemId = "18947"; -- molioness_sickle
DELETE from mob_droplist where itemId = "15014"; -- patricians_cuffs
DELETE from mob_droplist where itemId = "15818"; -- molioness_ring
DELETE from mob_droplist where itemId = "16319"; -- sangoma_lappas
DELETE from mob_droplist where itemId = "2837"; -- ratatoskr_pelt
DELETE from mob_droplist where itemId = "16030"; -- soarer_earring
DELETE from mob_droplist where itemId = "2833"; -- piece_of_thunder_coral
DELETE from mob_droplist where itemId = "2847"; -- blue_jasper
DELETE from mob_droplist where itemId = "2848"; -- grimy_bronze_sheet
DELETE from mob_droplist where itemId = "16018"; -- ataraxy_earring
DELETE from mob_droplist where itemId = "2841"; -- ingot_of_quadav_silver
DELETE from mob_droplist where itemId = "16023"; -- mystique_earring
DELETE from mob_droplist where itemId = "2838"; -- square_of_ephemeral_cloth
DELETE from mob_droplist where itemId = "16021"; -- brawn_earring
DELETE from mob_droplist where itemId = "2829"; -- square_of_radiant_velvet
DELETE from mob_droplist where itemId = "16025"; -- rathe_earring
DELETE from mob_droplist where itemId = "16016"; -- chary_earring
DELETE from mob_droplist where itemId = "16028"; -- psyche_earring
DELETE from mob_droplist where itemId = "2846"; -- piece_of_hefty_oak_lumber
DELETE from mob_droplist where itemId = "2831"; -- yellow_brass_chain
DELETE from mob_droplist where itemId = "2844"; -- penumbral_brass_ingot
DELETE from mob_droplist where itemId = "16015"; -- esse_earring
DELETE from mob_droplist where itemId = "16022"; -- fidelity_earring
DELETE from mob_droplist where itemId = "16033"; -- sylph_earring
DELETE from mob_droplist where itemId = "16020"; -- survivor_earring
DELETE from mob_droplist where itemId = "2828"; -- herensugue_skin
DELETE from mob_droplist where itemId = "11772"; -- oneiros_sash
DELETE from mob_droplist where itemId = "10972"; -- oneiros_cappa
DELETE from mob_droplist where itemId = "11773"; -- oneiros_belt
DELETE from mob_droplist where itemId = "10973"; -- oneiros_cape
DELETE from mob_droplist where itemId = "10983"; -- aifes_mantle
DELETE from mob_droplist where itemId = "10942"; -- aifes_medal
DELETE from mob_droplist where itemId = "19738"; -- aifes_bow
DELETE from mob_droplist where itemId = "2826"; -- mandragora_scale
DELETE from mob_droplist where itemId = "16031"; -- affinity_earring
DELETE from mob_droplist where itemId = "2740"; -- seedspall_lux