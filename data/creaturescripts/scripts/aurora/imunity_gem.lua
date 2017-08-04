function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if not isPlayer(creature) then return false end
	if creature:getStorageValue(45557) * 3 >= math.random (0, 100) and isCreature(attacker) then
        if isInArray({ORIGIN_MELEE, ORIGIN_RANGED, ORIGIN_SPELL}, origin) and primaryType ~= COMBAT_HEALING then
            primaryDamage = primaryDamage - math.ceil(primaryDamage * 1)
			creature:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end