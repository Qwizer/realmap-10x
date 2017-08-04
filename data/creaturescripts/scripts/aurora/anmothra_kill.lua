function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'anmothra' then
		return true
	end

	local player = creature:getPlayer()
	if player:getStorageValue(519999) ~= 1 then
		player:setStorageValue(519999, 1)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have defeated the Anmonthra, and retrieved the Annihilation key.")
               player:getPosition():sendMagicEffect(50)
	end
	return true
end