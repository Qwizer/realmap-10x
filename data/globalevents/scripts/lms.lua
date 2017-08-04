local centeroffight = {x = 32323, y = 32022, z = 12}
local waitingplace = {x = 32300, y = 32026, z = 12}
local depotcenter = {x = 32369, y = 32241, z = 7}
local MinimumPlayers = 20
local rewardpoints = 2
local area_increase = 10 -- SE NAO FUNFAR, TESTAR SEM ISSO



local function lmsclosed1()
    broadcastMessage("LMS event will start in 5 minutes. Portal is opened in north of depot Thais. The reward is 2 PREMIUM POINTS, Hurry!!", MESSAGE_EVENT_ADVANCe)
end


local function lmsclosed()

count = 0
        local spectators = getSpectators(waitingplace, area_increase, area_increase, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then   
                         count = count + 1
                      
                        end
                end
        end
       
              
if (count >= MinimumPlayers) then

broadcastMessage("Last Man Standing event portal closed and event started!", MESSAGE_EVENT_ADVANCE)

for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
doTeleportThing(playerids,centeroffight)
doSendMagicEffect(center, CONST_ME_TELEPORT)
    end
      
end

else

broadcastMessage("Not enough players to start Last man Standing event! Minimum: "..MinimumPlayers.." players.", MESSAGE_EVENT_ADVANCE)
setGlobalStorageValue(25002, 0)

for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
doTeleportThing(playerids,depotcenter)
doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
setPlayerStorageValue(pid, 25001, 0)

    end
end

end


return true
end



local function lmscheck()


count = 0
        local spectators = getSpectators(centeroffight, area_increase, area_increase, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then   
                         count = count + 1
                      
                        end
                end
        end

if count == 1 then


for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
setPlayerStorageValue(playerids, 25001, 0)
    end
end

        local spectators = getSpectators(centeroffight, area_increase, area_increase, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then 

           
           
doTeleportThing(spectator,depotcenter)
doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
broadcastMessage("LMS ended winner is: "..getPlayerName(spectator)..", reward is 2 premium points.", MESSAGE_EVENT_ADVANCE)
  
local accid = Player(spectator):getAccountId()
local points = rewardpoints
db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. accid)
                     end
                end
        end
       


for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
setPlayerStorageValue(pid, 25001, 0)
end
end

stopEvent(lmscheck)

else
addEvent(lmscheck, 10*1000)
end
end



local function lms()
    broadcastMessage("LMS event will start in 9 minutes. Portal is opened in Event Room [Temple of Thais]. The reward is 2 PREMIUM POINTS, Hurry!!", MESSAGE_EVENT_ADVANCE)

    portalwhere = {x = 32476, y = 32471, z = 6}
    local portal = doCreateItem(11796,1,portalwhere)
  doSetItemActionId(portal, 25001)
  doSendMagicEffect(portalwhere, CONST_ME_TELEPORT)


 
addEvent(function() doRemoveItem(getTileItemById(portalwhere, 11796).uid) end, 600 * 1000)
addEvent(function() doSendMagicEffect(portalwhere, CONST_ME_TELEPORT) end, 600 * 1000)

addEvent(lmsclosed, 10*60*1000)
addEvent(lmsclosed1, 5*60*1000)
addEvent(lmscheck, 130*1000)

return true
end



function onTime()

    broadcastMessage("Last Man Standing event will start in 10 minutes.", MESSAGE_EVENT_ADVANCE)
    addEvent(lms, 60*1000)



for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
--doTeleportThing(playerids,depotcenter)
--doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
setPlayerStorageValue(pid, 25001, 0)

    end
end


return true
end