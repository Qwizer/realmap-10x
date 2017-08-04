function onStepIn(creature, item, position, fromPosition)
local arena = configExf.arena
	if(not isPlayer(cid)) then
		return true
	end
	
		if(Game.getStorageValue(configExf.stats) >=1)then
	    player:teleportTo(configExf.arena)		
	end
	
	return true
	
end