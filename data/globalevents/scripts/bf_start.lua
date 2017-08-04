local TELEPORT_POSITION = Position(32470, 32471, 6)
local TELEPORT_ACTIONID = 45000
local TELEPORT_ITEMID = 1387

local function warnEvent(i)
	Game.broadcastMessage("Battlefield event was opened, a teleport was created in the Event Room (entrance through Temple of Thais)!", MESSAGE_EVENT_ADVANCE)
	if i > 1 then
		addEvent(warnEvent, 2 * 60 * 1000, i - 1)
	end
end

local function removeTp(position)
	local tp = Tile(position):getItemById(TELEPORT_ITEMID)
	if tp then
		tp:remove(1)
	end
end

local function openBattlefield()
	Battlefield:Open()
end

local function closeBattlefield()
	Battlefield:Close()
end

function onTime(interval)
	Game.broadcastMessage("Teleport for The BattleField Event was created in Event Room, you have 10 minutes for join if you want.", MESSAGE_EVENT_ADVANCE)
	local tp = Game.createItem(TELEPORT_ITEMID, 1, TELEPORT_POSITION)
	if not tp then
		error("Nao foi possivel criar o teleport na posicao especificada.")
	end
	tp:setActionId(TELEPORT_ACTIONID)
	addEvent(warnEvent, 2 * 60 * 1000, 4)
	addEvent(removeTp, 10 * 60 * 1000, TELEPORT_POSITION)
	addEvent(openBattlefield, 10 * 60 * 1000)
	addEvent(closeBattlefield, 60 * 60 * 1000)
	return true
end
