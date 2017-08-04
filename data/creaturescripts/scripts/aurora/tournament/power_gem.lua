function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if (getPlayerStorageValue(cid, 45561) * 3) >= math.random (0, 100) then
        if isInArray({ORIGIN_MELEE, ORIGIN_RANGED, ORIGIN_SPELL}, origin) and primaryType ~= COMBAT_HEALING then
            creature:getPosition():sendMagicEffect(173)
        end
        return primaryDamage * 3, primaryType, secondaryDamage, secondaryType
    end
  
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end