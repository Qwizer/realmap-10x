function onLogout(player)
    local playerId = player:getId()
    if nextUseStaminaTime[playerId] ~= nil then
        nextUseStaminaTime[playerId] = nil
    end

    player:saveSpecialStorage()
	
 	local stats = player:inBossFight()
 	if stats then
 		local boss = Monster(stats.bossId)
 		-- Player logged out (or died) in the middle of a boss fight, store his damageOut and stamina
 		if boss then
 			local dmgOut = boss:getDamageMap()[playerId]
 			if dmgOut then
 				stats.damageOut = (stats.damageOut or 0) + dmgOut.total
 			end
 			stats.stamina = player:getStamina()
 		end
 	end
 if captureTheFlag.getPlayerState(player) ~= CTF_STATE_NONE then
		captureTheFlag.onLeave(player)
 end
    return true
end