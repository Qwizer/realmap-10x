function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if(getConfigInfo('pzTimeType') ~= true)then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end
	if(isPlayer(attacker) and attacker:isPzLocked() and not creature:isPlayer())then -- Pegou tempo porque vc atacou o bicho estando com pz.
		if(attacker:getTimePz() > 60)then
			return primaryDamage, primaryType, secondaryDamage, secondaryType and attacker:setTimePzDeath()
		end
		attacker:setTimePz()
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end
	if(not isPlayer(attacker) and creature:isPlayer() and creature:isPzLocked())then -- Pegou tempo porque o bicho te atacou e vc ja tinha pz.
		if(creature:getTimePz() > 60)then
			return primaryDamage, primaryType, secondaryDamage, secondaryType and creature:setTimePzDeath()
		end
		creature:setTimePz()
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end
	if(isPlayer(attacker) and attacker:isPzLocked() and creature:isPlayer())then -- Pegou pz por atacar alguém possuindo pz.
		if(attacker:getTimePz() > 60)then
			return primaryDamage, primaryType, secondaryDamage, secondaryType and attacker:setTimePzDeath()
		end
		attacker:setTimePz()
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end
	if(isPlayer(attacker) and attacker:isPzLocked() and creature:isPlayer() and creature:isPzLocked())then -- Ambos pegaram tempo pq ampos possuem pz.
		if(creature:getTimePz() > 60 and attacker:getTimePz() > 60)then
			return primaryDamage, primaryType, secondaryDamage, secondaryType and creature:setTimePzDeath() and attacker:setTimePzDeath()
		end
		attacker:setTimePz()
		creature:setTimePz()
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
function onKill(player, target)
	if(target:isPlayer() and player:isPlayer() and player:isPzLocked())then
		player:setTimePzDeath()
	end
	return true
end