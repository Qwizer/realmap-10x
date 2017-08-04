function onStepIn(creature, item, pos, fromPosition)
	if (creature:isPlayer()) then
		if (getCastleEventStatus() <= EVENT_CLOSED) then
			if (castleOwner > 0) then 
				local guild = creature:getGuild()
				if (guild) then
					if (guild:getId() ~= castleOwner) then
						creature:teleportTo(fromPosition)
					end 
				else
					creature:teleportTo(fromPosition)
				end
			else
				creature:teleportTo(fromPosition)
			end

		else
			creature:registerToCastle()
		end
	end
	return true 
end