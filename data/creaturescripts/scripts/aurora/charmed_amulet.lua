local amuletId = 2139
local rateLoot = getConfigInfo('rateLoot')


function onKill(cid, target, lastHit)
if isPlayer(cid) and isMonster(target) then
if getPlayerSlotItem(cid, 2).itemid == amuletId then
doSetCreatureDropLoot(cid, rateLoot * 2)
doSetCreatureDropLoot(cid, rateLoot)
doSendMagicEffect(cid, 31)
end
end
    return true
end