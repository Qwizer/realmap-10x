local skulls = {
[0] = {0, 2229, "Player"},
[1] = {3, 2229, "PK"},
[2] = {4, 2229, "PK RED"},
[3] = {5, 2229, "PK BLACK"}
}

function onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	
	if (killer:isPlayer()) then
		for index, pk in pairs(skulls) do
			if (player:getSkull() == pk[1]) then
				local x = killer:addItem(pk[2], 1)
				x:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "You recognize "..player:getName().. " skull. He was killed by "..killer:getName().. " at level " ..player:getLevel()..".\n"..(os.date("%d")).." "..(os.date("%B")).." "..os.date("%Y").." "..(os.date("%A"))..".")
			end
		end
	end
	
	return true
end