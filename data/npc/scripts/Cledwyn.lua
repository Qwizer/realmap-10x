 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {25172, 13030}, -- item1 item que será pedido e que será dado na primeira troca
          item2 = {25172, 25177}, -- item2 item que será pedido e que será dado na segunda troca
		  item3 = {25172, 25179}, -- item3 item que será pedido e que será dado na segunda troca
		  item4 = {25172, 25191}, -- k		  
		  item5 = {25172, 25187}, -- k
		  item6 = {25172, 25174}, -- k
		  item7 = {25172, 25175}, -- k
		  item8 = {25172, 25176}, -- k
		  item9 = {25172, 25190}, -- k
		  
		  item10 = {25172, 25186}, -- k
		  item11 = {25172, 25183}, -- k
		  item12 = {25172, 25184}, -- k
		  item13 = {25172, 25185}, -- k
		  item14 = {25172, 25189} -- k
		 
}
local counts = {
          count1 = {100, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
          count2 = {100, 1}, -- count2 quantidade que será pedido e que será dado na segunda troca
		  count3 = {100, 1}, -- count3 quantidade que será pedido e que será dado na segunda troca
		  count4 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca		  
		  count5 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count6 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count7 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count8 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count9 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca		  
		  count10 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count11 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count12 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count13 = {100, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count14 = {100, 1} -- count4 quantidade que será pedido e que será dado na segunda troca
		 
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if  msgcontains(msg, 'earthheart cuirass') then
                    if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item2[2], counts.count2[2])
                              selfSay('You just swap '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..' for '.. counts.count2[2] ..' '.. getItemName(items.item2[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthheart platemail') then
                    if getPlayerItemCount(cid, items.item3[1]) >= counts.count3[1] then
                              doPlayerRemoveItem(cid, items.item3[1], counts.count3[1])
                              doPlayerAddItem(cid, items.item3[2], counts.count3[2])
                              selfSay('You just swap '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..' for '.. counts.count3[2] ..' '.. getItemName(items.item3[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthmind raiment') then
                    if getPlayerItemCount(cid, items.item4[1]) >= counts.count4[1] then
                              doPlayerRemoveItem(cid, items.item4[1], counts.count4[1])
                              doPlayerAddItem(cid, items.item4[2], counts.count4[2])
                              selfSay('You just swap '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..' for '.. counts.count4[2] ..' '.. getItemName(items.item4[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthsoul tabard') then
                    if getPlayerItemCount(cid, items.item5[1]) >= counts.count5[1] then
                              doPlayerRemoveItem(cid, items.item5[1], counts.count5[1])
                              doPlayerAddItem(cid, items.item5[2], counts.count5[2])
                              selfSay('You just swap '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..' for '.. counts.count5[2] ..' '.. getItemName(items.item5[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'fireheart cuirass') then
                    if getPlayerItemCount(cid, items.item6[1]) >= counts.count6[1] then
                              doPlayerRemoveItem(cid, items.item6[1], counts.count6[1])
                              doPlayerAddItem(cid, items.item6[2], counts.count6[2])
                              selfSay('You just swap '.. counts.count6[1] ..' '.. getItemName(items.item6[1]) ..' for '.. counts.count6[2] ..' '.. getItemName(items.item6[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count6[1] ..' '.. getItemName(items.item6[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'fireheart hauberk') then
                    if getPlayerItemCount(cid, items.item7[1]) >= counts.count7[1] then
                              doPlayerRemoveItem(cid, items.item7[1], counts.count7[1])
                              doPlayerAddItem(cid, items.item7[2], counts.count7[2])
                              selfSay('You just swap '.. counts.count7[1] ..' '.. getItemName(items.item7[1]) ..' for '.. counts.count7[2] ..' '.. getItemName(items.item7[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count7[1] ..' '.. getItemName(items.item7[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'fireheart platemail') then
                    if getPlayerItemCount(cid, items.item8[1]) >= counts.count8[1] then
                              doPlayerRemoveItem(cid, items.item8[1], counts.count8[1])
                              doPlayerAddItem(cid, items.item8[2], counts.count8[2])
                              selfSay('You just swap '.. counts.count8[1] ..' '.. getItemName(items.item8[1]) ..' for '.. counts.count8[2] ..' '.. getItemName(items.item8[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count8[1] ..' '.. getItemName(items.item8[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'firemind raiment') then
                    if getPlayerItemCount(cid, items.item9[1]) >= counts.count9[1] then
                              doPlayerRemoveItem(cid, items.item9[1], counts.count9[1])
                              doPlayerAddItem(cid, items.item9[2], counts.count9[2])
                              selfSay('You just swap '.. counts.count9[1] ..' '.. getItemName(items.item9[1]) ..' for '.. counts.count9[2] ..' '.. getItemName(items.item9[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count9[1] ..' '.. getItemName(items.item9[1]) ..'.', cid)
                    end
					
					-- Dolls 
					elseif msgcontains(msg, 'firesoul tabard') then
                    if getPlayerItemCount(cid, items.item10[1]) >= counts.count10[1] then
                              doPlayerRemoveItem(cid, items.item10[1], counts.count10[1])
                              doPlayerAddItem(cid, items.item10[2], counts.count10[2])
                              selfSay('You just swap '.. counts.count10[1] ..' '.. getItemName(items.item10[1]) ..' for '.. counts.count10[2] ..' '.. getItemName(items.item10[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count10[1] ..' '.. getItemName(items.item10[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostheart cuirass') then
                    if getPlayerItemCount(cid, items.item11[1]) >= counts.count11[1] then
                              doPlayerRemoveItem(cid, items.item11[1], counts.count11[1])
                              doPlayerAddItem(cid, items.item11[2], counts.count11[2])
                              selfSay('You just swap '.. counts.count11[1] ..' '.. getItemName(items.item11[1]) ..' for '.. counts.count11[2] ..' '.. getItemName(items.item11[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count11[1] ..' '.. getItemName(items.item11[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostheart hauberk') then
                    if getPlayerItemCount(cid, items.item12[1]) >= counts.count12[1] then
                              doPlayerRemoveItem(cid, items.item12[1], counts.count12[1])
                              doPlayerAddItem(cid, items.item12[2], counts.count12[2])
                              selfSay('You just swap '.. counts.count12[1] ..' '.. getItemName(items.item12[1]) ..' for '.. counts.count12[2] ..' '.. getItemName(items.item12[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count12[1] ..' '.. getItemName(items.item12[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostheart platemail') then
                    if getPlayerItemCount(cid, items.item13[1]) >= counts.count13[1] then
                              doPlayerRemoveItem(cid, items.item13[1], counts.count13[1])
                              doPlayerAddItem(cid, items.item13[2], counts.count13[2])
                              selfSay('You just swap '.. counts.count13[1] ..' '.. getItemName(items.item13[1]) ..' for '.. counts.count13[2] ..' '.. getItemName(items.item13[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count13[1] ..' '.. getItemName(items.item13[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostsoul tabard') then
                    if getPlayerItemCount(cid, items.item14[1]) >= counts.count14[1] then
                              doPlayerRemoveItem(cid, items.item14[1], counts.count14[1])
                              doPlayerAddItem(cid, items.item14[2], counts.count14[2])
                              selfSay('You just swap '.. counts.count14[1] ..' '.. getItemName(items.item14[1]) ..' for '.. counts.count14[2] ..' '.. getItemName(items.item14[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count14[1] ..' '.. getItemName(items.item14[1]) ..'.', cid)
                    end
					
					
					
          end
		  
          return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())