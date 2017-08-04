function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(not isPlayer(cid)) then
		return true
	end
	
	if(configExchantedForest.status == 0) then -- ativo
		addPlayerToExchantedForest(cid)			
	end
	
	return true
	
end