-- <movevent event="StepIn" actionid="45000" script="ZE_movements.lua" />

dofile('data/lib/ZE_config.lua')

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)

	if player:getLevel() < 100 then
	local vazumbi = {x = 32477, y = 32473, z = 6}  
	player:teleportTo(vazumbi)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "YOU NEED LEVEL 100+ TO ENTER.")
	return false
    end	
	
	player:sendTextMessage(MESSAGE_STATUS_WARNING, "Get ready for the Zombie Event!")
	player:teleportTo(ZE.posEnterEvent)
	player:registerEvent("ZumbiDeath")
	
	player:setStorageValue(357812, 1)
	
	setGlobalStorageValue(ZE.storage, getGlobalStorageValue(ZE.storage) + 1)

	return true
end