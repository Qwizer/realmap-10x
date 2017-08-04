local mounts = {
      [1] = {name = "Rift Runner", ID = 87},

    
    }
       
function onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("modalMD1")
 
    if modalWindowId == 1001 then
        if buttonId == 100 then
                        if player:getItemCount(24763) == 0 then 
                                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must have a Mysterious Scroll in your backpack!")
                        return false
                        end
            if choiceId == 0 then
                return false
            end
            player:removeItem(24763, 1)
            player:addMount(mounts[choiceId].ID)
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        end
    end
end