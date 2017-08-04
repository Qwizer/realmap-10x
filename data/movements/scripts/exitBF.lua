function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then 
	return false 
	end
	
	if player:getLevel() > 99 then
	local vaza55 = {x = 32351, y = 32229, z = 4}
	-- BF 0 --	
	local MyTeam = creature:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 and _Lib_Battle_Info.TeamOne.storage or _Lib_Battle_Info.TeamTwo.storage
	
	if MyTeam >= 1 then
	Game.setStorageValue(MyTeam, (Game.getStorageValue(MyTeam)-1))
	creature:setStorageValue(MyTeam, -1)
	local vaza5 = {x = 32355, y = 32217, z = 7} 
	player:teleportTo(vaza5)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You exited 0.")
	return false
    end	
	-- BF 0 --
	
	-- BF 1 --
	local MyTeam1 = creature:getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) >= 1 and _Lib_Battle_Info1.TeamOne1.storage1 or _Lib_Battle_Info1.TeamTwo1.storage1
	
	if MyTeam1 >= 1 then
	Game.setStorageValue(MyTeam1, (Game.getStorageValue(MyTeam1)-1))
	creature:setStorageValue(MyTeam1, -1)
	local vaza6 = {x = 32355, y = 32217, z = 7} 
	player:teleportTo(vaza6)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You exited 1.")
	return false
    end	
	-- BF 1 --
	
	-- BF 2 --
    local MyTeam2 = creature:getStorageValue(_Lib_Battle_Info2.TeamOne2.storage2) >= 1 and _Lib_Battle_Info2.TeamOne2.storage2 or _Lib_Battle_Info2.TeamTwo2.storage2
	
    if MyTeam2 >= 1 then
	Game.setStorageValue(MyTeam2, (Game.getStorageValue(MyTeam2)-1))
	creature:setStorageValue(MyTeam2, -1)
	local vaza7 = {x = 32355, y = 32217, z = 7} 
	player:teleportTo(vaza7)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You exited 2.")
	return false
    end				
	-- BF 2 --
	
	-- BF 3 --
	local MyTeam3 = creature:getStorageValue(_Lib_Battle_Info3.TeamOne3.storage3) >= 1 and _Lib_Battle_Info3.TeamOne3.storage3 or _Lib_Battle_Info3.TeamTwo3.storage3
	
	if MyTeam3 >= 1 then
	Game.setStorageValue(MyTeam3, (Game.getStorageValue(MyTeam3)-1))
	creature:setStorageValue(MyTeam3, -1)
	local vaza8 = {x = 32355, y = 32217, z = 7}
	player:teleportTo(vaza8)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You exited 3.")
	return false
    end	
    -- BF 3 --	
	
	
	creature:removeCondition(CONDITION_OUTFIT)
	else 
	player:teleportTo(vaza55)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Tested.")
	
	end


end 
	