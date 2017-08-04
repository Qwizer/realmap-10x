function onPrepareDeath(player, killer)
if player:getStorageValue(10050) == -1 then
    player:teleportTo(player:getTown():getTemplePosition())
    player:addHealth(player:getMaxHealth())
    player:addMana(player:getMaxMana())
    end
    return false
end