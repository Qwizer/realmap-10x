local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)

	if msgcontains(msg, 'mission') then
		npcHandler:say('I can offer you several missions: to {deliver} parcels to our boys and girls in the battlefield, to get reports from our {undercover} gnomes, to do some {temperature} measuring and to {kill} some drillworms.',cid)
		npcHandler.topic[cid] = 0
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points) == -1 then
			player:setStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points, 0)
		end
	elseif msgcontains(msg, 'deliver') then		
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Deliver) < 1 then
			npcHandler:say("We need someone to bring four parcels to some of our far away outposts in the caverns. If you are interested, I can give you some more information about it. Are you willing to accept this mission?", cid)
			npcHandler.topic[cid] = 1
		elseif npcHandler.topic[cid] == 10 and player:getStorageValue(6874116) == 1 then
			npcHandler:say("Oh good, you have finished the {deliver} task. Here are your reward and your one point of famous!", cid)
			player:addExperience(3500, true)
			player:setStorageValue(6874116, -1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points, player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points) + 1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Deliver, 0)
			npcHandler.topic[cid] = 0	
		else
			npcHandler:say("You don\'t have finished the task what i desired to you! Go and finish it.", cid)
			npcHandler.topic[cid] = 0	
		end		
	elseif msgcontains(msg, 'undercover') then		
			npcHandler:say("This task is not working now!", cid)
			npcHandler.topic[cid] = 0		
	elseif msgcontains(msg, 'temperature') then
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Temperature) < 1 then	
			npcHandler:say("Your task would be to use a gnomish temperature measurement device - short GTMD - to locate the hottest spot at the lava pools in the caves. If you are interested, I can give you some more information about it. Are you willing to accept this mission?", cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 10 and player:getStorageValue(6874117) == 1 then
			npcHandler:say("Oh good, you have finished the {temperature} task. Here are your reward and your one point of famous!", cid)
			player:addExperience(3500, true)
			player:setStorageValue(6874117, -1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points, player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points) + 1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Temperature, 0)
			npcHandler.topic[cid] = 0	
		else
			npcHandler:say("You don\'t have finished the task what i desired to you! Go and finish it.", cid)
			npcHandler.topic[cid] = 0	
		end	
	elseif msgcontains(msg, 'kill') then
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Kill) < 1 then
			npcHandler:say("This mission will require you to kill some drillworms for us. If you are interested, I can give you some more information about it. Are you willing to accept this mission?", cid)
			npcHandler.topic[cid] = 4	
		elseif npcHandler.topic[cid] == 10 and player:getStorageValue(6874118) == 6 then
			npcHandler:say("Oh good, you have finished the {kill} task. Here are your reward and your one point of famous!", cid)
			player:addExperience(3500, true)
			player:setStorageValue(6874118, -1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points, player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points) + 1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Kill, 0)
			npcHandler.topic[cid] = 0	
		else
			npcHandler:say("You don\'t have finished the task what i desired to you! Go and finish it.", cid)
			npcHandler.topic[cid] = 0	
		end				
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({"Gnometastic! Here are the parcels. Regrettably, the labels got lost during transport; but I guess those lonely gnomes won't mind as long as they get ANY parcel at all. ...",
							"If you lose the parcels, you'll have to get new ones. Gnomux sells all the equipment that is required for our missions."
							}, cid)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnomargery.Deliver, 1)
			player:addItem(21569, 4)
			npcHandler.topic[cid] = 0			
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say("Gnometastic! Get three reports from our agents. You can find them anywhere in the caves around us. Just keep looking for monsters that behave strangely and give you a wink.", cid)
			
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say("Gnometastic! Find the hottest spot of the lava pools in the caves. If you lose the GTMD before you find the hot spot, you'll have to get yourself a new one. Gnomux sells all the equipment that is required for our missions.", cid)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnomargery.Temperature, 1)
			player:addItem(21556)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			npcHandler:say("Gnometastic! You should have no trouble finding enough drillworms.", cid)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnomargery.Kill, 1)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'report') then
		npcHandler:say("Oh well, what task you want to report?", cid)
		npcHandler.topic[cid] = 10
	end

	return true
end

npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)