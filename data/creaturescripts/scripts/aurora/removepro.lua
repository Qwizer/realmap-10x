function onLogin(cid) 
if getPlayerPremiumDays(cid) == 0 and getPlayerVocation(cid) >= 9 then
doPlayerSetVocation(cid, getPlayerVocation(cid) - 4)
getPlayerLastLoginSaved(cid)
end
return true
end