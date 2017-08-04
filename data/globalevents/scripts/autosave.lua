local cleanMapAtSave = true

local function serverSave()
	if cleanMapAtSave then
		--cleanMap()
	Game.broadcastMessage('Server Saved, next save in 1 hour.', MESSAGE_EVENT_ADVANCE)
	end

	saveServer()
end

function onThink(interval)
	Game.broadcastMessage('The server will save all accounts within 60 seconds, possibly will have lag for 5 seconds, find a safe place.', MESSAGE_EVENT_ADVANCE)
	addEvent(serverSave, 60000)
	return true
end