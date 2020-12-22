---------------------------------------------------------------------------------------------------
-- func: setfame <player> <zone> <amount>
-- desc: sets target's level of fame
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "sii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setfame <player> <zone> <amount (2-9)>")
	player:PrintToPlayer("Zone Options: 1: San d'Oria, 2: Bastok, 3: Windurst, 4: Jeuno, 5: Selbina/Rabao, 6: Norg, 7: ALL")
end

function onTrigger(player, target, zone, amount)
    if (target == nil or zone == nil or amount == nil) then
        error(player, "You did not enter every value!")
        return
    end

	if (zone < 1 or zone > 7) then
		error(player, "Incorrect zone chosen, please pick from the list!")
		return
	end

	local zoneID = zone - 1;

	if (amount < 2 or amount > 9) then
		error(player, "Incorrect amount chosen, please choose between 2-9!")
		return
	end

	--Validate the target..
    local targ = GetPlayerByName(target)
    if (targ == nil) then
        player:PrintToPlayer(string.format( "Invalid player '%s' given.", target))
        return
    end

	local amountValue = 0

	if (amount == 2) then
		amountValue = 50
	elseif(amount == 3) then
		amountValue = 125
	elseif(amount == 4) then
		amountValue = 225
	elseif(amount == 5) then
		amountValue = 325
	elseif(amount == 6) then
		amountValue = 425
	elseif(amount == 7) then
		amountValue = 488
	elseif(amount == 8) then
		amountValue = 550
	elseif(amount == 9) then
		amountValue = 613
	end

	-- Set the Fame
	if(zoneID == 6) then -- Handles the "ALL"
		targ:setFame(0, amountValue)
		targ:setFame(1, amountValue)
		targ:setFame(2, amountValue)
		targ:setFame(3, amountValue)
		targ:setFame(4, amountValue)
		targ:setFame(5, amountValue)
	else
		targ:setFame(zoneID, amountValue)
	end
	player:PrintToPlayer("You have set their fame.")

end