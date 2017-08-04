local conditionRed = Condition(CONDITION_OUTFIT)
conditionRed:setTicks(120 * 60 * 1000)
conditionRed:setOutfit({lookType = 465, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94})

local conditionBlack = Condition(CONDITION_OUTFIT)
conditionBlack:setTicks(120 * 60 * 1000)
conditionBlack:setOutfit({lookType = 465, lookHead = 114, lookBody = 114, lookLegs = 114, lookFeet = 114})

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then return false end
	
	if player:getLevel() < 100 then
	local vazaa = {x = 32310, y = 31859, z = 6}  
	player:teleportTo(vazaa)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "YOU NEED LEVEL 100+ TO ENTER.")
	return false
    end	
	
	
	if player:getGroup():getId() >= 3 then
		return player:teleportTo(_Lib_Battle_Info.TeamOne.pos)
	end

	if Game.getStorageValue(_Lib_Battle_Info.storage_count) > 0 then
		local getMyTeam = Game.getStorageValue(_Lib_Battle_Info.TeamOne.storage) < Game.getStorageValue(_Lib_Battle_Info.TeamTwo.storage) and {_Lib_Battle_Info.TeamOne.storage,_Lib_Battle_Info.TeamOne.pos,_Lib_Battle_Info.TeamOne.name,conditionBlack} or {_Lib_Battle_Info.TeamTwo.storage,_Lib_Battle_Info.TeamTwo.pos, _Lib_Battle_Info.TeamTwo.name, conditionRed}
		player:addCondition(getMyTeam[4])
		player:setStorageValue(getMyTeam[1], 1)
		Game.setStorageValue(getMyTeam[1], Game.getStorageValue(getMyTeam[1])+1)
		player:teleportTo(getMyTeam[2])
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce entrou para os " .. getMyTeam[3] .. "!")
		Game.setStorageValue(_Lib_Battle_Info.storage_count, Game.getStorageValue(_Lib_Battle_Info.storage_count)-1)
	end

	if Game.getStorageValue(_Lib_Battle_Info.storage_count) == 0 then
	removeBattleTp()
	broadcastMessage("Battlefield vai comecar em 2 minutos, comece a criar sua estrategia de combate!", MESSAGE_EVENT_ADVANCE)
	addEvent(broadcastMessage, 2 * 60 * 1000 - 500, "BattleField vai comecar agora!", MESSAGE_EVENT_ADVANCE)
	addEvent(OpenWallBattle, 2 * 60 * 1000)
	end
	return true
end
