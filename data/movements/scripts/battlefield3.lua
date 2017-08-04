local conditionRed3 = Condition(CONDITION_OUTFIT)
conditionRed3:setTicks(120 * 60 * 1000)
conditionRed3:setOutfit({lookType = 472, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94})


local conditionBlack3 = Condition(CONDITION_OUTFIT)
conditionBlack3:setTicks(120 * 60 * 1000)
conditionBlack3:setOutfit({lookType = 430, lookHead = 114, lookBody = 114, lookLegs = 114, lookFeet = 114})

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then return false end
	
	
	if player:getLevel() < 100 then
	local vaza3 = {x = 32470, y = 32474, z = 6} 
	player:teleportTo(vaza3)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "YOU NEED LEVEL 100+ TO ENTER.")
	return false
    end	
	
	if player:getGroup():getId() >= 3 then
		return player:teleportTo(_Lib_Battle_Info3.TeamOne3.pos3)
	end

	if Game.getStorageValue(_Lib_Battle_Info3.storage_count3) > 0 then
		local getMyTeam3 = Game.getStorageValue(_Lib_Battle_Info3.TeamOne3.storage3) < Game.getStorageValue(_Lib_Battle_Info3.TeamTwo3.storage3) and {_Lib_Battle_Info3.TeamOne3.storage3,_Lib_Battle_Info3.TeamOne3.pos3,_Lib_Battle_Info3.TeamOne3.name3,conditionBlack3} or {_Lib_Battle_Info3.TeamTwo3.storage3,_Lib_Battle_Info3.TeamTwo3.pos3, _Lib_Battle_Info3.TeamTwo3.name3, conditionRed3}
		player:addCondition(getMyTeam3[4])
		player:setStorageValue(getMyTeam3[1], 1)
		Game.setStorageValue(getMyTeam3[1], Game.getStorageValue(getMyTeam3[1])+1)
		player:teleportTo(getMyTeam3[2])
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce entrou para os " .. getMyTeam3[3] .. "!")
		Game.setStorageValue(_Lib_Battle_Info3.storage_count3, Game.getStorageValue(_Lib_Battle_Info3.storage_count3)-1)
	end

	if Game.getStorageValue(_Lib_Battle_Info3.storage_count3) == 0 then
	removeBattleTp3()
	broadcastMessage("Battlefield vai comecar em 2 minutos, comece a criar sua estrategia de combate!")
	addEvent(broadcastMessage, 2 * 60 * 1000 - 500, "BattleField vai comecar agora!")
	addEvent(OpenWallBattle3, 2 * 60 * 1000)
	end
	return true
end
