function onStepIn(creature, item, position, fromPosition)
	if not Battlefield:onJoin(creature) then
		creature:teleportTo(fromPosition)
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "YOU NEED LEVEL 150+ TO ENTER.")
		return false
	end
	return true
end
