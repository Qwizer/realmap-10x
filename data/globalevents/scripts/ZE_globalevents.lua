-- <globalevent name="Zumbi_Event" time="03:46:00" script="ZE_globalevents.lua"/>

dofile('data/lib/ZE_config.lua')

zeArenaFromPosition = Position(32442, 32522, 7) --pos of top left corner {x = 32442, y = 32522, z = 7}
zeArenaToPosition = Position(32457, 32538, 7) --pos of bottom right corner {x = 32457, y = 32538, z = 7}

local function ZE_Verifica()
	local tile = Tile(ZE.tpOpen)
	if tile then
		local item = tile:getItemById(1387)
		if item then
			item:remove()
			Game.broadcastMessage("the Zombie Event will start now!", MESSAGE_EVENT_ADVANCE)
			doSummonCreature("Zumbi", ZE.posEnterEvent, false, true)
		else			
			Game.broadcastMessage("The Zombie Event was opened and will be closed in ".. ZE.tpTimeOpen .." minutes.", MESSAGE_EVENT_ADVANCE)
			setGlobalStorageValue(ZE.storage, 0)
			
			local teleport = Game.createItem(1387, 1, ZE.tpOpen)
			if teleport then
				teleport:setActionId(45110)
			end
		end
	end
end

local function warnEvents(i)
	Game.broadcastMessage("The Zombie event was opened, entrance through Temple of Thais!", MESSAGE_EVENT_ADVANCE)
	if i > 1 then
		addEvent(warnEvents, 2 * 60 * 1000, i - 1)
	end
end


--- TESTE
local function SumonarZumbis(b)

Game.createMonster("Zumbi", {x = math.random(zeArenaFromPosition.x, zeArenaToPosition.x), y = math.random(zeArenaFromPosition.y, zeArenaToPosition.y), z = math.random(zeArenaFromPosition.z, zeArenaToPosition.z)}, false, true)

if b > 1 then
		addEvent(SumonarZumbis, 1 * 60 * 1000, b - 1)
	end
end
-- TESTE 

function onTime(interval)

	ZE_Verifica()
	addEvent(ZE_Verifica, ZE.tpTimeOpen * 60 * 1000)
	addEvent(warnEvents, 2 * 60 * 1000, 4)
	addEvent(SumonarZumbis, 10 * 60 * 1000, 16)
	return true
end