function onPrepareDeath(player, killer, item, fromPosition)
  if player:getStorageValue(80002) == 2 then
    player:setStorageValue(80002, 1)
	end
	
    player:teleportTo(player:getTown():getTemplePosition())
    player:addHealth(player:getMaxHealth())
    player:addMana(1 - player:getMana())
    player:unregisterEvent("Arena")
	player:removeCondition()
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You are dead.")
	local item = Game.createItem(3058, 1, killer:getPosition())
	item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "You recognize "..player:getName().. ". " .. (player:getSex() == PLAYERSEX_FEMALE and "She" or "He") .. " was killed by "..killer:getName().. ".")
    return false
end