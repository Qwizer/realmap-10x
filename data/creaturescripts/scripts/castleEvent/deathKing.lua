dofile("data/lib/events/castelo.lua")
function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	print(lasthitkiller:getName().."____")
	if (lasthitkiller:isPlayer()) then
		print("testasta")
		local guild = lasthitkiller:getGuild()
		if (guild) then 
			setGuildCastleOwner(guild)
		else
			Game.broadcastMessage(string.format("%s matou o king mais ele n e membro do uma guild.", lasthitkiller:getName()))
		end
		--time left??
		createCastleEventMonster(true)
	end
	return true 
end