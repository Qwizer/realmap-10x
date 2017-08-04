function onKill(creature, target)
    if not isInArray({-1, 1000}, creature:getStorageValue(6502)) then
        if target:isMonster() and (target:getMaster() == nil) and (target:getName() == "Infernalist") then
            local sum = creature:getStorageValue(6502) + 1
            creature:setStorageValue(6502, sum)
             creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have slayed ' .. sum .. ' out of 1000 Infernalist.')
            if sum == 1000 then
            creature:sendTextMessage(MESSAGE_INFO_DESCR, "Report the task to Gnomargery.")
            creature:getStorageValue(6503, -1)
            end
        end
    end
end