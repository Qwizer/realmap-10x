local config = {
     ['fire devil'] = {amount = 200, storage = 21900, startstorage = 45552, startvalue = 2},
     ['diabolic imp'] = {amount = 500, storage = 21901, startstorage = 45552, startvalue = 2},
     ['infernalist'] = {amount = 1000, storage = 21902, startstorage = 45552, startvalue = 2},
     ['fury'] = {amount = 1000, storage = 21903, startstorage = 45552, startvalue = 2},
     ['demon'] = {amount = 5000, storage = 21904, startstorage = 45552, startvalue = 2}
}
function onKill(player, target)
     local monster = config[target:getName():lower()]
     if target:isPlayer() or not monster or target:getMaster() then
         return true
     end
     local stor = player:getStorageValue(monster.storage)+1
     if stor < monster.amount and player:getStorageValue(monster.startstorage) >= monster.startvalue then
         player:setStorageValue(monster.storage, stor)
         player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Task message: '..(stor +1)..' of '..monster.amount..' '..target:getName()..'s killed.')
     end
     if (stor +1) == monster.amount then
         player:sendTextMessage(MESSAGE_INFO_DESCR, 'Congratulations, you have killed '..(stor +1)..' '..target:getName()..'s and completed the '..target:getName()..'s mission.')
         player:setStorageValue(monster.storage, stor +1)
     end
     return true
end