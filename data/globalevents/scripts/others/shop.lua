-- ### CONFIG ###
-- message to player "type", if delivery of item debugs client, it can be because of undefinied type (type that does not exist in your server LUA)
SHOP_MSG_TYPE = MESSAGE_EVENT_ADVANCE
-- ### END OF CONFIG ###
MESSAGE_ERROR_CONTACT = "[ERRO] Shop Donate. Contate o Administrador! Erro disponível no Console."

local MountsShop = {
    -- VIP Mounts
    [80099] = 104,
    -- Normal Mounts
    [80032] = 33,
    [80040] = 41,
    [80022] = 23,
    [80008] = 9,
    [80030] = 37,
    [80033] = 34,
    [80035] = 36,
    [80043] = 45,
    [80044] = 46,
    [80045] = 47,
    [80046] = 48,
    [80047] = 49,
    [80048] = 50,
    [80049] = 51,
    [80050] = 52,
    [80051] = 53,
    [80052] = 54,
    [80053] = 55,
    [80054] = 56,
    [80055] = 57,
    [80056] = 58,
    [80057] = 59,
    [80058] = 60,
    [80060] = 62,
    [80062] = 64,
    [80063] = 65,
    [80064] = 66,
    [80065] = 67,
    [80067] = 69,
    [80068] = 70,
    [80069] = 71,
    [80071] = 73,
    [80072] = 74,
    [80073] = 75,
    [80080] = 82,
    [80081] = 83,
    [80082] = 84,
    [80087] = 89,
    [80088] = 90,
    [80089] = 91
}

local AddonsShop = {
    [28452] = {f = 632, m = 633},
    [28453] = {f = 635, m = 634},
    [28454] = {f = 636, m = 637},
    [28455] = {f = 664, m = 665},
    [28457] = {f = 683, m = 684},
    [28458] = {f = 694, m = 695},
    [28456] = {f = 666, m = 667},
    [28461] = {f = 724, m = 725},
    [28462] = {f = 732, m = 733},
    [28464] = {f = 749, m = 750},
    [28465] = {f = 759, m = 760}
}

function onThink(interval)
    local resultId = db.storeQuery("SELECT * FROM z_ots_comunication")
    if resultId ~= false then
        repeat
            local transactionId = tonumber(result.getDataInt(resultId, "id"))
            local player = Player(result.getDataString(resultId, "name"))

            if player then
                local itemId = result.getDataInt(resultId, "param1")
                local itemCount = result.getDataInt(resultId, "param2")
                local containerId = result.getDataInt(resultId, "param3")
                local containerItemsInsideCount = result.getDataInt(resultId, "param4")
                local shopOfferType = result.getDataString(resultId, "param5")
                local shopOfferName = result.getDataString(resultId, "param6")

