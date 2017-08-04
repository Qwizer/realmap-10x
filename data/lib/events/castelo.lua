CASTELO_STOR = 37894
EVENTO_CASTELO_STOR = CASTELO_STOR + 1
castleOwner = 0
CENTRE_POS = {x = 31884, y = 32299, z = 7} --pos

EVENT_CLOSED = 0
EVENT_WAIT = 1 
EVENT_STARTED = 2

DAY = "Friday" --day 
TIME_EVENT = 60 --mins

MONSTER_NAME = "King Castle"
TIME_TO_REVIVE_MONSTER = 1 --mins
POS_MONSTER_CREATE = {x = 31905, y = 32293, z = 4} --pos

guildsOnEvent = 
{

}

local function getIndex(arr, val)
	local ret = -1
	for i = 1, #arr do 
		if (arr[i] == val) then
			ret = i
			break
		end
	end

	return ret
end

--to enter to event
function Player:registerToCastle()
	if (not self:isCreature()) then return false end
	local guild = self:getGuild()

	if (guild) then
		if (self:isCastleEventMember()) then 
			return true
		end
		local guildId = guild:getId()
		if not guildsOnEvent[guildId] then
			guildsOnEvent[guildId] = {}
		end
		table.insert(guildsOnEvent[guildId], self:getId())
	end
end

function Player:kickFromCastle()
	if (not self:isCreature()) then return false end
	local guild = self:getGuild()

	if (guild) then
		if (not self:isCastleEventMember()) then 
			return true
		end
		local guildId = guild:getId()
		if (isInArray(guildsOnEvent[guildId], self:getId())) then 
			local mIndex = getIndex(guildsOnEvent[guildId], self:getId())
			table.remove(guildsOnEvent[guildId], mIndex)
		end
	end
end

function cleanGuildsFromCastle()
	guildsOnEvent = {}
end

-- to check who is castle owner
function getGuildCastleOwner()
	return castleOwner
end

function setGuildCastleOwner(guild)
	-- body
	if (not guild) then return false end
	setGlobalStorageValueDB(CASTELO_STOR, guild:getId())
	Game.broadcastMessage(string.format("A guild %s conquistou o castelo!", guild:getName()))
	castleOwner = guild:getId()
end

function Player:isGuildCastleOwnerMember()
	if (not self:isCreature()) then return false end

	if (self:getGuild() and self:getGuild():getId() == getGuildCastleOwner()) then
		return true
	end
	return false
end

--players 

function Player:isCastleEventMember()
	if (not self) then return false end

	local guild = self:getGuild()

	if (guild) then
		local guildId = guild:getId() 
		if (guildsOnevent[guildId] and isInArray(guildsOnevent[guildId], self:getId())) then 
			return true 
		end
	end

	return false
end
function getCastleOwners()
	local owners = {}

	if (castleOwner > 0 ) then
		owners = guildsOnevent[castleOwner]
	end
	return owners
end

function getCastleEventMembers()
	local members = {}

	for i,x in pairs(guildsOnEvent) do 
		for j,p in pairs(x) do 
			if (p and not p:isGuildCastleOwnerMember()) then
				table.insert(members, p) 
			end
		end
	end

	return members 
end

function teleportCastleEventMembers(owners, members)
	--owners, members 
	if (owners) then

		for i, x in pairs (getCastleOwners()) do
			x:teleportTo(CENTRE_POS) 
		end
	end

	if (members) then
		for i, x in pairs (getCastleEventMembers()) do
			if (x:isCreature()) then
				x:teleportTo(x:getTown():getTemplePosition())
			end
		end
	end
end

-- control event 
function startCastleEvent()
	Game.setStorageValue(EVENTO_CASTELO_STOR, EVENT_STARTED)
	createCastleEventMonster(false)
	addEvent(closeCastleEvent, TIME_EVENT * 60 * 1000)
end

function getCastleEventStatus()
	local st = Game.getStorageValue(EVENTO_CASTELO_STOR)
	local ret 
	if (st <= 0) then
		ret = EVENT_CLOSED
	elseif (st == 1) then
		ret = EVENT_WAIT
	elseif (st == 2) then 
		ret = EVENT_STARTED
	end

	return ret
end

function closeCastleEvent()
	cleanGuildsFromCastle()
	Game.setStorageValue(EVENTO_CASTELO_STOR, EVENT_CLOSED)
end

function createCastleEventMonster(teleportPlayers)
	if (getCastleEventStatus() ~= EVENT_STARTED) then
		teleportCastleEventMembers(true, true)
		return false 
	end
	if (teleportPlayers) then 
		teleportCastleEventMembers(true, true)
		Game.broadcastMessage(string.format("Monster will respawn in %d minutes", TIME_TO_REVIVE_MONSTER))
		addEvent(Game.createMonster, TIME_TO_REVIVE_MONSTER * 60 * 1000, MONSTER_NAME, POS_MONSTER_CREATE)
	else
		Game.createMonster(MONSTER_NAME, POS_MONSTER_CREATE)
	end
end

--[[
--creatureevent 
dofile("data/lib/events/castelo.lua")
function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	if (lasthitkiller:isPlayer()) then
		local guild = lasthitkiller:getGuild()
		if (guild) then 
			setGuildCastleOwner(guild)
		else
			Game.broadcastMessage(string.format("%s matou o king mais ele n e membro do uma guild.", lasthitkiller:getName()))
		end
		--time left??
		createCastleEventMonster(true)
	end
	return true 
end


--movement (--pending: enter during event execution (30 mins))
dofile("data/lib/events/castelo.lua")
function onStepIn(creature, item, pos, fromPosition)
	if (creature:isPlayer()) then
		if (getCastleEventStatus() <= EVENT_CLOSED) then
			if (castleOwner > 0) then 
				local guild = creature:getGuild()
				if (guild) then
					if (guild:getId() ~= castleOwner) then
						creature:teleportTo(fromPosition)
					end 
				else
					creature:teleportTo(fromPosition)
				end
			else
				creature:teleportTo(fromPosition)
			end
		end
	end
	return true 
end


--globalevent 
dofile("data/lib/events/castelo.lua")
function onTime()

	local day = os.date("%A")
	if (day == DAY) then
		startCastleEvent()
	end
	return true
end

dofile("data/lib/events/castelo.lua")
function onStartup()
	castleOwner = getGlobalStorageValueDB(CASTELO_STOR)
	return true 
end


	getEventTimeLeft
	-- get all info required from players
	--onStartup: set guildOwner value
]]--