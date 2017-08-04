dofile("data/lib/events/castelo.lua")
function onTime()

	local day = os.date("%A")
	if (day == DAY) then
		startCastleEvent()
	end
	return true
end