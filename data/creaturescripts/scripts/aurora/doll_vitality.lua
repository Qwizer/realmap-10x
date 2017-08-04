function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if not isPlayer(attacker) then return false end
	if (attacker:getStorageValue(45562) == 1) then
        if isInArray(COMBAT_HEALING) then
            primaryDamage = primaryDamage + math.ceil(primaryDamage * 100)
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end