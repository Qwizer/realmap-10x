local tableOutfits = {
	[13545] = Storage.OutfitQuest.Afflicted.Outfit,
	[13543] = Storage.OutfitQuest.Afflicted.Outfit-1,
	[13541] = Storage.OutfitQuest.Afflicted.Outfit-2,
	[13540] = Storage.OutfitQuest.Afflicted.Outfit-3,
	[13542] = Storage.OutfitQuest.Afflicted.Outfit-4,
	[13544] = Storage.OutfitQuest.Afflicted.Outfit-5
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local hasOutfit = player:getStorageValue(Storage.OutfitQuest.Afflicted.Outfit) >= 6

	-- Plgue Mask
	if item.itemid == 13925 then
		if not hasOutfit then
			return false
		end

		if player:getStorageValue(Storage.OutfitQuest.Afflicted.AddonPlagueMask) == 1 then
			return false
		end

		player:addOutfitAddon(430, 2)
		player:addOutfitAddon(431, 2)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(Storage.OutfitQuest.Afflicted.AddonPlagueMask, 1)
		player:say('You gained a plague mask for your outfit.', TALKTYPE_MONSTER_SAY, false, player)
		item:remove()

	-- Plague Bell
	elseif item.itemid == 13926 then
		if not hasOutfit then
			return false
		end

		if player:getStorageValue(Storage.OutfitQuest.Afflicted.AddonPlagueBell) == 1 then
			return false
		end

		player:addOutfitAddon(430, 1)
		player:addOutfitAddon(431, 1)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(Storage.OutfitQuest.Afflicted.AddonPlagueBell, 1)
		player:say('You gained a plague bell for your outfit.', TALKTYPE_MONSTER_SAY, false, player)
		item:remove()

	-- Outfit
	else
		local count = 0
		for i, v in pairs(tableOutfits) do
			if (player:getStorageValue(v) == 1) then
				count = count + 1
			end
		end

		if (count == 6) then
			return false
		end

		if (not tableOutfits[item:getId()]) then
			return false
		end

		if (player:getStorageValue(tableOutfits[item:getId()]) == -1) then
			player:setStorageValue(tableOutfits[item:getId()], 1)
		else
			player:say("You have already used this part.", TALKTYPE_MONSTER_SAY, false, player)
			return true
		end

		item:remove(1)
		if (count == 5) then
			player:addOutfit(430)
			player:addOutfit(431)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:say('You have restored an outfit.', TALKTYPE_MONSTER_SAY, false, player)
		else
			player:say('You used ' ..ItemType(item:getId()):getName().. ' for Afflicted Addon.', TALKTYPE_MONSTER_SAY, false, player)
		end
	end
	return true
end
