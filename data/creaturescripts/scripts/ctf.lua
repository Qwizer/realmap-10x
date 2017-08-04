--[[
File: ctf.lua (creaturescripts)

<event type="preparedeath" name="CTFDeath" script="ctf.lua" />
<event type="healthchange" name="CTFHealthChange" script="ctf.lua" />
]]

function onPrepareDeath(creature, killer)
	if captureTheFlag.getPlayerState(creature) == CTF_STATE_FIGHT then
		captureTheFlag.onDeath(creature)
		return false
	end
	return true
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	local infoA = captureTheFlag.players[creature:getName()]
	local infoB = attacker and captureTheFlag.players[attacker:getName()]
	if infoA and infoB and infoA.team == infoB.team and primaryType ~= COMBAT_HEALING then
		return 0, 0, 0, 0
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
