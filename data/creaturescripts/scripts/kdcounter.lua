-- kdcounter.lua
function onKill(creature, target)
    if target:isPlayer() and target:getLevel() > 200 then
        creature:setStorageValue(167912, math.max(0, creature:getStorageValue(167912)) + 1)
    end
    return true
end
 
function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    if lasthitkiller and lasthitkiller:isPlayer() then
        creature:setStorageValue(167913, math.max(0, creature:getStorageValue(167913)) + 1)
    end
    return true
end