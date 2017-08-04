function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Nests) == 1 then
		local condition = Condition(CONDITION_OUTFIT)
		condition:setOutfit({lookType = 307})
		condition:setParameter(CONDITION_PARAM_TICKS, 300000)
		player:addCondition(condition, true)
	end
	return true
end