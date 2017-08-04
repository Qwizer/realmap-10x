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
	npcHandler:say("Do you have something to deliver?", cid)
	
	if msgcontains(msg, 'yes') then
		if player:removeItem(21569, 4) then
			npcHandler:say("Oh, thanks for these supplies.", cid)
			player:setStorageValue(6874116, 1)
		else
			npcHandler:say("You don\'t have nothing with in to delivery to me!", cid)
		end
	end

	return true
end

npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)