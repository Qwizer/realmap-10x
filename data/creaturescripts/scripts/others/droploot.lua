--[[local function getAllItemsByAid(player, aid, item)
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
end--]]

function onDeath(player, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	--local haveGuildBoots = false
	if getPlayerFlagValue(player, PlayerFlag_NotGenerateLoot) then --or player:getVocation():getId() == VOCATION_NONE then
		return true
	end

	local amulet = player:getSlotItem(CONST_SLOT_NECKLACE)
	if amulet and amulet.itemid == ITEM_AMULETOFLOSS and not isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
		local isPlayer = false
		if killer then
			if killer:isPlayer() then
				isPlayer = true
			else
				local master = killer:getMaster()
				if master and master:isPlayer() then
					isPlayer = true
				end
			end
		end

		if not isPlayer or not player:hasBlessing(5) then
			player:removeItem(ITEM_AMULETOFLOSS, 1, -1, false)
		end
	else
		for i = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
			local item = player:getSlotItem(i)
			if item then
				if isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) or math.random(item:isContainer() and 100 or 1000) <= player:getLossPercent() then
					--[[if (item:isContainer()) then
						local vipItems = getAllItemsByAid(player, 23095, item)
						for j, k in pairs(vipItems) do
							if (k:getActionId() == 23095) then
								k:remove()
								haveGuildBoots = true
								break
							end
						end
						
						item:moveTo(corpse)
					elseif (item:getActionId() == 23095) then
						item:remove()
						haveGuildBoots = true
					else--]]
					item:moveTo(corpse)
					--end
				end
			end
		end
	end

	if not player:getSlotItem(CONST_SLOT_BACKPACK) then
		local bag = player:addItem(ITEM_BAG, 1, false, CONST_SLOT_BACKPACK)
		--[[if (haveGuildBoots) then
			bag:addItem(2358, 1):setActionId(23095)
		end--]]
	end
	return true
end
