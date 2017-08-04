local mounts = {
      [1] = {name = "Sparkion", ID = 94},

    
    }
       
function onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("VibrantEgg")
 
    if modalWindowId == 1001 then
        if buttonId == 100 then
                        if player:getItemCount(26194) == 0 then 
                                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must have a Vibrant Egg in your backpack!")
                        return false
                        end
            if choiceId == 0 then
                return false
            end
            player:removeItem(26194, 1)
            player:addMount(mounts[choiceId].ID)
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        end
    end
end