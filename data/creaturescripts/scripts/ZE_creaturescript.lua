-- <event type="preparedeath" name="ZumbiDeath" script="ZE_creaturescript.lua"/>

dofile('data/lib/ZE_config.lua')

function onPrepareDeath(cid, killer)
	local player = Player(cid)
	local enemy = Monster(killer)

	if enemy:getName() == "Zumbi" then
		if (getGlobalStorageValue(ZE.storage) > 0) then
			if (getGlobalStorageValue(ZE.storage) == 1) then
				player:say("ZUMBI EVENT WIN!", TALKTYPE_MONSTER_SAY)
				setGlobalStorageValue(ZE.storage, 0)
				broadcastMessage("The player "..player:getName().." is the winner of the Zombie Event.", MESSAGE_STATUS_WARNING)
				player:sendTextMessage(MESSAGE_STATUS_WARNING, ZE.reward[3])
				player:addItem(ZE.reward[1], ZE.reward[2])
			else
				enemy:say("DEAD!", TALKTYPE_MONSTER_SAY)
	
			end

			setGlobalStorageValue(ZE.storage, getGlobalStorageValue(ZE.storage) - 1)
		end

		player:teleportTo(player:getTown():getTemplePosition())
		player:unregisterEvent("ZumbiDeath")
		player:setStorageValue(357812, 0)
	end

	return false
end