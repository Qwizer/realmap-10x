-- Players cannot throw items on teleports if set to true
local blockTeleportTrashing = true

local titles = {
    {storageID = 14960, title = " Scout"},
    {storageID = 14961, title = " Sentinel"},
    {storageID = 14962, title = " Steward"},
    {storageID = 14963, title = " Warden"},
    {storageID = 14964, title = " Squire"},
    {storageID = 14965, title = " Warrior"},
    {storageID = 14966, title = " Keeper"},
    {storageID = 14967, title = " Guardian"},
    {storageID = 14968, title = " Sage"},
	{storageID = 14969, title = " Tutor"},
	{storageID = 14970, title = " Senior Tutor"},
	{storageID = 14971, title = " King"},
}
 
local function getTitle(uid)
    local player = Player(uid)
    if not player then return false end
 
    for i = #titles, 1, -1 do
        if player:getStorageValue(titles[i].storageID) == 1 then
            return titles[i].title
        end
    end
    return false
end

function Player:onBrowseField(position)
	return true
end

local function getHours(seconds)
	return math.floor((seconds/60)/60)
end

local function getMinutes(seconds)
	return math.floor(seconds/60)
end

local function getTime(seconds)
	local hours, minutes = getHours(seconds), getMinutes(seconds)
	if (minutes > 59) then
		minutes = minutes-hours*60
	end

	if (minutes < 10) then
		minutes = "0" ..minutes
	end

	return hours..":"..minutes.. "h"
end

function Player:onLook(thing, position, distance)
	local description = 'You see '

	if thing:isItem() then
		if thing.actionid == 5640 then
			description = description .. 'a honeyflower patch.'
		elseif thing.actionid == 5641 then
			description = description .. 'a banana palm.'
		else
			description = description .. thing:getDescription(distance)
		end
		local itemType = thing:getType()
		if (itemType and itemType:getImbuingSlots() > 0) then
			local imbuingSlots = "Imbuements: ("
			for i = 1, itemType:getImbuingSlots() do
				local specialAttr = thing:getSpecialAttribute(i)
				local time = 0
				if (thing:getSpecialAttribute(i+3)) then
					time = getTime(thing:getSpecialAttribute(i+3))
				end
				
				if (specialAttr) then
					if (i ~= itemType:getImbuingSlots()) then
						imbuingSlots = imbuingSlots.. "" ..specialAttr.." " ..time..", "
					else
						imbuingSlots = imbuingSlots.. "" ..specialAttr.." " ..time..")."
					end
				else
					if (i ~= itemType:getImbuingSlots()) then
						imbuingSlots = imbuingSlots.. "Empty Slot, "
					else
						imbuingSlots = imbuingSlots.. "Empty Slot)."
					end
				end
			end
			description = string.gsub(description, "It weighs", imbuingSlots.. "\nIt weighs")
		end
	else
		description = description .. thing:getDescription(distance)
	end

		--[[-- KD look 
	 if thing:isCreature() and thing:isPlayer() then
        description = string.format("%s\n [PVP Kills: %d] \n [PVP Deaths: %d] \n",
            description, math.max(0, thing:getStorageValue(167912)), math.max(0, thing:getStorageValue(167913)))
    end
		end--]]
	
	--[[-- MARRY 
	if LOOK_MARRIAGE_DESCR and thing:isCreature() then
		if thing:isPlayer() then
			description = description .. self:getMarriageDescription(thing)
		end
	end--]]

	if self:getGroup():getAccess() then
		if thing:isItem() then
			description = string.format('%s\nItem ID: %d', description, thing.itemid)

			local actionId = thing.actionid
			if actionId ~= 0 then
				description = string.format('%s, Action ID: %d', description, actionId)
			end

			local uniqueId = thing:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)
			if uniqueId > 0 and uniqueId < 65536 then
				description = string.format('%s, Unique ID: %d', description, uniqueId)
			end

			description = description .. '.'
			local itemType = thing:getType()

			local transformEquipId = itemType:getTransformEquipId()
			local transformDeEquipId = itemType:getTransformDeEquipId()
			if transformEquipId ~= 0 then
				description = string.format('%s\nTransforms to: %d (onEquip)', description, transformEquipId)
			elseif transformDeEquipId ~= 0 then
				description = string.format('%s\nTransforms to: %d (onDeEquip)', description, transformDeEquipId)
			end

			local decayId = itemType:getDecayId()
			if decayId ~= -1 then
				description = string.format('%s\nDecays to: %d', description, decayId)
			end
		elseif thing:isCreature() then
			local title = getTitle(thing.uid)
