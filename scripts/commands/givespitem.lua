---------------------------------------------------------------------------------------------------
-- func: givespitem <player> <item name>
-- desc: Gives a special item to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "ss"
}

function onTrigger(player, target, itemName)

	if(target == nil) then
		player:PrintToPlayer("You must enter a valid player name and item name.")
		player:PrintToPlayer("!givespitem <player> <item name>")
		player:PrintToPlayer("For list of items, do: !givespitem list")
		return
	end

    if (itemName == nil) then
		if (target == "list") then
			player:PrintToPlayer("alchemistsapron, caduceus, protectivespectacles, boneworkersapron, magnifyingspectacles, weaversapron, chefshat, culinariansapron,")
			player:PrintToPlayer("shadedspectacles, goldsmithsapron, tannersapron, tannersgloves, blacksmithsapron, smithysmitts, carpentersapron, carpentersgloves,")
		else
			player:PrintToPlayer("You must enter a valid player name and item name.")
			player:PrintToPlayer("!givespitem <player> <item name>")
			player:PrintToPlayer("For list of items, do: !givespitem list")
        end
		return
    end

    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) )
        return
    end

    if (targ:getFreeSlotsCount() == 0) then
        player:PrintToPlayer( string.format( "Player '%s' does not have free space for those items!", target ) )
    else
		if (itemName == "alchemistsapron") then
			 targ:addItem(14398)
		elseif (itemName == "caduceus") then
			 targ:addItem(17058)
		elseif (itemName == "protectivespectacles") then
			 targ:addItem(13947)
		elseif (itemName == "boneworkersapron") then
			 targ:addItem(14397)
		elseif (itemName == "magnifyingspectacles") then
			 targ:addItem(13946)
		elseif (itemName == "weaversapron") then
			 targ:addItem(14395)
		elseif (itemName == "chefshat") then
			 targ:addItem(13948)
		elseif (itemName == "culinariansapron") then
			 targ:addItem(14399)
		elseif (itemName == "shadedspectacles") then
			 targ:addItem(13945)
		elseif (itemName == "goldsmithsapron") then
			 targ:addItem(14394)
		elseif (itemName == "tannersapron") then
			 targ:addItem(14396)
		elseif (itemName == "tannersgloves") then
			 targ:addItem(14832)
		elseif (itemName == "blacksmithsapron") then
			 targ:addItem(14393)
		elseif (itemName == "smithysmitts") then
			 targ:addItem(14831)
		elseif (itemName == "carpentersapron") then
			 targ:addItem(14392)
		elseif (itemName == "carpentersgloves") then
			 targ:addItem(14830)
		else
			player:PrintToPlayer("You must specify a valid item name, !givespitem list")
		end	 
        player:PrintToPlayer( string.format( "Gave player '%s' the gear for '%s' ", target, itemName ) )
    end
end
