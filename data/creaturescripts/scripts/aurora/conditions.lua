local res = {
    {101, COMBAT_FIREDAMAGE}, {102, COMBAT_EARTHDAMAGE}, {103, COMBAT_ENERGYDAMAGE}, {104, COMBAT_ICEDAMAGE}, {105, COMBAT_HOLYDAMAGE}, {106, COMBAT_DEATHDAMAGE}, {107, COMBAT_DEATHDAMAGE}, {108, COMBAT_DEATHDAMAGE},
    {109, COMBAT_FIREDAMAGE}, {110, COMBAT_EARTHDAMAGE}, {111, COMBAT_ENERGYDAMAGE}, {112, COMBAT_ICEDAMAGE}, {113, COMBAT_HOLYDAMAGE}, {114, COMBAT_DEATHDAMAGE}, {115, COMBAT_DEATHDAMAGE}, {116, COMBAT_DEATHDAMAGE},
    {117, COMBAT_PHYSICALDAMAGE}, {118, COMBAT_PHYSICALDAMAGE}, {119, COMBAT_PHYSICALDAMAGE}, {120, COMBAT_PHYSICALDAMAGE}, {121, COMBAT_PHYSICALDAMAGE}, {122, COMBAT_PHYSICALDAMAGE}, {123, COMBAT_PHYSICALDAMAGE}, {124, COMBAT_PHYSICALDAMAGE},
    {125, COMBAT_FIREDAMAGE}, {126, COMBAT_EARTHDAMAGE}, {127, COMBAT_ENERGYDAMAGE}, {128, COMBAT_ICEDAMAGE}, {129, COMBAT_HOLYDAMAGE}, {130, COMBAT_DEATHDAMAGE}, {131, COMBAT_DEATHDAMAGE}, {132, COMBAT_DEATHDAMAGE}
}
local refs = {
    [COMBAT_PHYSICALDAMAGE] = CONST_ME_DRAWBLOOD,
    [COMBAT_ENERGYDAMAGE] = CONST_ME_ENERGYAREA,
    [COMBAT_EARTHDAMAGE] = CONST_ME_POISONAREA,
    [COMBAT_FIREDAMAGE] = CONST_ME_FIREAREA,
    [COMBAT_ICEDAMAGE] = CONST_ME_ICEAREA,
    [COMBAT_HOLYDAMAGE] = CONST_ME_HOLYAREA,
    [COMBAT_DEATHDAMAGE] = CONST_ME_MORTAREA
}
function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature:isPlayer() then
        if primaryType == COMBAT_HEALING then
            return primaryDamage, primaryType, secondaryDamage, secondaryType
        end
        if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 11) then
            if primaryType == COMBAT_DROWNDAMAGE then
                primaryDamage = 0
            end
            if secondaryType == COMBAT_DROWNDAMAGE then
                secondaryDamage = 0
            end
        end
        for i = 1, 8 do -- resist
            if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, res[i][1]) then
                if primaryType == res[i][2] or i == 8 then
                    primaryDamage = (primaryDamage - (primaryDamage * (creature:getStorageValue(5) / 100)))
                end
                if secondaryType == res[i][2] or i == 8 then
                    secondaryDamage = (secondaryDamage - (secondaryDamage * (creature:getStorageValue(5) / 100)))
                end
            end
        end
        for i = 9, 16 do -- reflect
            if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, res[i][1]) then
                if not attacker then
                    return primaryDamage, primaryType, secondaryDamage, secondaryType
                end
                if primaryType == res[i][2] or i == 16 then
                    local a = math.floor(primaryDamage * (creature:getStorageValue(5) / 100))
                    if attacker:isMonster() then
                        local m = MonsterType(attacker:getName())
                        local e = m:getElementList()
                        local f = m:getCombatImmunities()
                        if type(f) == "number" then
                            if f == primaryType then
                                a = 0
                            end
                        else
                            for i, j in pairs(f) do
                                if i == primaryType then
                                    a = 0
                                end
                            end
                        end
                        if type(e) == "number" then
                            if e == primaryType then
                                if e > 0 then
                                    a = (a - (a * (e / 100)))
                                else
                                    a = (a + (a * ((e * -1) / 100)))
                                end
                            end
                        else
                            for i, j in pairs(e) do
                                if i == primaryType then
                                    if j > 0 then
                                        a = (a - (a * (j / 100)))
                                    else
                                        a = (a + (a * ((j * -1) / 100)))
                                    end
                                end
                            end
                        end
                    end
                    doTargetCombatHealth(creature, attacker, primaryType, a, a, refs[primaryType])
                end
            end
        end
        for i = 17, 24 do -- reflect
            if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, res[i][1]) then
                if not attacker then
                    return primaryDamage, primaryType, secondaryDamage, secondaryType
                end
                if primaryType == res[i][2] or i == 24 then
                    local a = math.floor(primaryDamage * (creature:getStorageValue(6) / 100))
                    if attacker:isMonster() then
                        local m = MonsterType(attacker:getName())
                        local e = m:getElementList()
                        local f = m:getCombatImmunities()
                        if type(f) == "number" then
                            if f == primaryType then
                                a = 0
                            end
                        else
                            for i, j in pairs(f) do
                                if i == primaryType then
                                    a = 0
                                end
                            end
                        end
                        if type(e) == "number" then
                            if e == primaryType then
                                if e > 0 then
                                    a = (a - (a * (e / 100)))
                                else
                                    a = (a + (a * ((e * -1) / 100)))
                                end
                            end
                        else
                            for i, j in pairs(e) do
                                if i == primaryType then
                                    if j > 0 then
                                        a = (a - (a * (j / 100)))
                                    else
                                        a = (a + (a * ((j * -1) / 100)))
                                    end
                                end
                            end
                        end
                    end
                    doTargetCombatHealth(creature, attacker, primaryType, a, a, refs[primaryType])
                end
            end
        end
        for i = 25, 32 do
            if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, res[i][1]) then
                if primaryType == res[i][2] or i == 32 then
                    local a = math.floor(primaryDamage * (creature:getStorageValue(5) / 100))
                    creature:addHealth(a)
                    primaryDamage = (primaryDamage - (primaryDamage * (creature:getStorageValue(5) / 100)))
                    secondaryDamage = (secondaryDamage - (secondaryDamage * (creature:getStorageValue(5) / 100)))
                end
            end
        end
    end
    if primaryDamage == 0 and secondaryDamage == 0 and creature:isPlayer() then
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end