if title then description  = description  .. title .. " of Relembra." end
			local str = '%s\nHealth: %d / %d'
			if thing:getMaxMana() > 0 then
				str = string.format('%s, Mana: %d / %d', str, thing:getMana(), thing:getMaxMana())
			end
			description = string.format(str, description, thing:getHealth(), thing:getMaxHealth()) .. '.'
		end

		local position = thing:getPosition()
		description = string.format(
			'%s\nPosition: %d, %d, %d',
			description, position.x, position.y, position.z
		)

		if thing:isCreature() and thing:isPlayer() then
			description = string.format('%s\nIP: %s.', description, Game.convertIpToString(thing:getIp()))
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
	
end

function Player:onLookInBattleList(creature, distance)

	local description = 'You see ' .. creature:getDescription(distance)
	if self:getGroup():getAccess() then
		local str = '%s\nHealth: %d / %d'
		if creature:getMaxMana() > 0 then
			str = string.format('%s, Mana: %d / %d', str, creature:getMana(), creature:getMaxMana())
		end
		description = string.format(str, description, creature:getHealth(), creature:getMaxHealth()) .. '.'

		
	
		local position = creature:getPosition()
		description = string.format(
			'%s\nPosition: %d, %d, %d',
			description, position.x, position.y, position.z
		)

		if creature:isPlayer() then
			description = string.format('%s\nIP: %s.', description, Game.convertIpToString(creature:getIp()))
		end
	end
	
	
	--[[KD look 
	 if creature:isPlayer() and creature:isCreature() then
        description = string.format("%s\n [PVP Kills: %d] \n [PVP Deaths: %d] \n",
            description, math.max(0, creature:getStorageValue(167912)), math.max(0, creature:getStorageValue(167913)))
    end--]]
	
	--[[-- MARRY  
	if LOOK_MARRIAGE_DESCR and creature:isCreature() then
		if creature:isPlayer() then
			description = description .. self:getMarriageDescription(creature)
		end
	end--]]

	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInTrade(partner, item, distance)
	self:sendTextMessage(MESSAGE_INFO_DESCR, 'You see ' .. item:getDescription(distance))
end

function Player:onLookInShop(itemType, count)
	return true
end

function Player:onMoveCreature(creature, fromPosition, toPosition)
	return true
end

function Player:onTurn(direction)
	if self:getAccountType() >= ACCOUNT_TYPE_GOD and self:getGroup():getAccess() then
		if self:getDirection() == direction then
			local nextPosition = self:getPosition()
			nextPosition:getNextPosition(direction)

			self:teleportTo(nextPosition, true)
		end
    end
	return true
end

local function getAllItemsByAid(player, aid, item)
    local containers = {}
    local items = {}
   
    local sitem = item
    if sitem then
        if sitem.uid > 0 then
            if isContainer(sitem.uid) then
                table.insert(containers, sitem.uid)
            elseif not (aid) or aid == sitem:getActionId() then
                table.insert(items, sitem)
            end
        end
    end

    while #containers > 0 do
        for k = (Container(containers[1]):getSize() - 1), 0, -1 do
            local tmp = Container(containers[1]):getItem(k)
            if isContainer(tmp.uid) then
                table.insert(containers, tmp.uid)
            elseif not (aid) or aid == tmp:getActionId() then
                table.insert(items, tmp)
            end
        end
        table.remove(containers, 1)
    end

    return items
end

