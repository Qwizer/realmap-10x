local conditionRed1 = Condition(CONDITION_OUTFIT)
conditionRed1:setTicks(120 * 60 * 1000)
conditionRed1:setOutfit({lookType = 432, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94})


local conditionBlack1 = Condition(CONDITION_OUTFIT)
conditionBlack1:setTicks(120 * 60 * 1000)
conditionBlack1:setOutfit({lookType = 432, lookHead = 114, lookBody = 114, lookLegs = 114, lookFeet = 114})

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then return false end
	
	
	if player:getLevel() < 100 then
	local vaza = {x = 32310, y = 31859, z = 6} 
	player:teleportTo(vaza)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "YOU NEED LEVEL 100+ TO ENTER.")
	return false
    end	
	
	if player:getGroup():getId() >= 3 then
		return player:teleportTo(_Lib_Battle_Info1.TeamOne1.pos1)
	end

	if Game.getStorageValue(_Lib_Battle_Info1.storage_count1) > 0 then
		local getMyTeam1 = Game.getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) < Game.getStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1) and {_Lib_Battle_Info1.TeamOne1.storage1,_Lib_Battle_Info1.TeamOne1.pos1,_Lib_Battle_Info1.TeamOne1.name1,conditionBlack1} or {_Lib_Battle_Info1.TeamTwo1.storage1,_Lib_Battle_Info1.TeamTwo1.pos1, _Lib_Battle_Info1.TeamTwo1.name1, conditionRed1}
		player:addCondition(getMyTeam1[4])
		player:setStorageValue(getMyTeam1[1], 1)
		Game.setStorageValue(getMyTeam1[1], Game.getStorageValue(getMyTeam1[1])+1)
		player:teleportTo(getMyTeam1[2])
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce entrou para os " .. getMyTeam1[3] .. "!")
		Game.setStorageValue(_Lib_Battle_Info1.storage_count1, Game.getStorageValue(_Lib_Battle_Info1.storage_count1)-1)
	end

	if Game.getStorageValue(_Lib_Battle_Info1.storage_count1) == 0 then
	removeBattleTp1()
	broadcastMessage("Battlefield vai comecar em 2 minutos, comece a criar sua estrategia de combate!", MESSAGE_EVENT_ADVANCE)
	addEvent(broadcastMessage, 2 * 60 * 1000 - 500, "BattleField vai comecar agora!", MESSAGE_EVENT_ADVANCE)
	addEvent(OpenWallBattle1, 2 * 60 * 1000)
	end
	return true
end
