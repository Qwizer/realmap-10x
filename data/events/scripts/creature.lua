__picif = {}
function Creature:onChangeOutfit(outfit)
	return true
end
function Creature:onAreaCombat(tile, isAggressive)
    return true
end
 
local function removeCombatProtection(cid)
    local player = Player(cid)
    if not player then
        return true
    end
 
    local time = 0
    if player:isMage() then
        time = 10
    elseif player:isPaladin() then
        time = 20
    else
        time = 30
    end
 
    player:setStorageValue(Storage.combatProtectionStorage, 2)
    addEvent(function(cid)
        local player = Player(cid)
        if not player then
            return
        end
 
        player:setStorageValue(Storage.combatProtectionStorage, 0)
        player:remove()
    end, time * 1000, cid)
end
 
 
 -- AQUI TREINER ONLINE
 
 local staminaBonus = {
    target = 'Training Monk',
    period = 120000, -- período em milisegundos
    bonus = 1, -- stamina que ganha
    events = {}
}
 
local function addStamina(name)
    local player = Player(name)
    if not player then
        staminaBonus.events[name] = nil
    else
        local target = player:getTarget()
        if not target or target:getName() ~= staminaBonus.target then
            staminaBonus.events[name] = nil
        else
            player:setStamina(player:getStamina() + staminaBonus.bonus)
            staminaBonus.events[name] = addEvent(addStamina, staminaBonus.period, name)
        end
    end
end


function Creature:onTargetCombat(target)
    if not self then
        return true
    end
    if not __picif[target.uid] then
        if target:isMonster() then
            if (target:getType():isRewardBoss()) then
                target:registerEvent("RewardSystemSlogan")
                __picif[target.uid] = {}
            end
        end
    end
	
	--- BATTLEFIELD
    if self:isPlayer() and target:isPlayer() then
        if self:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 and target:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 or self:getStorageValue(_Lib_Battle_Info.TeamTwo.storage) >= 1 and target:getStorageValue(_Lib_Battle_Info.TeamTwo.storage) >= 1 then
            return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
        end
		if self:getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) >= 1 and target:getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) >= 1 or self:getStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1) >= 1 and target:getStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1) >= 1 then
            return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
        end
		--party protect
		local party = self:getParty()
		if party then
			local targetParty = target:getParty()
			if targetParty and targetParty == party then
				return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
			end
		end
    end
		
	--- BATTLEFIELD
   
    if target:isPlayer() then
        if self:isMonster() then
            local protectionStorage = target:getStorageValue(Storage.combatProtectionStorage)
 
            if target:getIp() == 0 then -- If player is disconnected, monster shall ignore to attack the player
                if protectionStorage <= 0 then
                    addEvent(removeCombatProtection, 30 * 1000, target.uid)
                    target:setStorageValue(Storage.combatProtectionStorage, 1)
                elseif protectionStorage == 1 then
                    self:searchTarget()
                    return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
                end
 
                return true
            end
 
            if protectionStorage >= os.time() then
                return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
            end
        end
    end
 
 -- AQUI TREINER ONLINE 
 
 if self:isPlayer() then
        if target and target:getName() == staminaBonus.target then
            local name = self:getName()
            if not staminaBonus.events[name] then
                staminaBonus.events[name] = addEvent(addStamina, staminaBonus.period, name)
            end
        end
    end
	
	-- FIM TREINER ONLINE
    return true
end

function Creature:onDrainHealth(attacker, typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary)
    if (not self) then
        return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
    end

    if (not attacker) then
        return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
    end

    if (attacker:isPlayer()) then
        if (self:isMonster() and not self:getMaster()) then
            for i = 1, 3 do
                if (attacker:isActive(i-1)) then
                    local bonusInfo = attacker:getBonusInfo(i-1)
                    if (bonusInfo.Type == 0 and bonusInfo.Name == self:getName()) then
                        damagePrimary = damagePrimary + math.floor(damagePrimary * (bonusInfo.Value/100))
                        break
                    end
                end
            end
        end
    elseif (attacker:isMonster()) then
        if (self:isPlayer()) then
            for i = 1, 3 do
                if (self:isActive(i-1)) then
                    local bonusInfo = self:getBonusInfo(i-1)
                    if (bonusInfo.Type == 1 and bonusInfo.Name == attacker:getName()) then
                        damagePrimary = damagePrimary - math.floor(damagePrimary * (bonusInfo.Value/100))
                        return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
                    end
                end
            end
        end
    end

    return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
end