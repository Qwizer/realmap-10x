configExf = {
     Area_Arena = {{x = 32221, y = 31882, z = 7}, {x = 32269, y = 31928, z = 7}},
	 arena = {x = 32256, y = 31919, z = 7},
     teleportPos = {32301, 31896, 6},
	 teleportPla = {32301, 31896, 6},
	 stats = 201201180701,
	 timetostart = 120,
	 prize = 6571,
	 templepos = {32369,  32241,  7},
	 randpos = {{32244, 31909, 7},{32253, 31908, 7},{32258, 31902, 7},{32248, 31897, 7},{32253, 31893, 7},{32261, 31889, 7},{32264, 31887, 7},{32242, 31886, 7},{32231, 31889, 7},{32226, 31893, 7},{32232, 31905, 7},{32235, 31897, 7},{32251, 31913, 7},{32255, 31913, 7},{32259, 31913, 7},{32230, 31905, 7}}
}
local TELEPORT_POSITION = Position(32301, 31896, 6)
local TELEPORT_ACTIONID = 19027
local TELEPORT_ITEMID = 1387


function doStartExf()
	Game.broadcastMessage("Teleport for Enchanted Forest Event was created in Event Room.", MESSAGE_STATUS_WARNING)
	local tp = Game.createItem(TELEPORT_ITEMID, 1, TELEPORT_POSITION)
	if not tp then
		error("Nao foi possivel criar o teleport na posicao especificada.")
	end
	tp:setActionId(TELEPORT_ACTIONID)
	setGlobalStorageValue(configExf.stats, 0)
    Game.broadcastMessage("The Exchanted Forest event will start in " .. configExf.timetostart .. " seconds.", MESSAGE_STATUS_WARNING)
    addEvent(doInitExf, configExf.timetostart*1000)
	end
	
function doInitExf()

if getGlobalStorageValue(configExf.stats) == 0 then
	Game.broadcastMessage("The Exchanted Forest event is starting...", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(configExf.stats, 1)
end

end

function doCloseExf()

setGlobalStorageValue(configExf.stats, -1)
	local tp = Game.removeItem(TELEPORT_ITEMID, 1, TELEPORT_POSITION)
	if not tp then
		error("Nao foi possivel remover o teleport na posicao especificada.")
	end

doCleanExfRoom()
end

function doCleanExfRoom()

	local pos = player:getPosition()

	if pos.z == configExf.Area_Arena[1].z then
		if pos.x >= configExf.Area_Arena[1].x and pos.y >= configExf.Area_Arena[1].y then
			if pos.x <= configExf.Area_Arena[2].x and pos.y <= configExf.Area_Arena[2].y then
			Player(players):teleportTo(Player(players):getTown():getTemplePosition())
				return true
			end
		end
	end
	return false
end