-- <globalevent type="startup" name="grayIslandBosses" script="spawn/grayIslandBosses.lua" />

local config = {
	teleportId = 1285,
	dias = {
		["Saturday"] = {Position(33665, 31887, 5), Position(33647, 31254, 11)}, -- Sábado IRA DO MAL -- GOLENS
		["Sunday"] = {Position(33665, 31887, 5), Position(33647, 31254, 11)}, -- Domingo MINOS -- GOLENS
		["Monday"] = {Position(33669, 31887, 5), Position(33647, 31254, 11)}, -- Segunda-feira MINOS -- IRA DO MAL
		["Tuesday"] = {Position(33669, 31887, 5), Position(33647, 31254, 11)}, -- Terça-feira GOLENS -- IRA DO MAL
		["Wednesday"] = {Position(33665, 31887, 5), Position(33647, 31254, 11)}, -- Quarta-feira	 IRA DO MAL	 -- GOLENS
		["Thursday"] = {Position(33665, 31887, 5), Position(33545, 31263, 11)}, -- Quinta-feira		 MINOS -- GOLENS
		["Friday"] = {Position(33665, 31887, 5), Position(33419, 31255, 11)}, -- Sexta-feira   MINOS - GOLENS
	}
}

function onStartup()

	local dia = config.dias[os.date("%A")]

	if dia then
		Game.createItem(config.teleportId, 1, dia[1])
	end

	return true
end