-- DELIVER ITEM
                if shopOfferType == 'item' or
                   shopOfferType == 'itemvip' then
                       -- get player store inbox as container, so we can add item to it
                    local playerStoreInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
                    -- cannot open Store Inbox, report problem
                    if not playerStoreInbox then
                        player:sendTextMessage(SHOP_MSG_TYPE, MESSAGE_ERROR_CONTACT)
                        print('[ERRO] Shop Donate (' .. player:getName() .. ') - não foi encontrado seu "Store Inbox".')
                        return true
                    end
                    -- add container with items to Store Inbox
                    local container = playerStoreInbox:addItem(11119, 1)
                    if (container) then
                        local shopContainer = Container(container:getUniqueId())
                        if (shopContainer) then
                            for i = 1, itemCount do
                                shopContainer:addItem(itemId, 1)
                                if (i % 19 == 0) then
                                    shopContainer = shopContainer:addItem(11119, 1)
                                end
                            end
                            receivedItemStatus = RETURNVALUE_NOERROR
                        end
                    end

                    if type(receivedItemStatus) == "number" and receivedItemStatus == RETURNVALUE_NOERROR then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'Você recebeu ' .. shopOfferName .. ' do Store. Você pode encontrar esse item no seu Store Inbox.')
                        db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. transactionId)
                        db.asyncQuery("UPDATE `z_shop_history_item` SET `trans_state`= 'realized', `trans_real`=" .. os.time() .. " WHERE `id` = " .. transactionId)
                    else
                        player:sendTextMessage(SHOP_MSG_TYPE, MESSAGE_ERROR_CONTACT)
                        print('[ERRO] Shop Donate (' .. player:getName() .. ') - não pode adicionar item no Store Inbox - razão desconhecida, provavel inbox cheio? - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                    end
                elseif shopOfferType == 'vipdays' then
                    local vipDays = player:getStorageValue(51049)
                    if (vipDays == -1) then
                        player:setStorageValue(51049, os.time()+(itemCount*86400))
                    else
                        player:setStorageValue(51049, vipDays+(itemCount*86400))
                    end
                    vipDays = math.ceil((vipDays - os.time())/86400)
                    player:sendTextMessage(SHOP_MSG_TYPE, 'Você recebeu ' .. shopOfferName .. ' do Store. Agora você tem ' ..vipDays.. " de dias!")
                    db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. transactionId)
                    db.asyncQuery("UPDATE `z_shop_history_item` SET `trans_state`= 'realized', `trans_real`=" .. os.time() .. " WHERE `id` = " .. transactionId)
                elseif shopOfferType == 'container' then
                    -- create empty container
                    local newContainerUID = doCreateItemEx(containerId, 1)
                    -- container item does not exist OR item is not Container
                    if not newContainerUID or not Container(newContainerUID) then
                        player:sendTextMessage(SHOP_MSG_TYPE, MESSAGE_ERROR_CONTACT)
                        print('[ERRO] Shop Donate (' .. player:getName() .. ') - não pode criar Container - ID inválido - CONTAINER ID:' .. containerId)
                        return true
                    end
                    -- change container UniqueID to object of class Container
                    local newContainer = Container(newContainerUID)

                    -- add items to container
                    for i = 1, containerItemsInsideCount do
                        -- create new item
                        local newItemUID = doCreateItemEx(itemId, itemCount)
                        --  item does not exist, wrong id OR count
                        if not newItemUID then
                            player:sendTextMessage(SHOP_MSG_TYPE, MESSAGE_ERROR_CONTACT)
                            print('[ERRO] Shop Donate (' .. player:getName() .. ') - não pode criar Item - ID inválido ou Count - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                            return true
                        end
                        -- change item UniqueID to object of class Item
                        local newItem = Item(newItemUID)

                        -- add item to container
                        local addItemToContainerResult = newContainer:addItemEx(newItem)
                        -- report error if it's not possible to add item to container
                        if type(addItemToContainerResult) ~= "number" or addItemToContainerResult ~= RETURNVALUE_NOERROR then
                            player:sendTextMessage(SHOP_MSG_TYPE, MESSAGE_ERROR_CONTACT)
                            print('[ERRO] Shop Donate (' .. player:getName() .. ') - não pode adicionar item no Container - item não é pegável OU variável "RETURNVALUE_NOERROR" não existe em LUA - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                            return true
                        end
                    end

                    -- get player store inbox as container, so we can add item to it
                    local playerStoreInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
                    -- cannot open Store Inbox, report problem
                    if not playerStoreInbox then
                        player:sendTextMessage(SHOP_MSG_TYPE, MESSAGE_ERROR_CONTACT)
                        print('[ERRO] Shop Donate (' .. player:getName() .. ') - não pode abrir Store Inbox - it is not supported in your server OR variable "CONST_SLOT_STORE_INBOX" is not definied in LUA')
                        return true
                    end
                    -- add container with items to Store Inbox
                    receivedItemStatus = playerStoreInbox:addItemEx(newContainer)

                    if type(receivedItemStatus) == "number" and receivedItemStatus == RETURNVALUE_NOERROR then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'You received ' .. shopOfferName .. ' from Website Shop. You can find your item in STORE INBOX (under EQ).')
                        db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. transactionId)
                        db.asyncQuery("UPDATE `z_shop_history_item` SET `trans_state`= 'realized', `trans_real`=" .. os.time() .. " WHERE `id` = " .. transactionId)
                    else
                        player:sendTextMessage(SHOP_MSG_TYPE, MESSAGE_ERROR_CONTACT)
                        print('[ERRO] Shop Donate (' .. player:getName() .. ') - não pode adicionar Container com itens no Store Inbox - unknown reason, is it\'s size limited and it is full? - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount .. ', CONTAINER ID:' .. containerId .. ', ITEMS IN CONTAINER COUNT:' .. containerItemsInsideCount)
                    end

-- DELIVER YOUR CUSTOM THINGS
                elseif shopOfferType == 'mount' then -- addon, mount etc.
                    player:addMount(MountsShop[itemId])
					player:setStorageValue(itemId, 1)
                    player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
                    player:sendTextMessage(SHOP_MSG_TYPE, 'Você recebeu ' .. shopOfferName .. ' do Shop Donate!')
                    db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. transactionId)
                    db.asyncQuery("UPDATE `z_shop_history_item` SET `trans_state`= 'realized', `trans_real`=" .. os.time() .. " WHERE `id` = " .. transactionId)    
                elseif shopOfferType == 'addon' then
                    player:addOutfit(AddonsShop[itemId].m)
                    player:addOutfitAddon(AddonsShop[itemId].m, 3)
                    if (AddonsShop[itemId].f ~= 141) then
                        player:addOutfit(AddonsShop[itemId].f)
                        player:addOutfitAddon(AddonsShop[itemId].f, 3)
                    end
					player:setStorageValue(itemId,1)
                    player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
                    player:sendTextMessage(SHOP_MSG_TYPE, 'Você recebeu ' .. shopOfferName .. ' do Shop Donate!')
                    db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. transactionId)
                    db.asyncQuery("UPDATE `z_shop_history_item` SET `trans_state`= 'realized', `trans_real`=" .. os.time() .. " WHERE `id` = " .. transactionId)
                end
            end
        until not result.next(resultId)
        result.free(resultId)
    end

    return true
end