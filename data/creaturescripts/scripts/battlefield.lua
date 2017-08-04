function onLogout(player)
	local info = Battlefield:findPlayer(player)
	if info then
		Battlefield:onLeave(player)
	end
	return true
end

function onPrepareDeath(player, killer)
	local info = Battlefield:findPlayer(player)
	if info then
		Battlefield:onDeath(player, killer)
	end
	return false
end

function onHealthChange(player, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
if not attacker then
  return primaryDamage, primaryType, secondaryDamage, secondaryType
 end
	local thisInfo = Battlefield:findPlayer(player)
	local otherInfo = Battlefield:findPlayer(attacker)
	if thisInfo and otherInfo and thisInfo.team == otherInfo.team then
		if primaryType ~= COMBAT_HEALING then
			return COMBAT_NONE, 0, COMBAT_NONE, 0
		end
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

function onManaChange(player, attacker, manaChange, origin)
if not attacker then
  return manaChange
 end
	local thisInfo = Battlefield:findPlayer(player)
	local otherInfo = Battlefield:findPlayer(attacker)
	if thisInfo and otherInfo and thisInfo.team == otherInfo.team then
		return 0
	end
	return manaChange
end
