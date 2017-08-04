local TP_Capture = {x = 32473, y = 32471, z = 6} -- 32357, 32213, 7


function removeCaputaTp()
	local TPCaputre = getTileItemById(TP_Capture, 1387).uid -- aid
	return TPCaputre > 0 and doRemoveItem(TPCaputre) and doSendMagicEffect(TPCaputre, CONST_ME_POFF)
end

function onTime()
 captureTheFlag.close()
 captureTheFlag.start()
 addEvent(captureTheFlag.round, 10*60*1000)
 local tp = Game.createItem(1387, 1, TP_Capture)
			tp:setActionId(15153)
 broadcastMessage("Capture the Flag event will start in 10 minutes, entrance in Event Room [Temple Thais].", MESSAGE_EVENT_ADVANCE) 
 addEvent(broadcastMessage, 5 * 60 * 1000, "Capture the Flag event will start in 5 minutes, entrance in Event Room [Temple Thais].", MESSAGE_EVENT_ADVANCE)
 addEvent(broadcastMessage, 8 * 60 * 1000, "Capture the Flag event will start in 2 minutes, entrance in Event Room [Temple Thais].", MESSAGE_EVENT_ADVANCE)
 addEvent(removeCaputaTp, 10 * 60 * 1000, "Capture the Flag event will start now!", MESSAGE_EVENT_ADVANCE)
end