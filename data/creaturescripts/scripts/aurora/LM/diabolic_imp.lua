function onKill(creature, target)
    if not isInArray({-1, 500}, creature:getStorageValue(6501)) then
        if target:isMonster() and (target:getMaster() == nil) and (target:getName() == "Diabolic Imp") then
            local sum = creature:getStorageValue(6501) + 1
            creature:setStorageValue(6501, sum)
             creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have slayed ' .. sum .. ' out of 500 Diabolic Imp.')
            if sum == 500 then
            creature:sendTextMessage(MESSAGE_INFO_DESCR, "Report the task to Gnomargery.")
            creature:getStorageValue(6502, -1)
            end
        end
    end
end