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

	if msgcontains(msg, 'worthy') then
		npcHandler:say("You can acquire the basic outfit for 1000 Gold, the {first} addon for 2000 gold and the {second} addon for 3000 gold. Which do you want to buy?", cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'first') then
		npcHandler:say("Do you want to buy the first addon for 2000 Gold and 100 Gnombold task points?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'second') then
		npcHandler:say("Do you want to buy the second addon for 3000 Gold and 100 Gnomargery task points?", cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Points) == 100 and player:removeMoney(2000) then
				player:addOutfitAddon(575, 1)
				player:addOutfitAddon(574, 1)
				npcHandler:say("Here are your first cave explorer addon!", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Sorry you don\'t have the necessary task points or money!", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points) == 100 and player:removeMoney(2000) then
				player:addOutfitAddon(575, 2)
				player:addOutfitAddon(574, 2)
				player:removeMoney(3000)
				npcHandler:say("Here are your second cave explorer addon!", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Sorry you don\'t have the necessary task points or money!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	
	return true
end

npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)