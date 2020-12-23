---------------------------------------------------------------------------------------------------
-- func: setcraftlevel <craft skill or ID> <craft level> <target>
-- desc: sets target's level of specified craft skill
-- courtesy of coreyms/topaz
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 3,
    parameters = "sis"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setcraftlevel <craft skill or ID> <craft level> {player}")
end

function onTrigger(player, craftName, level, target)
    if craftName == nil then
        error(player, "You must specify a craft skill to set!")
        return
    end

    local skillID = tonumber(craftName) or tpz.skill[string.upper(craftName)]
    local targ = nil

    if skillID == nil or skillID < 48 or skillID > 57 then
        error(player, "You must specify a valid craft skill.")
        return
    end

    if level == nil then
        error(player, "You must specify a level to set the craft skill to.")
        return
    end

    local craftlevel = tonumber(level) * 10 -- or tpz.craftlevel[string.upper(level)]
    if craftlevel == nil then
        error(player, "Invalid craft level!")
        return
    end

    if target == nil then
        if player:getCursorTarget() == nil then
            targ = player
        else
            if player:getCursorTarget():isPC() then
                targ = player:getCursorTarget()
            else
                error(player, "You must target a player or specify a name.")
                return
            end
        end
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            player:PrintToPlayer(string.format("Player named '%s' not found!", target))
            return
        end
    end

    targ:setSkillLevel(skillID, craftlevel)
    targ:PrintToPlayer(string.format("Your %s level has been adjusted to: %i", craftName, craftlevel / 10))
    if targ ~= player then
        player:PrintToPlayer(string.format("%s's new '%s' level: %i", targ:getName(), craftName, craftlevel / 10))
    end
end