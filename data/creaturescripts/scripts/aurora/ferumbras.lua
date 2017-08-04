local function Uheal(cid)
	local gaz = Monster(cid)

	gaz:addHealth(gaz:getMaxHealth())
	gaz:getPosition():sendMagicEffect(50)
	Game.setStorageValue(90702, 0)
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	
	if attacker then
		if creature:getHealth() < 5000 and Game.getStorageValue(90702) < 1 then
			addEvent(Uheal, 1000 * 5, creature.uid)
			Game.setStorageValue(90702, 1)
		end
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end