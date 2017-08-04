function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if not isPlayer(creature) then return false end
	if creature:getStorageValue(45565) * 3 >= math.random (0, 100) and isCreature(attacker) then
        if isInArray({ORIGIN_MELEE, ORIGIN_RANGED}, origin) then
            primaryDamage = primaryDamage - math.ceil(primaryDamage * 1)
            creature:say("Guard!", TALKTYPE_MONSTER_SAY)
			creature:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end