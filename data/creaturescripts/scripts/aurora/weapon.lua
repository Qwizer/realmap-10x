function onKill(player, target)
	if (getSlottedItems(player) == 0) then
		return 
	end
	slot = player:getSlotItem(CONST_SLOT_LEFT)
	if (slot.type > 1) then
		return player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Use only 1 weapon or disable experience weapon.") and true
	end
	if Player(target) then
		return true
	end
	local pos, weapon = player:getPosition(), getWeapon(player)
	local expp, ato, level, item = MonsterType(target:getName():lower()):getExperience() * Game.getExperienceStage(player:getLevel()), getItemAttribute(weapon.uid, "aid"), getItemLevel(weapon.uid), Item(weapon.uid)
	if (level == LEVEL_REQUIRED_FOR_FULL) then
		if (string.match("".. item:getDescription() .."", "{Maxxed}")) then
			return true
		else
			setItemExp(weapon.uid, "Experience: {Maxxed}", player)
		end
		return true
	end
	if (Monster(target) and not Creature(target):getMaster()) then
		if (player:getStorageValue(STORAGE_WEAPON) >= 1) then
			for k, p in pairs(lexps) do
				if (level == k) then
					if (ato >= p[2]) then
						setItemLevel(weapon.uid, level + 1)
						if (level ~= "0") then
						end
						pos:sendMagicEffect(50)
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations you weapon upgrade from ".. level .." to level ".. level + 1)
						setItemExp(weapon.uid, "{Advanced}")
						item:setAttribute("aid", 0)
					else
						local formula_weapon = math.floor(expp * PORCENT_FOR_EXP / 100)
						local formula_player = math.floor(expp - formula_weapon)
						if (getItemLevel(weapon.uid) ~= "0") then
							name = "".. string.sub("".. slot:getName() .."", 1, -6)
						else
							name = "".. slot:getName()
						end
						doPlayerRemoveExperience(player, - formula_player, "You weapon received ".. formula_weapon .." experience ")
						setItemExp(weapon.uid, "{Exp weapon: ".. ato + formula_weapon .."/".. p[2] .."}", player)
						item:setAttribute("aid", ato + formula_weapon)
					end
				end
			end
		else
			return true
		end
	end
	return true
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if (not isPlayer(attacker)) then 
		return primaryDamage, primaryType, secondaryDamage, secondaryType and true
	end
	if (getSlottedItems(attacker) == 0) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
	 end
	local weapon = getWeapon(attacker)
    if tonumber(getItemLevel(weapon.uid)) == 0 then
		return primaryDamage, primaryType, secondaryDamage, secondaryType and true
    end
	if (tonumber(getItemLevel(weapon.uid)) == LEVEL_REQUIRED_FOR_FULL) then
		d = tonumber(getItemLevel(weapon.uid))
	else
		d = (tonumber(getItemLevel(weapon.uid)) + 5)
	end
	if (d * PORCENT_FOR_HIT) then
        if (primaryType ~= COMBAT_HEALING) then
            primaryDamage = primaryDamage + math.ceil(primaryDamage * (convert(tonumber(getItemLevel(weapon.uid)))))
        end
	end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

function onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if (not isPlayer(attacker)) then 
		return primaryDamage, primaryType, secondaryDamage, secondaryType and true
	end
	if (getSlottedItems(attacker) == 0) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
	 end
	local weapon = getWeapon(attacker)
    if tonumber(getItemLevel(weapon.uid)) == 0 then
		return primaryDamage, primaryType, secondaryDamage, secondaryType and true
    end
	if (tonumber(getItemLevel(weapon.uid)) == LEVEL_REQUIRED_FOR_FULL) then
		d = tonumber(getItemLevel(weapon.uid))
	else
		d = (tonumber(getItemLevel(weapon.uid)) + 5)
	end
	if (d * PORCENT_FOR_HIT) then
        if (primaryType ~= COMBAT_HEALING) then
            primaryDamage = primaryDamage + math.ceil(primaryDamage * (convert(tonumber(getItemLevel(weapon.uid)))))
        end
	end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end