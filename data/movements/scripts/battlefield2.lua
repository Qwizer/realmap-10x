local conditionRed2 = Condition(CONDITION_OUTFIT)
conditionRed2:setTicks(120 * 60 * 1000)
conditionRed2:setOutfit({lookType = 151, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94})


local conditionBlack2 = Condition(CONDITION_OUTFIT)
conditionBlack2:setTicks(120 * 60 * 1000)
conditionBlack2:setOutfit({lookType = 151, lookHead = 114, lookBody = 114, lookLegs = 114, lookFeet = 114})

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then return false end
	
	
	if player:getLevel() < 100 then
	local vaza2 = {x = 32310, y = 31859, z = 6}  
	player:teleportTo(vaza2)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "YOU NEED LEVEL 100+ TO ENTER.")
	return false
    end	
	
	if player:getGroup():getId() >= 3 then
		return player:teleportTo(_Lib_Battle_Info2.TeamOne2.pos2)
	end

	if Game.getStorageValue(_Lib_Battle_Info2.storage_count2) > 0 then
		local getMyTeam2 = Game.getStorageValue(_Lib_Battle_Info2.TeamOne2.storage2) < Game.getStorageValue(_Lib_Battle_Info2.TeamTwo2.storage2) and {_Lib_Battle_Info2.TeamOne2.storage2,_Lib_Battle_Info2.TeamOne2.pos2,_Lib_Battle_Info2.TeamOne2.name2,conditionBlack2} or {_Lib_Battle_Info2.TeamTwo2.storage2,_Lib_Battle_Info2.TeamTwo2.pos2, _Lib_Battle_Info2.TeamTwo2.name2, conditionRed2}
		player:addCondition(getMyTeam2[4])
		player:setStorageValue(getMyTeam2[1], 1)
		Game.setStorageValue(getMyTeam2[1], Game.getStorageValue(getMyTeam2[1])+1)
		player:teleportTo(getMyTeam2[2])
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce entrou para os " .. getMyTeam2[3] .. "!")
		Game.setStorageValue(_Lib_Battle_Info2.storage_count2, Game.getStorageValue(_Lib_Battle_Info2.storage_count2)-1)
	end

	if Game.getStorageValue(_Lib_Battle_Info2.storage_count2) == 0 then
	removeBattleTp2()
	broadcastMessage("Battlefield vai comecar em 2 minutos, comece a criar sua estrategia de combate!")
	addEvent(broadcastMessage, 2 * 60 * 1000 - 500, "BattleField vai comecar agora!")
	addEvent(OpenWallBattle2, 2 * 60 * 1000)
	end
	return true
end
