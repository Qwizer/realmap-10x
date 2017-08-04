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
		npcHandler:say('I can offer you several missions: to gather geomantic {charges}, to {fertilise} the mushroom caves, to destroy monster {nests} and to {kill} some crystal crushers.',cid)
		npcHandler.topic[cid] = 0
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Points) == -1 then
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Points, 0)
		end
	elseif msgcontains(msg, 'charges') then
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Charges) < 1 then
			npcHandler:say({"Our mission for you is to use a magnet on three different monoliths in the cave system here. After the magnet evaporates on the last charge, enter the magnetic extractor here to deliver your charge. ...",
								"If you are interested, I can give you some more information about it. Are you willing to accept this mission?"
								}, cid)
			npcHandler.topic[cid] = 1					
		elseif npcHandler.topic[cid] == 10 and player:getStorageValue(6874112) == 2 then
			npcHandler:say("Oh good, you have finished the {charges} task. Here are your reward and your one point of famous!", cid)
			player:addExperience(2000, true)
			player:setStorageValue(6874112, -1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Points, player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Points) + 1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Charges, 0)
			npcHandler.topic[cid] = 0	
		else
			npcHandler:say("You don\'t have finished the task what i desired to you! Go and finish it.", cid)
			npcHandler.topic[cid] = 0	
		end
	elseif msgcontains(msg, 'fertilise') then
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Fertilse) < 1 then
			npcHandler:say("Your mission would be to seek out gardener mushrooms in the caves and use some fertiliser on them. If you are interested, I can give you some more information about it. Are you willing to accept this mission?", cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 10 and player:getStorageValue(6874113) == 3 then
			npcHandler:say("Oh good, you have finished the {fertilise} task. Here are your reward and your one point of famous!", cid)
			player:addExperience(2000, true)
			player:setStorageValue(6874113, -1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Points, player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Points) + 1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Fertilise, 0)
			npcHandler.topic[cid] = 0	
		else
			npcHandler:say("You don\'t have finished the task what i desired to you! Go and finish it.", cid)
			npcHandler.topic[cid] = 0	
		end
	elseif msgcontains(msg, 'nests') then
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Nests) < 1 then
			npcHandler:say("Our mission for you is to step into the gnomish transformer and then destroy eight monster nests in the caves. If you are interested, I can give you some more information about it. Are you willing to accept this mission?", cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 10 and player:getStorageValue(6874114) == 4 then
			npcHandler:say("Oh good, you have finished the {nests} task. Here are your reward and your one point of famous!", cid)
			player:addExperience(2000, true)
			player:setStorageValue(6874114, -1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Points, player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Points) + 1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Nests, 0)
			npcHandler.topic[cid] = 0	
		else
			npcHandler:say("You don\'t have finished the task what i desired to you! Go and finish it.", cid)
			npcHandler.topic[cid] = 0	
		end
		
	elseif msgcontains(msg, 'kill') then
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Kill) < 1 then
			npcHandler:say("This mission will require you to kill some crystal crushers for us. If you are interested, I can give you some more information about it. Are you willing to accept this mission?", cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 10 and player:getStorageValue(6874115) == 6 then
			npcHandler:say("Oh good, you have finished the {kill} task. Here are your reward and your one point of famous!", cid)
			player:addExperience(2000, true)
			player:setStorageValue(6874115, -1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Points, player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Points) + 1)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Kill, 0)
			npcHandler.topic[cid] = 0	
		else
			npcHandler:say("You don\'t have finished the task what i desired to you! Go and finish it.", cid)
			npcHandler.topic[cid] = 0	
		end
		
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({"Gnometastic! Charge this magnet at three monoliths in the cave system. With three charges, the magnet will disintegrate and charge you with its gathered energies. Step on the magnetic extractor here to deliver the charge to us, then report to me. ...",
							"If you lose the magnet you'll have to bring your own. Gnomux sells all the equipment that is required for our missions."
							}, cid)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Charges, 1)
			player:addItem(21557, 1)
			npcHandler.topic[cid] = 0			
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say("Gnometastic! And here is your fertiliser - use it on four gardener mushroom in the caves. If you lose the fertiliser you'll have to bring your own. Gnomux sells all the equipment that is required for our missions", cid)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Fertilise, 1)
			player:addItem(21564, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say("Gnometastic! Don't forget to step into the transformer before you go out and destroy five monster nests. If your transformation runs out, return to the transformer to get another illusion.", cid)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Nests, 1)	
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			npcHandler:say("Gnometastic! You should have no trouble to find enough crystal crushers. Killing seven of them should be enough.", cid)
			player:setStorageValue(Storage.SpikeTaskQuest.Gnombold.Kill, 1)	
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