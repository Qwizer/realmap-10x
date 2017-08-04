local portals = {
	[50510] = {position = Position(33458, 31714, 9), message = 'Slrrp!', premium = false}, --entrance
	[50511] = {position = Position(33669, 31885, 5), message = 'Slrrp!', premium = false}, --exit {x = 33669, y = 31885, z = 5}
	
	[50512] = {position = Position(31256, 32607, 9), message = 'Slrrp!', premium = false}, -- entrada pros Minos  OK 
	[50513] = {position = Position(31063, 32608, 9), message = 'Slrrp!', premium = false}, -- entrada pros Golens OK
	
	[50514] = {position = Position(33666, 31885, 5), message = 'Slrrp!', premium = false}, -- saida dos Minos OK 
	[50515] = {position = Position(33666, 31885, 5), message = 'Slrrp!', premium = false}, -- saida dos Golens OK
	
	[50624] = {position = Position(33662, 31937, 11), message = 'Slrrp!', premium = false}, -- saida dos Minos OK 
	[50625] = {position = Position(33732, 31750, 15), message = 'Slrrp!', premium = false}, -- saida dos Golens OK
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = portals[item.uid]
	if portal then
		if not player:isPremium() and portal.premium then
			player:teleportTo(fromPosition)
			player:sendCancelMessage("You need a premium account to access this area.")
			fromPosition:sendMagicEffect(CONST_ME_POFF)
			return true
		end
		player:teleportTo(portal.position)
		item:getPosition():sendMagicEffect(CONST_ME_GREEN_RINGS)
		player:say(portal.message, TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
