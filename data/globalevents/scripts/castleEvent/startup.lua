dofile("data/lib/events/castelo.lua")
function onStartup()
	castleOwner = getGlobalStorageValueDB(CASTELO_STOR)
	return true 
end