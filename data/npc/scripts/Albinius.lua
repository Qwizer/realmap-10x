local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item1 = {12437, 50731}, -- item1 e storage dado
          item2 = {19742, 50732}, -- item1 e storage dado
          item3 = {11213, 50733}, -- item1 e storage dado
          item4 = {2667, 50735}, -- item1 e storage dado
          item5 = {21246, 50736}, -- item1 e storage dado
		  item6 = {26654} -- item1 e storage dado
		 
}

local counts = {
          count1 = {50, 1},
          count6 = {5, 1}		  
}

local voices = {
	{ text = 'Walk in the light of Shaper wisdom!'},
	{ text = 'Welcome, my child.' },
	{ text = 'Our ways are the ways of the Shapers.' }
}

npcHandler:addModule(VoiceModule:new(voices))



local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

       if msgcontains(msg, "shaper") then
				npcHandler:say({
				"The {Shapers} were an advanced civilisation, well versed in art, construction, language and exploration of our world in their time. ...",
				"The foundations of this temple are testament to their genius and advanced understanding of complex problems. They were master craftsmen and excelled in magic."
			}, cid)
			end

if msgcontains(msg, "tomes") then
	  npcHandler:say("I you have some old shaper tomes I would {buy} them.", cid)
end


	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		local player = Player(cid)

		
	    if msgcontains(msg, 'death portal') then
		if player:getStorageValue(50730) == 1 then
		if player:getStorageValue(items.item1[2]) <= 0 and getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              selfSay('Excellente! Now you can pass in the teleport.', cid)
							 player:setStorageValue(items.item1[2], counts.count1[2])
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemName(items.item1[1]) ..'.', cid)
        end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end
		
					elseif msgcontains(msg, 'energy portal') then
					if player:getStorageValue(50730) == 1 then
		  if player:getStorageValue(items.item2[2]) <= 0 and getPlayerItemCount(cid, items.item2[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count1[1])
                              selfSay('Excellente! Now you can pass in the teleport.', cid)
							 player:setStorageValue(items.item2[2], counts.count1[2])
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemName(items.item2[1]) ..'.', cid)
                    end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end
		elseif msgcontains(msg, 'temple') then
		  if player:getStorageValue(50730) <= 0 and  player:getItemCount(26654) > 4 then
							  doPlayerRemoveItem(cid, 26654, 5)
                              selfSay('Excellente! Now you can use the imbuing shrines.', cid)
							 player:setStorageValue(50730, 1)
          else
                              selfSay('You need 5 Heavy Old Tomes', cid)
          end

		elseif msgcontains(msg, 'earth portal') then
					if player:getStorageValue(50730) == 1 then
		  if player:getStorageValue(items.item3[2]) <= 0 and getPlayerItemCount(cid, items.item3[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item3[1], counts.count1[1])
                              selfSay('Excellente! Now you can pass in the teleport.', cid)
							 player:setStorageValue(items.item3[2], counts.count1[2])
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemName(items.item3[1]) ..'.', cid)
                    end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end
					elseif msgcontains(msg, 'ice portal') then
		if player:getStorageValue(50730) == 1 then
		  if player:getStorageValue(items.item4[2]) <= 0 and getPlayerItemCount(cid, items.item4[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item4[1], counts.count1[1])
                              selfSay('Excellente! Now you can pass in the teleport.', cid)
							 player:setStorageValue(items.item4[2], counts.count1[2])
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemName(items.item4[1]) ..'.', cid)
                    end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end
					elseif msgcontains(msg, 'holy portal') then
					if player:getStorageValue(50730) == 1 then
		  if player:getStorageValue(items.item5[2]) <= 0 and getPlayerItemCount(cid, items.item5[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item5[1], counts.count1[1])
                              selfSay('Excellente! Now you can pass in the teleport.', cid)
							 player:setStorageValue(items.item5[2], counts.count1[2])
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemName(items.item5[1]) ..'.', cid)
                    end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end			
					
end
          return TRUE
end  


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I find ways to unveil the secrets of the stars. Judging by this question, I doubt you follow my weekly publications concerning this research."})
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Greetings, pilgrim. Welcome to the halls of hope. We are the keepers of this {temple} and welcome everyone willing to contribute.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, my child")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, my child")
npcHandler:addModule(FocusModule:new())