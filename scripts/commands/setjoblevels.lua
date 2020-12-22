---------------------------------------------------------------------------------------------------
-- func: setjoblevels
-- desc: Changes the players job(s) to desired level.
-- example: !setjoblevels <target> <level> <job1> <job2> <job3> <job4>
-- author: Tonzoffun
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = "sissss"
}

function onTrigger(player, target, lvl, job1, job2, job3, job4)

	local targ
	local level
	local numJobs

	if(target == nil or lvl == nil or job1 == nil) then
		player:PrintToPlayer("!setjoblevels <target> <level> <job1> <job2> <job3> <job4>")
		return
	end

	targ = GetPlayerByName(target)
	if(targ == nil) then
		player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) )
		player:PrintToPlayer("!setjoblevels <target> <level> <job1> <job2> <job3> <job4>")
		return
	end

	level = tonumber(lvl)
	if(level == nil or level < 1 or level > 75) then
		player:PrintToPlayer("You must specify a level 1-75.")
		player:PrintToPlayer("!setjoblevels <target> <level> <job1> <job2> <job3> <job4>")
		return
	end

	numJobs = 1

	if(job2 ~= nil and job3 == nil and job4 == nil) then
		numJobs = 2
	end
	if(job2 ~= nil and job3 ~= nil and job4 == nil) then
		numJobs = 3
	end
	if(job2 ~= nil and job3 ~= nil and job4 ~= nil) then
		numJobs = 4
	end

	job1 = tonumber(job1) or tpz.job[string.upper(job1)]
	if (job1 <= 0 or job1 > 20) then
       player:PrintToPlayer(string.format("Invalid job '%s' given. Use short-name or id. e.g. WAR", job1))
       return
	end

	if(numJobs > 1) then
		job2 = tonumber(job2) or tpz.job[string.upper(job2)]
		if (job2 <= 0 or job2 > 20) then
		   player:PrintToPlayer(string.format("Invalid job '%s' given. Use short-name or id. e.g. WAR", job2))
		   return
		end
	end

	if(numJobs > 2) then
		job3 = tonumber(job3) or tpz.job[string.upper(job3)]
		if (job3 <= 0 or job3 > 20) then
		   player:PrintToPlayer(string.format("Invalid job '%s' given. Use short-name or id. e.g. WAR", job3))
		   return
		end
	end

	if(numJobs > 3) then
		job4 = tonumber(job4) or tpz.job[string.upper(job4)]
		if (job4 <= 0 or job4 > 20) then
		   player:PrintToPlayer(string.format("Invalid job '%s' given. Use short-name or id. e.g. WAR", job4))
		   return
		end	
	end

	if(job2 == nil) then
		job2 = 0
	elseif(job3 == nil) then
		job3 = 0
	elseif(job4 == nil) then
		job4 = 0
	end

	if(job1 == 7 or job2 == 7 or job3 == 7 or job4 == 7) then -- PLD
		targ:unlockJob(tpz.job.PLD)
		targ:addQuest(SANDORIA, tpz.quest.id.sandoria.A_SQUIRE_S_TEST)
		targ:completeQuest(SANDORIA, tpz.quest.id.sandoria.A_SQUIRE_S_TEST)
		targ:addQuest(SANDORIA,tpz.quest.id.sandoria.A_SQUIRE_S_TEST_II)
		targ:completeQuest(SANDORIA,tpz.quest.id.sandoria.A_SQUIRE_S_TEST_II)
		targ:addQuest(SANDORIA, tpz.quest.id.sandoria.A_KNIGHT_S_TEST)		
		targ:completeQuest(SANDORIA, tpz.quest.id.sandoria.A_KNIGHT_S_TEST)
	end
	if(job1 == 8 or job2 == 8 or job3 == 8 or job4 == 8) then -- DRK
		targ:unlockJob(tpz.job.DRK)
		targ:addQuest(BASTOK, tpz.quest.id.bastok.BLADE_OF_DARKNESS)
		targ:setCharVar("ZeruhnMines_Zeid_CS", 0)
        targ:completeQuest(BASTOK, tpz.quest.id.bastok.BLADE_OF_DARKNESS)
	end
	if(job1 == 9 or job2 == 9 or job3 == 9 or job4 == 9) then -- BST
		targ:unlockJob(tpz.job.BST)
		targ:addQuest(JEUNO,tpz.quest.id.jeuno.PATH_OF_THE_BEASTMASTER)
		targ:completeQuest(JEUNO,tpz.quest.id.jeuno.PATH_OF_THE_BEASTMASTER)
	end
	if(job1 == 10 or job2 == 10 or job3 == 10 or job4 == 10) then -- BRD 
		targ:unlockJob(tpz.job.BRD)
		targ:addQuest(JEUNO,tpz.quest.id.jeuno.THE_OLD_MONUMENT)
		targ:completeQuest(JEUNO,tpz.quest.id.jeuno.THE_OLD_MONUMENT)
		targ:addQuest(JEUNO,tpz.quest.id.jeuno.A_MINSTREL_IN_DESPAIR)
		targ:completeQuest(JEUNO,tpz.quest.id.jeuno.A_MINSTREL_IN_DESPAIR)
		targ:addQuest(JEUNO,tpz.quest.id.jeuno.PATH_OF_THE_BARD)
		targ:setCharVar("PathOfTheBard_Event",0)
        targ:completeQuest(JEUNO,tpz.quest.id.jeuno.PATH_OF_THE_BARD)
	end
	if(job1 == 11 or job2 == 11 or job3 == 11 or job4 == 11) then -- RNG
		targ:unlockJob(tpz.job.RNG)
		targ:addQuest(WINDURST,tpz.quest.id.windurst.THE_FANGED_ONE)
		targ:setCharVar("TheFangedOne_Event",0)
		targ:setCharVar("TheFangedOneCS",0)
		targ:completeQuest(WINDURST,tpz.quest.id.windurst.THE_FANGED_ONE)
	end
	if(job1 == 12 or job2 == 12 or job3 == 12 or job4 == 12) then -- SAM
		targ:unlockJob(tpz.job.SAM)
		targ:addQuest(OUTLANDS, tpz.quest.id.outlands.FORGE_YOUR_DESTINY)
		targ:setCharVar("ForgeYourDestiny_timer",0)
		targ:setCharVar("ForgeYourDestiny_Event",0)
		targ:completeQuest(OUTLANDS, tpz.quest.id.outlands.FORGE_YOUR_DESTINY)
	end
	if(job1 == 13 or job2 == 13 or job3 == 13 or job4 == 13) then -- NIN
		targ:unlockJob(tpz.job.NIN)
		targ:addQuest(BASTOK,tpz.quest.id.bastok.AYAME_AND_KAEDE)
		targ:setCharVar("AyameAndKaede_Event", 0)
		targ:completeQuest(BASTOK,tpz.quest.id.bastok.AYAME_AND_KAEDE)
	end
	if(job1 == 14 or job2 == 14 or job3 == 14 or job4 == 14) then -- DRG
		targ:unlockJob(tpz.job.DRG)
		targ:addQuest(SANDORIA,tpz.quest.id.sandoria.THE_HOLY_CREST)
		targ:setCharVar("TheHolyCrest_Event",0)
        targ:completeQuest(SANDORIA,tpz.quest.id.sandoria.THE_HOLY_CREST)
		targ:setPetName(tpz.pet.type.WYVERN,2) -- set's pet name to first pet name, can change this in db
	end
	if(job1 == 15 or job2 == 15 or job3 == 15 or job4 == 15) then -- SMN
		targ:unlockJob(tpz.job.SMN)
		targ:addQuest(WINDURST, tpz.quest.id.windurst.I_CAN_HEAR_A_RAINBOW)
		targ:completeQuest(WINDURST, tpz.quest.id.windurst.I_CAN_HEAR_A_RAINBOW)
		targ:addSpell(296, true)
		targ:setCharVar("ICanHearARainbow",0)
	end
	if(job1 == 16 or job2 == 16 or job3 == 16 or job4 == 16) then -- BLU
		targ:unlockJob(tpz.job.BLU)
		targ:addQuest(AHT_URHGAN,tpz.quest.id.ahtUrhgan.AN_EMPTY_VESSEL)
		targ:setCharVar("EmptyVesselStone",0)
        targ:addKeyItem(tpz.ki.MARK_OF_ZAHAK)
        targ:completeQuest(AHT_URHGAN,tpz.quest.id.ahtUrhgan.AN_EMPTY_VESSEL)
	end
	if(job1 == 17 or job2 == 17 or job3 == 17 or job4 == 17) then -- COR
		targ:unlockJob(tpz.job.COR)
		targ:addQuest(AHT_URHGAN,tpz.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW)
		targ:setCharVar("LuckOfTheDraw",5) -- var will remain for af quests
        targ:completeQuest(AHT_URHGAN,tpz.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW)
	end
	if(job1 == 18 or job2 == 18 or job3 == 18 or job4 == 18) then -- PUP
		targ:unlockJob(tpz.job.PUP)
		targ:addQuest(AHT_URHGAN,tpz.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED)
		targ:completeQuest(AHT_URHGAN,tpz.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED)
		targ:addItem(17859)
		targ:setCharVar("NoStringsAttachedProgress",0)
		targ:setPetName(tpz.pet.type.AUTOMATON, 120) -- set's to first puppet name, can change this in db
		targ:unlockAttachment(8224) --Harlequin Frame
		targ:unlockAttachment(8193) --Harlequin Head
	end
	if(job1 == 19 or job2 == 19 or job3 == 19 or job4 == 19) then -- DNC
		targ:unlockJob(tpz.job.DNC)
		targ:addQuest(JEUNO,tpz.quest.id.jeuno.LAKESIDE_MINUET)
		targ:completeQuest(JEUNO,tpz.quest.id.jeuno.LAKESIDE_MINUET)
	end
	if(job1 == 20 or job2 == 20 or job3 == 20 or job4 == 20) then -- SCH
		targ:unlockJob(tpz.job.SCH)
		targ:addQuest(CRYSTAL_WAR, tpz.quest.id.crystalWar.A_LITTLE_KNOWLEDGE)
		targ:addKeyItem(tpz.ki.GRIMOIRE)
        targ:setCharVar("ALittleKnowledge", 0)
        targ:setCharVar("SheetsofVellum", 0)
        targ:completeQuest(CRYSTAL_WAR, tpz.quest.id.crystalWar.A_LITTLE_KNOWLEDGE)
		targ:addSpell(478, true)
		targ:addSpell(502, true)
	end

	if(numJobs >= 1) then
		targ:changeJob(job1)
		targ:setLevel(level)
	end
	if(numJobs >= 2) then
		targ:changeJob(job2)
		targ:setLevel(level)
	end
	if(numJobs >= 3) then
		targ:changeJob(job3)
		targ:setLevel(level)
	end
	if(numJobs == 4) then
		targ:changeJob(job4)
		targ:setLevel(level)
	end

	if(level > 50) then
		if(targ:levelCap() < 55) then
			targ:levelCap(55)
		end
	end
	if(level > 55) then
		if(targ:levelCap() < 60) then
			targ:levelCap(60)
		end
	end
	if(level > 60) then
		if(targ:levelCap() < 65) then
			targ:levelCap(65)
		end
	end
	if(level > 65) then
		if(targ:levelCap() < 70) then
			targ:levelCap(70)
		end
	end
	if(level > 70) then
		if(targ:levelCap() < 75) then
			targ:levelCap(75)
		end
		targ:setCharVar("maatDefeated", 1)
	end
	if(level == 75) then
		targ:addKeyItem(tpz.ki.LIMIT_BREAKER)
	end

	player:PrintToPlayer("You have successfully granted those job levels.")
end