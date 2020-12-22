---------------------------------------------------------------------------------------------------
-- func: zilart
-- desc: guides you through the Zilart missions
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

	-- Jakoh Wahcondalo pos    
		if (zoneId == 1) then
				player:setPos( 100, -15, -112, 67, 250 );
				player:PrintToPlayer("Talk to Jakoh Wahcondalo in Kazham to obtain the KeyItem Sacrificial Chamber Key");
			return;
		end	

	-- Outside Chamber for fight
		if (zoneId == 2) then
				player:setPos( -83, 46, 61, 125, 160 );
				player:PrintToPlayer("Zone into Sacrificial Chamber for fight");
			return;
		end

	-- monument
		if (zoneId == 3) then
				player:setPos( -170, 39, -506, 89, 102 );
			return;
		end

		-- Monument    
		if (zoneId == 4) then
				player:setPos( -108, 11, -218, 103, 125 );
			return;
		end	

	-- Monument
		if (zoneId == 5) then
				player:setPos( -106, -8, 448, 157, 113 );
				player:PrintToPlayer("Check the Monument");
			return;
		end

	-- Monument
		if (zoneId == 6) then
				player:setPos( 562, 0, 607, 33, 203 );
				player:PrintToPlayer("Check the Monument");
			return;
		end	

	-- Monument
		if (zoneId == 7) then
				player:setPos( 237, 0, 279, 117, 121 );
				player:PrintToPlayer("Check the Monument");
			return;
		end	

	-- Monument
		if (zoneId == 8) then
				player:setPos( 492, 20, 300, 195, 123 );
				player:PrintToPlayer("Check the Monument");
			return;
		end	

	-- Monument   
		if (zoneId == 9) then
				player:setPos( -76, -4, -84, 47, 127 );
				player:PrintToPlayer("Check the Monument for the Final Fragment");
				player:PrintToPlayer("Your mission should change now!");
			return;
		end	

	-- Chamber of Oracles
		if (zoneId == 10) then
				player:setPos( -981, 17, -288, 195, 208 );
				player:PrintToPlayer("Once you complete this Fight");
				player:PrintToPlayer("Put all the Fragments into the slots.");
			return;
		end

	-- Top of Delfuts tower
		if (zoneId == 11) then
				player:setPos( -360, -175, -36, 39, 158 );
				player:PrintToPlayer("If you havent got the warp crystal get it");
				player:PrintToPlayer("Zone into the Sellar Fulcrum Again for a battle");
			return;
		end	
	-- Ro'maeve outside hall    
		if (zoneId == 12) then
				player:setPos( 0, -32, 123, 62, 122 );
				player:PrintToPlayer("Zone into the Hall of the Gods and Head to the Door");
			return;
		end	

	-- western altepa
		if (zoneId == 13) then
				player:setPos( -500, 21, -415, 105, 208 );
				player:PrintToPlayer("Touch the ??? For battle, after fight");
				player:PrintToPlayer("Make sure you get the keyitem Scrap of papyrus");
			return;
		end
	else
		player:PrintToPlayer( string.format( "You've been a bad, bad person. You are staying here for a while, kupo!", target ) );
	end
end 