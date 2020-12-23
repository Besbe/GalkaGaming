 ---------------------------------------------------------------------------------------------------
-- func: chocobo
-- auth: <Unknown> :: Modded by Tagban
-- revised by: Sonicblazer
-- desc: Adds Chocobo 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};


function onTrigger(player)
	player:addKeyItem(tpz.ki.CHOCOBO_LICENSE)

local blockedZones =
    {
		0, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 26, 27, 28, 29, 30, 31, 32, 
		33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 48, 49, 50, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 
		69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 80, 86, 87, 92, 93, 94, 96, 99, 111, 112, 113, 126, 127, 129, 130, 131, 133, 
		134, 135, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 
		154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 
		172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 
		190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 
		208, 209, 210, 211, 212, 213, 214, 219, 220, 221, 222, 229, 230, 231, 232, 233, 234, 235, 
		236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 256, 
		257, 258, 259, 264, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 
		282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293 
    }

	    local word  = "";
    local i     = 0;
    local zoneID  = player:getZoneID();
	local blocked = false;

	-- gets the players current zone and does a loop check on the listed blocked zones
	for _, v in ipairs(blockedZones) do
        if(tonumber(zoneID) == v) then
			player:PrintToPlayer(string.format("You are not allowed to use a chocobo here, Kupo!"));
            blocked = true;
            return;	
        end
    end

	player:ChangeMusic(4, 212)
	-- Base duration 30 min, in seconds.
	local duration = 6400 + (player:getMod(tpz.mod.CHOCOBO_RIDING_TIME) * 60)

	player:addStatusEffectEx(tpz.effect.MOUNTED, tpz.effect.MOUNTED, 0, 0, duration, true)	
end;