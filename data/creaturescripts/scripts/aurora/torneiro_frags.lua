function onPrepareDeath(player, killer, mostDamageKiller)

	if (isPlayer(player) and isPlayer(killer)) then
	
		if (killer:getStorageValue(tour.storage_players) >= 1) and (player:getStorageValue(tour.storage_players) >= 1) then
		
			local conta_player, conta_count, conta_deaths = killer:getStorageValue(tour.storage_kill), Game.getStorageValue(tour.storage_count) * 3, Game.getStorageValue(tour.storage_tele)
			
			if (conta_player == conta_count) then
				
				-- BROADCAST ANUNCIANDO.
				send_rank()
				send_recompensas()
				Game.broadcastMessage("The Tournamento finish.")
				
				-- CONFIGURACOES ADICIONAIS.
				player:addHealth(player:getMaxHealth())
				player:addMana(player:getMaxMana())
				ganhador_event(player, pos)
				killer:addSoul(1)
				
			else
				
				-- SETANDO STORAGES NECESSARIAS.
				player:setStorageValue(tour.storage_deaths, player:getStorageValue(tour.storage_deaths) + 1)
				killer:setStorageValue(tour.storage_kill, killer:getStorageValue(tour.storage_kill) + 1)
				Game.setStorageValue(tour.storage_tele, conta_deaths + 1)
				
				-- ENVIANDO MENSAGENS AO PLAYER.
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "You are killed by ("..killer:getName()..").")
				killer:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You killed player ("..player:getName()..").")
				killer:sendTextMessage(MESSAGE_EVENT_ADVANCE, " You received + 1 fragmelit.")
				
				-- CONFIGURACOES ADICIONAIS
				killer:addSoul(1)
				player:addHealth(player:getMaxHealth())
				player:addMana(player:getMaxMana())
				player:getPosition():sendMagicEffect(7)
				f = 0
				
				if (conta_deaths < tour.frags_to_arena1) then
					f = tour.frags_to_arena1
				elseif (conta_deaths < tour.frags_to_arena2) then
					f = tour.frags_to_arena2
				elseif (conta_deaths < tour.frags_to_arena3) then
					f = tour.frags_to_arena3
				elseif (conta_deaths < tour.frags_to_arena4) then
					f = tour.frags_to_arena4
				end
				
				-- COMECO DA RANDOM AO MORRER OU TROCA DE ARENA.
				if (conta_deaths >= tour.frags_to_arena4) then
					setStorageValue(tour.storage_tele, conta_deaths - tour.frags_to_arena4 + 1)
				end
				
				for numero, position in pairs(tour.arenas) do
				
					pos = {position[1], position[2], position[3], position[4], position[5], position[6], position[7], position[8], position[9], position[10], position[11], position[12], position[13], position[14], position[15], position[16], position[17], position[18], position[19], position[20]}
					local tele = math.random(1, #pos)
							
					if (conta_deaths + 10 == numero) then
					
						for _, k in pairs(Game.getPlayers()) do
						
							pos = {position[1], position[2], position[3], position[4], position[5], position[6], position[7], position[8], position[9], position[10], position[11], position[12], position[13], position[14], position[15], position[16], position[17], position[18], position[19], position[20]}
							local tele = math.random(1, #pos)
							
							if (k:getStorageValue(tour.storage_players) >= 1) then
								k:teleportTo(pos[tele])
								k:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "The arena has changed.")
								addEvent(function() k:getPosition():sendMagicEffect(11) end, 100)
							end
							
						end
						
					end

					if (f == numero) then
						player:teleportTo(pos[tele])
						addEvent(function() player:getPosition():sendMagicEffect(11) end, 100)
					end
					
				end
			end
		end
	end

	return true
end