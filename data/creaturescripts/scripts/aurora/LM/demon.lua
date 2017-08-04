function onKill(creature, target)
    if not isInArray({-1, 1000}, creature:getStorageValue(6504)) then
        if target:isMonster() and (target:getMaster() == nil) and (target:getName() == "Demon") then
            local sum = creature:getStorageValue(6504) + 1
            creature:setStorageValue(6504, sum)
             creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have slayed ' .. sum .. ' out of 1000 Demon.')
            if sum == 1000 then
            creature:sendTextMessage(MESSAGE_INFO_DESCR, "Report the task to Gnomargery.")
            creature:getStorageValue(6505, 1)
            end
        end
    end
end