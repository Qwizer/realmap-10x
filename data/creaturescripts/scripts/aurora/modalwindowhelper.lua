function onModalWindow(player, modalWindowId, buttonId, choiceId)
	-- TP Houses
    if(buttonId == 100)then
        if(choiceId == 0)then
            return false
        end

		local p_db = db.storeQuery("SELECT `id` FROM `houses` WHERE `owner` = " .. choiceId) -- Separa o id da house pelo GUID do dono.
		
		local p_house = result.getString(p_db, "id")-- Pega id da house retornado pela query da variavel p_db
		
		local house = House(tonumber(p_house)) -- Declara que a variável house é o resultado de p_house
		
		local p = db.storeQuery("SELECT `name` FROM `players` WHERE `id` = ".. choiceId)
		
	   	player:teleportTo(house:getExitPosition()) -- Teleporta o player para a house.
		
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You were teleported to the house of ".. result.getString(p, "name"))
		
        player:getPosition():sendMagicEffect(73)        
		player:say("Ultimate Teleport", TALKTYPE_MONSTER_SAY)
    end
	-- End Tp Houses.
    local modalWindow
    for _, window in ipairs(modalWindows.windows) do
        if window.id == modalWindowId then
            modalWindow = window
            break
        end
    end
    if(not modalWindow)then
        return true
    end
    local playerId = player:getId()
    if(not modalWindow.players[playerId])then
        return true
    end
    modalWindow.players[playerId] = nil
    local choice = modalWindow.choices[choiceId]
    for _, button in ipairs(modalWindow.buttons) do
        if(button.id == buttonId)then
            local callback = button.callback or modalWindow.defaultCallback
            if(callback)then
                callback(button, choice)
                break
            end
        end
    end
    return true
end