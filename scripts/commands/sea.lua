---------------------------------------------------------------------------------------------------
-- func: @sea <nm>
-- auth: Sonicblazer
-- desc: Consolidate sea warp
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "s"
};


function onTrigger(player, nm)

	if (nm == "drk1") then
		player:setPos(-574, 0, 411, 162, 35); -- Ix'aern Drk#1
	elseif (nm == "drk2") then
		player:setPos(-262, 0, 412, 220, 35); -- Ix'aern Drk#2
	elseif (nm == "drk3") then
		player:setPos(-300, 0, 266, 37, 35); -- Ix'aern Drk#3
	elseif (nm == "drk4") then
		player:setPos(-538, 0, 266, 87, 35); -- Ix'aern Drk#4			
	elseif (nm == "mnk1") then
		player:setPos(458, 0, 540, 253, 34); -- Ix'aern Mnk#1	
	elseif (nm == "mnk2") then
		player:setPos(394, 0, 539, 131, 34); -- Ix'aern Mnk#2
	elseif (nm == "drg1") then
		player:setPos(-494, 0, -388, 165, 35); -- Ix'aern Drg#1
	elseif (nm == "drg2") then
		player:setPos(-344, 0, -387, 221, 35); -- Ix'aern Drg#2
	elseif (nm == "drg3") then
		player:setPos(-499, 0, -545, 165, 35); -- Ix'aern Drg#3
	elseif (nm == "drg4") then
		player:setPos(-339, 0, -546, 215, 35); -- Ix'aern Drg#4	
	elseif (nm == "fort1") then
		player:setPos(-420, 0, 753, 192, 35); -- Jailer of Fort#1
	elseif (nm == "fort2") then
		player:setPos(-794, 0, 460, 128, 35); -- Jailer of Fort#2
	elseif (nm == "fort3") then
		player:setPos(-46, 0, 459, 250, 35); -- Jailer of Fort#3
	elseif (nm == "fort4") then
		player:setPos(-579, 0, 46, 62, 35); -- Jailer of Fort#4
	elseif (nm == "fort5") then
		player:setPos(-259, 0, 48, 64, 35); -- Jailer of Fort#5
	elseif (nm == "temp1") then
		player:setPos(-415, 0, 744, 166, 34); -- Jailer of Temp#1
	elseif (nm == "temp2") then
		player:setPos(-784, 0, 464, 97, 34); -- Jailer of Temp#2
	elseif (nm == "temp3") then
		player:setPos(-584, 0, 54, 36, 34); -- Jailer of Temp#3
	elseif (nm == "temp4") then
		player:setPos(-264, 0, 55, 27, 34); -- Jailer of Temp#4
	elseif (nm == "temp5") then
		player:setPos(-54, 0, 455, 232, 34); -- Jailer of Temp#5
	elseif (nm == "faith1") then
		player:setPos(-424, 0, -144, 30, 35); -- Jailer of Faith#1
	elseif (nm == "faith2") then
		player:setPos(-695, 0, -344, 220, 35); -- Jailer of Faith#2
	elseif (nm == "faith3") then
		player:setPos(-575, 0, -655, 156, 35); -- Jailer of Faith#3
	elseif (nm == "faith4") then
		player:setPos(-255, 0, -655, 164, 35); -- Jailer of Faith#4
	elseif (nm == "faith5") then
		player:setPos(-144, 0, -355, 103, 35); -- Jailer of Faith#5
	elseif (nm == "justice") then
		player:setPos(-257, 0, -449, 154, 33); -- Jailer of Justice
	elseif (nm == "hope") then
		player:setPos(-709, 0, -101, 3, 33); -- Jailer of Hope
	elseif (nm == "prudence") then
		player:setPos(662, 0, -27, 223, 33); -- Jailer of Prud
	elseif (nm == "love") then
		player:setPos(469, 0, -566, 83, 33); -- Jailer of Love
	elseif (nm == "av") then
		player:setPos(469, 0, -566, 83, 33); -- Absolute Virtue
	elseif (nm == nil) then
		player:PrintToPlayer("@sea drk mnk drg fort temp faith justice hope prudence love av");
	end
end; 