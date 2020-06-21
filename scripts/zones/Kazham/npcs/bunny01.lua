-----------------------------------
-- Area: Kazham
-- NPC: Bunny in the pen
-- Non interactable NPC
-----------------------------------
require("scripts/globals/pathfind")

local path =
{
    {103.000, -14.000, -100.000, 0, 0},
    {102.000, -14.000, -103.600, 0, 0},
    {101.000, -14.000, -101.000, 0, 0},
    { 97.000, -14.000, -103.500, 0, 0},
    { 97.500, -14.000, -100.000, 0, 0},
    { 95.500, -14.000, -100.000, 0, 0},
}

function onSpawn(npc)
    npc:initNpcPathing(path[1][1], path[1][2], path[1][3])
    onPath(npc)
end

function onPath(npc)
    tpz.path.randomPoint(npc, path, 0)
end
