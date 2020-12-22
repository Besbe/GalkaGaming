---------------------------------------------------------------------------------------------------
-- func: cop
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, zoneId)
    local word  = "";
    local i     = 0;
    local zone  = zoneId;

	if (player:getCharVar( 'inJail' ) == 0) then	
		if (zoneId == nil) then
			player:PrintToPlayer("You must enter a zone id.");
			return;
		end

	-- Qufim   
		if (zoneId == 1) then
				player:setPos( -249.3749, -20, 320.8015, 128, 126 );
				player:PrintToPlayer("Zone into Delfuts Tower for CS");
			return;
		end	

	--  monberaux npc
		if (zoneId == 2) then
				player:setPos( -45, 0, 0, 10, 244 );
				player:PrintToPlayer("Talk with Monberaux");
			return;
		end

	--  Pherimociel in ru 'lude gardens
		if (zoneId == 3) then
				player:setPos( -30, 2, 67, 181, 243 );
				player:PrintToPlayer("Talk with Pherimociel");
			return;
		end
	-- Harith  ru lude gardens    
		if (zoneId == 4) then
				player:setPos( -1, 2, 133, 114, 243 );
				player:PrintToPlayer("Talk with Harith");
			return;
		end	

	-- spire of dem zone
		if (zoneId == 5) then
				player:setPos( 0, -2, 289, 225, 19 );
				player:PrintToPlayer("Prepare for Fight!");
			return;
		end

	-- Spire of holla
		if (zoneId == 6) then
				player:setPos( 1, -1, -271, 192, 17 );
				player:PrintToPlayer("Prepare for Fight");
			return;
		end	
	-- Spire of Mea    
		if (zoneId == 7) then
				player:setPos( -1, -2, 292, 64, 21 );
				player:PrintToPlayer("Prepare for The last fight, Congrats thus far");
			return;
		end	

	-- Lufaise Meadows outside Stronghold
		if (zoneId == 8) then
				player:setPos( -398, 0, -220, 15, 24 );
				player:PrintToPlayer("Zone into Tav. Stronghold for CS");
			return;
		end

	-- walnut door inside stronghold
		if (zoneId == 9) then
				player:setPos( 102, -40, -55, 62, 26 );
				player:PrintToPlayer("Touch the Walnut door for CS");
			return;
		end	

	-- Inside stronghold outside of auqaducts     
		if (zoneId == 10) then
				player:setPos( 27, -12, 40, 193, 26 );
				player:PrintToPlayer("Touch the Door leading to the Aquaducts for CS");
			return;
		end	

	-- Near Minotaur
		if (zoneId == 11) then
				player:setPos( 40, 1, 260, 6, 27 );
				player:PrintToPlayer("Watch for Agro, Minotaur fight!!");
			return;
		end

	-- Ladder CS
		if (zoneId == 12) then
				player:setPos( -153, -1, 60, 131, 27 );
				player:PrintToPlayer("Touch ladder for CS");
			return;
		end	

	-- Bookshelf ???
		if (zoneId == 13) then
				player:setPos( -73, -24, 90, 200, 27 );
				player:PrintToPlayer("Bookshelf @ F-7, Touch the ??? to open the secret door");
			return;
		end

	-- secret room
		if (zoneId == 14) then
				player:setPos( -79, -24, 60, 128, 27 );
				player:PrintToPlayer("Touch the Ornate Gate");
			return;
		end	

	-- Justinius
		if (zoneId == 15) then
				player:setPos( 76, -34, 68, 203, 26 );
				player:PrintToPlayer("Talk to Justinius J-6");
			return;
		end

	-- Misareaux coast dilapitated gate
		if (zoneId == 16) then
				player:setPos( 261, 10, -435, 85, 25 );
				player:PrintToPlayer("Check the Dilapidated Gate for CS");
			return;
		end		

	-- Bridge inside stronghold
		if (zoneId == 17) then
				player:setPos( -28, -27, 123, 8, 26 );
				player:PrintToPlayer("Return to Tavnazian Safehold walk toward the Bridge for CS");
			return;
		end			
	-- Dilapidated Gate F-7
		if (zoneId == 18) then
				player:setPos( -259, -30, 274, 177, 25 );
				player:PrintToPlayer("Check the Dilapidated Gate and head to D-6 Spatial Displacement");
			return;
		end			
	-- Monarch Linn
		if (zoneId == 19) then
				player:setPos( 12, 0, -539, 127, 31 );
				player:PrintToPlayer("Mammets Fight!");
			return;
		end	
	-- cid
		if (zoneId == 20) then
				player:setPos( -31, -10, -1, 7, 237 );
				player:PrintToPlayer("Talk with Cid");
			return;
		end			
	-- talk to Arnau
		if (zoneId == 21) then
				player:setPos( 147, 0, 137, 231, 231 );
				player:PrintToPlayer("Talk to Arnau");
			return;
		end			
	-- Carpenter's Landing NM fight
		if (zoneId == 22) then
				player:setPos( -116, -6, -470, 170, 2 );
				player:PrintToPlayer("Talk with Guilloud to spawn NM's, After the fight talk to him again.");
			return;
		end			
	-- talk to  Hinaree south sandy
		if (zoneId == 23) then
				player:setPos( -302, -9, 94, 189, 230 );
				player:PrintToPlayer("Talk to  Hinaree");
			return;
		end			
	-- win waters and talk to ohbiru-dohbiru
		if (zoneId == 24) then
				player:setPos( 22, -5, -193, 44, 238 );
				player:PrintToPlayer("Talk to ohbiru-dohbiru");
			return;
		end			
	-- talk to yoran-Oran
		if (zoneId == 25) then
				player:setPos( -109, -13, 202, 177, 239 );
				player:PrintToPlayer("Talk to yoran-Oran");
			return;
		end			
	-- talk to Kyume-Romeh
		if (zoneId == 26) then
				player:setPos(  -57, -3, 22, 216, 238 );
				player:PrintToPlayer("Talk to Kyume-Romeh");
			return;
		end			
	-- talk to Honoi-Gomoi to recieve a KI
		if (zoneId == 27) then
				player:setPos( -194, -10, -120, 52, 238 );
				player:PrintToPlayer("Talk to Honoi-Gomoi to recieve a KI");
			return;
		end			
	-- loose sand attowha
		if (zoneId == 28) then
				player:setPos( 480, 20, 37, 174, 7 );
				player:PrintToPlayer("Click the loose sand to pop NM, once killed youll be on top of the mountain click the point in front of you to get 3 KI");
			return;
		end			
	-- Yujuju in port windurst
		if (zoneId == 29) then
				player:setPos( 201, -5, 136, 173, 240 );
				player:PrintToPlayer("Talk to  Yujuju, You may have to talk twice");
			return;
		end			
	-- Tosuka Porika
		if (zoneId == 30) then
				player:setPos( -26, -5, 103, 157, 238 );
				player:PrintToPlayer("Talk to Tosuka Porika");
			return;
		end			
	-- get a grey chip from the spiders
		if (zoneId == 31) then
				player:setPos( 125, 0, 68, 129, 9);
				player:PrintToPlayer("Get a grey chip from the spiders");
			return;
		end			
	-- Diablos fight
		if (zoneId == 32) then
				player:setPos( -59, 40, 9, 74, 9 );
				player:PrintToPlayer("Grab the hp crystal and head to maw for Diablos Fight");
			return;
		end			
	-- Despachiaire
		if (zoneId == 33) then
				player:setPos( 110, -40, -83, 51, 26 );
				player:PrintToPlayer("Talk to Despachiaire, make sure its CS with tenzen");
			return;
		end			
	-- Dilapidated Gate
		if (zoneId == 34) then
				player:setPos( 260, 10, -435, 67, 25 );
				player:PrintToPlayer("Check the Dilapidated Gate");
			return;
		end			
	-- Dilaptidated gate to site b
		if (zoneId == 35) then
				player:setPos( -257, -30, 275, 180, 25 );
				player:PrintToPlayer("Check the Dilapidated Gate and head to Rivine Site B");
			return;
		end			
	-- BCNM ouryu fight
		if (zoneId == 36) then
				player:setPos( -6, 0, -538, 128, 31 );
				player:PrintToPlayer("BCNM Ouryu fight");
			return;
		end			
	-- sancrum entrance
		if (zoneId == 37) then
				player:setPos( 46, -24, 739, 255, 25 );
				player:PrintToPlayer("click on door");
			return;
		end			
	-- near formars in sacrum
		if (zoneId == 38) then
				player:setPos( 15, 0, 59, 224, 28 );
				player:PrintToPlayer("Kill Formar's for coral crest key");
			return;
		end			
	-- outside pso xjo
		if (zoneId == 39) then
				player:setPos( -340, -100, 137, 250, 111 );
				player:PrintToPlayer("Enter Pso'Xja for a CS");
			return;
		end			
	-- tenzen path la theine
		if (zoneId == 40) then
				player:setPos( -180, 8, 246, 196, 102 );
				player:PrintToPlayer("Tenzen path, Click the ??? for CS at G-6");
			return;
		end			
	-- outside pso for tenzen path
		if (zoneId == 41) then
				player:setPos( 266, 0, -18, 140, 111 );
				player:PrintToPlayer("Zone into Pso xjo for CS");
			return;
		end			
	-- avatar door tenzen path
		if (zoneId == 42) then
				player:setPos( 281, 32, -60, 121, 9 );
				player:PrintToPlayer("Touch the avatar door for cs");
			return;
		end			
	-- Battalia
		if (zoneId == 43) then
				player:setPos( 423, 8, -162, 46, 105 );
				player:PrintToPlayer("Touch the ??? for cs, then a second time for a KI Delkfutt Recognition Device");
				player:PrintToPlayer("Make sure you examine ??? TWICE");
			return;
		end			
	-- lower delfuts gate tenzen path
		if (zoneId == 44) then
				player:setPos( 459, 0, 130, 54, 184 );
				player:PrintToPlayer("Check the gate to spawn NM, Check after the fight for a cutscene");
			return;
		end	
	-- outside pso xo tenzen path
		if (zoneId == 45) then
				player:setPos( 59, 0, -324, 67, 111 );
				player:PrintToPlayer("Zone into pso jxo get cs");
			return;
		end			
	-- avatar gate pso 
		if (zoneId == 46) then
				player:setPos( 140, 48, -355, 68, 9 );
				player:PrintToPlayer("Check the Avatar Gate");
			return;
		end			
	-- Boneyard Gully fight second path
		if (zoneId == 47) then
				player:setPos(  -709, 20, 456, 24, 8 );
				player:PrintToPlayer(" Head across the clearing to the north to find a wall of Dark Miasma");
				player:PrintToPlayer("Click on it to enter the Battlefield");
			return;
		end			
	-- Bearclaw penn.
		if (zoneId == 48) then
				player:setPos( -680, 18, -540, 129, 6 );
				player:PrintToPlayer("This is another Fight, After head to Cid cop 20");
			return;
		end			
	-- oldton movolopolololos
		if (zoneId == 49) then
				player:setPos( 70, 8, 139, 134, 11 );
				player:PrintToPlayer("You should get a cs, if not zone out and zone back in.");
			return;
		end			
	-- Mine shaft third path
		if (zoneId == 50) then
				player:setPos( -116, -119, -620, 253, 13 );
				player:PrintToPlayer("Fight, after the fight talk to cid cop 20");
			return;
		end			
	-- Dilapidated Gate mis coast fight 3 motherglobe things
		if (zoneId == 51) then
				player:setPos( 264, 11, -429, 61, 25 );
				player:PrintToPlayer("Check the Dilapidated Gate for a fight, after touch gate again.");
			return;
		end			
	-- mis coast storage shed 
		if (zoneId == 52) then
				player:setPos( -311, -32, 184, 53, 25 );
				player:PrintToPlayer("Check the Storage Compartment at the shed E-7 to spawn the NM bugard Boggelmann.");
			return;
		end			
	-- fight at carptenter landing almost at sea
		if (zoneId == 53) then
				player:setPos( 119, -3, -388, 217, 2 );
				player:PrintToPlayer("Buff up and select the ??? to spawn the NM-Cryptonberry Executor");
			return;
		end			
	-- bibiki bay octupus fight
		if (zoneId == 54) then
				player:setPos( 97, -44, 940, 226, 4 );
				player:PrintToPlayer("Last Fight, almost have Sea Access!!");
			return;
		end				
	else
		player:PrintToPlayer( string.format( "You've been a bad, bad person. You are staying here for a while, kupo!", target ) );
	end
end 