function Player:onTradeRequest(target, item)
	local tmpCont = Container(item:getUniqueId())
	if (tmpCont) then
		if (#getAllItemsByAid(self, 23095, item) > 0) then
			return false
		end
	end

	if (isInArray({1738, 1740, 1747, 1748, 1749, 8766}, item.itemid) and item.actionid > 0 or item.actionid == 5640) or
	    item.itemid == 26377 or item:getActionId() == 23095 then
		self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return false
	end
	return true
end

function Player:onTradeAccept(target, item, targetItem)
	return true
end

local soulCondition = Condition(CONDITION_SOUL, CONDITIONID_DEFAULT)
soulCondition:setTicks(4 * 60 * 1000)
soulCondition:setParameter(CONDITION_PARAM_SOULGAIN, 1)

function useStaminaImbuing(player, item)
    for i = 1, item:getType():getImbuingSlots() do
        if (item:isActiveImbuement(i+3)) then
            local staminaMinutes = item:getSpecialAttribute(i+3)/60
            if (staminaMinutes > 0) then
                local currentTime = os.time()
                local timePassed = currentTime - item:getSpecialAttribute(i+6)
                if timePassed > 0 then
                    if timePassed > 60 then
                        if staminaMinutes > 2 then
                            staminaMinutes = staminaMinutes - 2
                        else
                            staminaMinutes = 0
                        end

                        item:setSpecialAttribute(i+6, currentTime + 120)
                    else
                        staminaMinutes = staminaMinutes - 1
                        item:setSpecialAttribute(i+6, currentTime + 60)
                    end
                end

                item:setSpecialAttribute(i+3, staminaMinutes*60)
            end
        end
    end
end

local function useStamina(player)
	local staminaMinutes = player:getStamina()
	if staminaMinutes == 0 then
		return
	end

	local playerId = player:getId()
	local currentTime = os.time()
	local timePassed = currentTime - nextUseStaminaTime[playerId]
	if timePassed <= 0 then
		return
	end

	if timePassed > 60 then
		if staminaMinutes > 2 then
			staminaMinutes = staminaMinutes - 2
		else
			staminaMinutes = 0
		end
		nextUseStaminaTime[playerId] = currentTime + 120
	else
		staminaMinutes = staminaMinutes - 1
		nextUseStaminaTime[playerId] = currentTime + 60
	end
	player:setStamina(staminaMinutes)
end

local function useStaminaXp(player)
	local staminaMinutes = player:getExpBoostStamina()
	if staminaMinutes == 0 then
		return
	end

	local playerId = player:getId()
	local currentTime = os.time()
	local timePassed = currentTime - nextUseXpStamina[playerId]
	if timePassed <= 0 then
		return
	end

	if timePassed > 60 then
		if staminaMinutes > 2 then
			staminaMinutes = staminaMinutes - 2
		else
			staminaMinutes = 0
		end
		nextUseXpStamina[playerId] = currentTime + 120
	else
		staminaMinutes = staminaMinutes - 1
		nextUseXpStamina[playerId] = currentTime + 60
	end
	player:setExpBoostStamina(staminaMinutes)
end

local function useStaminaPrey(player, name)
	for i = 1, 3 do
		if (player:isActiveByName(i-1, name)) then
			local staminaMinutes = player:getPreyStamina(i-1)/60
			if (staminaMinutes > 0) then
				local playerId = player:getId()+i
				local currentTime = os.time()
				local timePassed = currentTime - nextUseStaminaPrey[playerId].Time

				if timePassed > 0 then
					if timePassed > 60 then
						if staminaMinutes > 2 then
							staminaMinutes = staminaMinutes - 2
						else
							staminaMinutes = 0
						end

						nextUseStaminaPrey[playerId].Time = currentTime + 120
					else
						staminaMinutes = staminaMinutes - 1
						nextUseStaminaPrey[playerId].Time = currentTime + 60
					end
				end

				player:setPreyStamina(i-1, staminaMinutes*60)
				player:sendPreyTimeLeft(i-1, staminaMinutes*60)
			end
		end
	end
end

function Player:onGainExperience(source, exp, rawExp)
 	if not source or source:isPlayer() then
 		return exp
 	end
	
	--if self:isPremium() then
	--local exp_extra = 0.8 -- 20% +
		--exp = exp * exp_extra
	--end
	
	-- Soul regeneration
	local vocation = self:getVocation()
	if self:getSoul() < vocation:getMaxSoul() and exp >= self:getLevel() then
		soulCondition:setParameter(CONDITION_PARAM_SOULTICKS, vocation:getSoulGainTicks() * 1000)
		self:addCondition(soulCondition)
	end

	-- Apply experience stage multiplier
	exp = exp * Game.getExperienceStage(self:getLevel())

	for i = 1, 3 do
		if (self:isActive(i-1)) then
			local bonusInfo = self:getBonusInfo(i-1)
			if (bonusInfo.Type == 2 and source:getName() == bonusInfo.Name) then
				exp = exp + math.floor(exp * (bonusInfo.Value/100))
				break
			end
		end
	end

	if (self:getExpBoostStamina() <= 0 and self:getExpBoost() > 0) then
		self:setExpBoost(0) -- reset xp boost to 0
	end

	-- Mais compacto, depois da verificação de antes (reset) ele só da xp se tiver :v
	if (self:getExpBoost() > 0) then
		exp = exp + (exp * (self:getExpBoost()/100)) -- Exp Boost
	end

	local party = self:getParty()
	if (party) then
		if (party:isSharedExperienceActive() and
			party:isSharedExperienceEnabled()) then
			local tableVocs = {}
			local count = 0
			local totalCount = 0
			local leaderId = party:getLeader():getVocation():getId()
			if (leaderId) then
				tableVocs[leaderId] = 1
				count = count + 1
				totalCount = totalCount + 1
			end
			for i, v in pairs(party:getMembers()) do
				local vocId = v:getVocation():getId()
				if (tableVocs[vocId] == nil) then
					tableVocs[vocId] = 1
					count = count + 1
				end
				totalCount = totalCount + 1
			end

			if (totalCount <= 10 and
				count >= 4) then
				exp = exp * 2
			end
		end
	end

	-- Prey Stamina Modifier
	useStaminaPrey(self, source:getName())

	-- Exp Boost Modifier
	useStaminaXp(self)
	
	-- Stamina modifier
	if configManager.getBoolean(configKeys.STAMINA_SYSTEM) then
		useStamina(self)

		local staminaMinutes = self:getStamina()
		if staminaMinutes > 2400 and self:isPremium() then
			exp = exp * 1.5
		elseif staminaMinutes <= 840 then
			exp = exp * 0.5
		end
	end
	return exp
end

function Player:onLoseExperience(exp)
	return exp
end

function Player:onGainSkillTries(skill, tries)
	if APPLY_SKILL_MULTIPLIER == false then
		return tries
	end

	if skill == SKILL_MAGLEVEL then
		return tries * configManager.getNumber(configKeys.RATE_MAGIC)
	end
	return tries * configManager.getNumber(configKeys.RATE_SKILL)
end

function Player:onUseWeapon(normalDamage, elementType, elementDamage)
	--[[if (self:getAccountType() < ACCOUNT_TYPE_GOD) then
		return normalDamage, elementType, elementDamage
	end]]--
	
    local weaponSlot = self:getSlotItem(CONST_SLOT_LEFT)
    if (weaponSlot and weaponSlot:getType():getImbuingSlots() > 0) then
        for i = 1, 3 do
        	local slotEnchant = weaponSlot:getSpecialAttribute(i)
            if (slotEnchant) then
                local percentDamage, enchantPercent = 0, weaponSlot:getImbuementPercent(slotEnchant)
                local typeEnchant = weaponSlot:getImbuementType(i) or ""
                if (typeEnchant ~= "") then
                    useStaminaImbuing(self, weaponSlot)

                end

                if (typeEnchant ~= "hitpointsleech" and typeEnchant ~= "manapointsleech" and typeEnchant ~= "criticalhit") then
                    percentDamage = normalDamage*(enchantPercent/100)
                    normalDamage = normalDamage - percentDamage
                    elementDamage = weaponSlot:getType():getAttack()*(enchantPercent/100)
                end

                if (typeEnchant == "firedamage") then
                    elementType = COMBAT_FIREDAMAGE
                elseif (typeEnchant == "earthdamage") then
                    elementType = COMBAT_EARTHDAMAGE
                elseif (typeEnchant == "icedamage") then
                    elementType = COMBAT_ICEDAMAGE
                elseif (typeEnchant == "energydamage") then
                    elementType = COMBAT_ENERGYDAMAGE
                elseif (typeEnchant == "deathdamage") then
                    elementType = COMBAT_DEATHDAMAGE
                end
            end
        end
    end

	return normalDamage, elementType, elementDamage
end

function Player:onCombatSpell(normalDamage, elementDamage, elementType)
	--[[normalDamage = normalDamage/2
	elementDamage = 22
	elementType = COMBAT_FIREDAMAGE--]]
	return normalDamage, elementType, elementDamage
end

local exhaust = { } -- SSA exhaust

local function distanceBetween(pos1, pos2)
	return math.abs(pos1-pos2)
end

function Player:onMoveItem(item, count, fromPosition, toPosition)
	local containerIdFrom = fromPosition.y - 64
	local containerFrom = self:getContainerById(containerIdFrom)
	if (containerFrom) then
		if (containerFrom:getId() == 26052 and
			toPosition.y >= 1 and
			toPosition.y <= 11 and
			toPosition.y ~= 3) then
			self:sendCancelMessage("You need to move the item for your backpack first.")
			return false
		end
		
		if item:getId() == 27595 then
		self:sendCancelMessage('You cannot move this object.')
		return false
	end

		if (item:getId() == 26377 and containerFrom:getId() == 26052) then
			self:sendCancelMessage("You can't move this item from Store Inbox.")
			return false
		end
	end

	if (toPosition.y == CONST_SLOT_FEET) then
		local feetItem = self:getSlotItem(CONST_SLOT_FEET)
		if (feetItem and feetItem:getActionId() == 23095) then
			return false
		end
	end

	if (item:isContainer()) then
		local vipItems = getAllItemsByAid(self, 23095, item)
		if (#vipItems > 0) then
			return false
		end
	end

	if (toPosition.y > 1000 and item:getActionId() == 23095) then
		return false
	end

	local containerTo = self:getContainerById(toPosition.y-64)
	if (containerTo) then
		-- VIP Boots guild in Ground bp
		if (item:getActionId() == 23095) then
			if (containerTo:getId() == 2594 or
				containerTo:getId() >= 25453 and
				containerTo:getId() <= 25469) then
				return false
			end

			local tileCont = Tile(containerTo:getPosition())
			if (tileCont) then
				for i, v in pairs(tileCont:getItems()) do
					if (v:getUniqueId() == containerTo:getUniqueId()) then
						return false
					end
				end
			end
		end

		if (item:getId() == 26377 and containerTo:getId() ~= 26052) then
			self:sendCancelMessage("You can only move this item to Store Inbox.")
			return false
		end

		-- Store Inbox
		if (containerTo:getId() == 26052 and item:getId() ~= 26377) then
			self:sendCancelMessage("You cannot add items in the store inbox.")
			return false
		end

		-- Gold Pounch
		if (containerTo:getId() == 26377) then
			if (not (item:getId() == 2160 or item:getId() == 2152 or item:getId() == 2148)) then
				self:sendCancelMessage("You can move only money to this container.")
				return false
			end
		end
	end
	
---
	local amuletId = 2197
	local storage = 1000
	local delay = 1 -- seconds

	if item:getId() == amuletId then
        if toPosition.y == CONST_SLOT_NECKLACE then
            if os.time() > self:getStorageValue(storage) then
                self:setStorageValue(storage, os.time() + delay)
            else
                self:sendCancelMessage("You cannot move this object to fast.")
                return false
            end
        end
    end

--- LIONS ROCK START 

if self:getStorageValue(lionrock.storages.playerCanDoTasks) - os.time() < 0 then
        local p, i = lionrock.positions, lionrock.items
        local checkPr = false
        if item:getId() == lionrock.items.ruby and toPosition.x == p.ruby.x
                and toPosition.y == p.ruby.y  and toPosition.z == p.ruby.z then
            -- Ruby
            self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You place the ruby on the small socket. A red flame begins to burn.")
            checkPr = true
            if lionrock.taskactive.ruby ~= true then
                lionrock.taskactive.ruby = true
            end
           
            local tile = Tile(p.ruby)
            if tile:getItemCountById(i.redflame) < 1 then
                Game.createItem(i.redflame, 1, p.ruby)
            end
        end
       
        if item:getId() == lionrock.items.sapphire and toPosition.x == p.sapphire.x
                and toPosition.y == p.sapphire.y  and toPosition.z == p.sapphire.z then
            -- Sapphire
            self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You place the sapphire on the small socket. A blue flame begins to burn.")
            checkPr = true
            if lionrock.taskactive.sapphire ~= true then
                lionrock.taskactive.sapphire = true
            end
           
            local tile = Tile(p.sapphire)
            if tile:getItemCountById(i.blueflame) < 1 then
                Game.createItem(i.blueflame, 1, p.sapphire)
            end
        end
       
        if item:getId() == lionrock.items.amethyst and toPosition.x == p.amethyst.x
                and toPosition.y == p.amethyst.y  and toPosition.z == p.amethyst.z then
            -- Amethyst
            self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You place the topaz on the small socket. A yellow flame begins to burn.")
            checkPr = true
            if lionrock.taskactive.amethyst ~= true then
                lionrock.taskactive.amethyst = true
            end
           
            local tile = Tile(p.amethyst)
            if tile:getItemCountById(i.yellowflame) < 1 then
                Game.createItem(i.yellowflame, 1, p.amethyst)
            end
        end
       
        if item:getId() == lionrock.items.topaz and toPosition.x == p.topaz.x
                and toPosition.y == p.topaz.y  and toPosition.z == p.topaz.z then
            -- Topaz
            self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You place the amethyst on the small socket. A violet flame begins to burn.")
            checkPr = true
            if lionrock.taskactive.topaz ~= true then
                lionrock.taskactive.topaz = true
            end
           
            local tile = Tile(p.topaz)
            if tile:getItemCountById(i.violetflame) < 1 then
                Game.createItem(i.violetflame, 1, p.topaz)
            end
        end
       
        if checkPr == true then
            -- Adding the Fountain which gives present
            if lionrock.taskactive.ruby == true and lionrock.taskactive.sapphire == true
                and lionrock.taskactive.amethyst == true and lionrock.taskactive.topaz == true then
               
                local fountain = Game.createItem(i.rewardfountain, 1, { x=33073, y=32300, z=9})
                fountain:setActionId(41357)
               local stone = Tile({ x=33073, y=32300, z=9}):getItemById(3608)
			if stone ~= nil then
			stone:remove()
			end
                self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Something happens at the centre of the room ...");
            end
           
            -- Removing Item
            item:remove(1)
        end
    end
 
    if toPosition.x == CONTAINER_POSITION then
        local cid = toPosition.y - 64 -- container id
        local container = self:getContainerById(cid)      
        if not container then
            return true
        end

		if toPosition.x == CONTAINER_POSITION and toCylinder and toCylinder:getId() == 26052 then
		self:sendCancelMessage(RETURNVALUE_CONTAINERNOTENOUGHROOM)
		return false
	end
           
        -- Do not let the player insert items into either the Reward Container or the Reward Chest
        local itemId = container:getId()      
        if itemId == ITEM_REWARD_CONTAINER or itemId == ITEM_REWARD_CHEST then
            self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
            return false
        end
 
        -- The player also shouldn't be able to insert items into the boss corpse      
        local tile = Tile(container:getPosition())
        for _, item in ipairs(tile:getItems() or { }) do
            if item:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == 2^31 - 1 and item:getName() == container:getName() then
                self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
                return false
            end
        end
    end
	
	-- MOVER PRO TP 
	if blockTeleportTrashing and toPosition.x ~= CONTAINER_POSITION then
        local thing = Tile(toPosition):getItemByType(ITEM_TYPE_TELEPORT)
        if thing then
            self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
            self:getPosition():sendMagicEffect(CONST_ME_POFF)
            return false
        end
    end
	
	-- MOVER PARCEL  
	if item:getWeight() > 90000 and item:getId() == 2595 and tile and tile:getItemById(2593) then 
		self:sendCancelMessage('You cannot move parcel too heavy to mailbox.')
		return false 
	end
 
    --local tile = Tile(toPosition)
    if tile and tile:getItemById(21584) then
        self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		self:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end
		
    -- Do not let the player move the boss corpse.
    if item:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == 2^31 - 1 then
        self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    return true
end