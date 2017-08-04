local destination = configExf.randpos[math.random(#configExf.randpos)]
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(configExf.stats) == 1 then
	   player:teleportTo(destination)
       destination:sendMagicEffect
return true
end

