function startGame(rounds)
	if rounds == 0 then
		if #CACHE_GAMEPLAYERS < SnowBall_Configurations.Event_MinPlayers then
			for _, players in ipairs(CACHE_GAMEPLAYERS) do
				Player(players):teleportTo(Player(players):getTown():getTemplePosition())
			end
			broadcastMessage("[Snowball Event]: O evento foi cancelado por conta de não ter no minimo ".. SnowBall_Configurations.Event_MinPlayers.." jogadores.", MESSAGE_EVENT_ADVANCE)
		else
			for _, players in ipairs(CACHE_GAMEPLAYERS) do
				Player(players):setStorageValue(10109, 0)
				Player(players):setStorageValue(10108, SnowBall_Configurations.Ammo_Configurations.Ammo_Start)
				Player(players):teleportTo(CACHE_GAMEAREAPOSITIONS[math.random(1, #CACHE_GAMEAREAPOSITIONS)])
			end
			broadcastMessage("[Snowball Event]: O evento foi fechado. O jogo começou.", MESSAGE_EVENT_ADVANCE)
			addEvent(Event_endGame, SnowBall_Configurations.Event_Duration * 60 * 1000)
		end

		Item(getTileItemById(SnowBall_Configurations.Area_Configurations.Position_EventTeleport, 1387).uid):remove(1)
		Item(getTileItemById(SnowBall_Configurations.Area_Configurations.Position_ExitWaitRoom, 1387).uid):remove(1)
		return true
	end

	if #CACHE_GAMEPLAYERS < SnowBall_Configurations.Event_MinPlayers then
		broadcastMessage("[Snowball Event]: Faltam ".. rounds .. " minuto(s) e " .. SnowBall_Configurations.Event_MinPlayers - #CACHE_GAMEPLAYERS .." jogador(es) para o jogo começar.", MESSAGE_EVENT_ADVANCE)
	else
		broadcastMessage("[Snowball Event]: Faltam ".. rounds .. " minuto(s) para o jogo começar.", MESSAGE_EVENT_ADVANCE)
	end
	return addEvent(startGame, 60 * 1000, rounds - 1)
end

function onTime(interval)
	if not SnowBall_Configurations.Event_Days[os.date("%w") + 1] then
		return true
	end

	CACHE_GAMEPLAYERS = {}

	local EventTeleport = Game.createItem(1387, 1, SnowBall_Configurations.Area_Configurations.Position_EventTeleport)
	EventTeleport:setActionId(10101)

	local ExitWaitRoom = Game.createItem(1387, 1, SnowBall_Configurations.Area_Configurations.Position_ExitWaitRoom)
	ExitWaitRoom:setActionId(10102)

	broadcastMessage("[Snowball Event]: O evento foi aberto, vá até o EVENT ROOM no templo de Thais para participar.", MESSAGE_EVENT_ADVANCE)
	addEvent(startGame, 60 * 1000, SnowBall_Configurations.Event_WaitGame)
	
	return true
end
