function onKill(cid, target)
	local m = {
		["Devovorga"] = {
			message = "Escape through the teleport quickly before it closes!",
			cfg = {
				{
					time = 60, -- Seconds until tp closes.
					to = {x = 5188, y = 5717, z = 10},
					tp = {x = 5189, y = 5741, z = 10}
				},
			}
		}
	}
	if isPlayer(target) then
		return true
	end
	local monster = m[getCreatureName(target)]
	if monster then
		for i = 1, #monster.cfg do
			local c = monster.cfg[i]
				local function deleteTeleport()
				local teleport = getTileItemById(c.tp, 1387).uid
					if(teleport > 0) then
						doRemoveItem(teleport)
						doSendMagicEffect(c.tp, CONST_ME_POFF)
					end
					return true
				end
			doCreateTeleport(1387, c.to, c.tp)
			doSendMagicEffect(c.tp, CONST_ME_ENERGYAREA)
			addEvent(deleteTeleport, c.time * 1000)
		end
		doCreatureSay(cid, monster.message, TALKTYPE_ORANGE_1)
	end
	return true
end