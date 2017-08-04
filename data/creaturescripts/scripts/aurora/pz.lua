function onThink(cid, interval)
     if(getTilePzInfo(getCreaturePosition(cid))) then 
        doRemoveCondition(cid, CONDITION_INFIGHT)
     end
end