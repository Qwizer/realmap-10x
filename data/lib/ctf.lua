--[[
File: ctf.lua (lib)
 
dofile('data/lib/ctf.lua')
]]
 
local function newOutfitCondition(outfit)
    local condition = Condition(CONDITION_OUTFIT)
    condition:setTicks(120 * 60 * 1000) -- estava: condition:setTicks(-1)
    condition:setOutfit(outfit)
    return condition
end
 
CTF_STATE_NONE  = 0
CTF_STATE_WAIT  = 1
CTF_STATE_FIGHT = 2
 
CTF_TEAM_A = 1
CTF_TEAM_B = 2
 
if not captureTheFlag then
    Flag = {
        -- (Modify) effect period (in ms)
        effectPeriod = 3000,
 
        new = function(self, obj)
            return setmetatable(obj, {__index = self})
        end
    }
 
    captureTheFlag = {
        -- Whether the event is happening right now
        open = false,
 
        -- (Modify) How many points to win
        goal = 10,
 
        -- (Modify) Rewards: {itemid, count}
        rewards = {
            {27058, 1},
        },
 
        -- [name] = {name = 'playerName', state = CTF_STATE_, team = CTF_TEAM_, flag = Frag|nil}
        players = { },
 
        -- (Modify) Waiting Room position
        waitingRoom = Position(33146, 32175, 9),
		
		-- Death Room position -- MUDEI AQUI, PROBLEM?
        deathRoom = Position(33258, 32120, 6), 
 
        -- (Modify) Exit position,
        exit = Position(32369, 32241, 7),
 
        teams = {
            [CTF_TEAM_A] = {
                -- (Modify) Team A Outfit
                outfit = newOutfitCondition {
                    lookType = 143,
 					lookHead = 114,
 					lookBody = 94,
 					lookLegs = 94,
 					lookFeet = 114
                },
				
				
                -- (Modify) Team A Outfit
                outfitFlag = newOutfitCondition {
                    lookType = 143,
 					lookHead = 132,
 					lookBody = 132,
 					lookLegs = 132,
 					lookFeet = 132
                },
 
                -- (Modify) Base position (entrance)
                base = Position(33177, 32120, 5),
                -- (Modify) Flag, change position and actionid
                flag = Flag:new {position = Position(33177, 32117, 5), id = 8617, actionid = 15150, team = CTF_TEAM_A},
                -- How many players are in this team
                players = 0,
                -- How many points the team has scored so far
                score = 0
            },
 
            [CTF_TEAM_B] = {
                -- (Modify) Team B Outfit
                outfit = newOutfitCondition {
                    lookType = 134,
 					lookHead = 114,
 					lookBody = 86,
 					lookLegs = 86,
 					lookFeet = 114
                },
 
				-- (Modify) Team B Outfit
                outfitFlag = newOutfitCondition {
                    lookType = 134,
 					lookHead = 126,
 					lookBody = 126,
 					lookLegs = 126,
 					lookFeet = 126
                },
				
                -- (Modify) Base position (entrance)
                base = Position(33261, 32189, 5),
                -- (Modify) Flag, change position and actionid
                flag = Flag:new {position = Position(33264, 32189, 5), id = 8622, actionid = 15151, team = CTF_TEAM_B},
                -- How many players are in this team
                players = 0,
                -- How many points the team has scored so far
                score = 0
            },
        }
    }
 
    function Flag:setHolder(player)
        self.holder = player and player:getName()
        if not self.event then
            self:doEffect()
        end
    end
 
    function Flag:remove()
        if not self.holder then
            local flag = Tile(self:getPosition()):getItemById(self.id)
            flag:remove()          
        end
 
        if self.event then
            stopEvent(self.event)
            self.event = nil
        end
 
        self.currentPosition = nil
        self.holder = nil
    end
 
    function Flag:getPosition()
        return self.currentPosition or self.position
    end
 
    function Flag:doEffect()
        local position = self:getPosition()
        local holder = Player(self.holder)
        if holder then
			holder:addCondition(captureTheFlag.teams[captureTheFlag.players[holder:getName()].team].outfitFlag)
            position = holder:getPosition()
        end
        position:sendMagicEffect(CONST_ME_TUTORIALARROW)
 
        self.event = addEvent(self.doEffect, self.effectPeriod, self)
    end
 
    function Flag:drop(position)
        local flag = Game.createItem(self.id, 1, position)
        flag:setActionId(self.actionid)
        self.currentPosition = position
        self.holder = nil
 
        if not self.event then
            self:doEffect()
        end
    end
 
    captureTheFlag.start = function()
        if captureTheFlag.open then
            return false
        end
 
        captureTheFlag.open = true
 
        for _, team in ipairs(captureTheFlag.teams) do
            team.score = 0
            team.flag:drop(team.flag.position)
        end
    end
 
    captureTheFlag.close = function()
        if not captureTheFlag.open then
            return true
        end    
 
        for _, info in pairs(captureTheFlag.players) do
            local player = Player(info.name)
            captureTheFlag.onLeave(player)
        end
 
        for _, team in ipairs(captureTheFlag.teams) do
            team.flag:remove()
            team.players = 0
            team.score = 0
        end
 
        captureTheFlag.open = false
    end
 
    captureTheFlag.round = function(team)
        if not captureTheFlag.open then
            return true
        end
 
        local winner
        for _, team in ipairs(captureTheFlag.teams) do
            team.flag:remove()
            team.flag:drop(team.flag.position)
            if team.score == captureTheFlag.goal then
                winner = _
            end
        end
 
        if not winner then
            local status = 'Team A: ' .. captureTheFlag.teams[CTF_TEAM_A].score .. ' x Team B: ' .. captureTheFlag.teams[CTF_TEAM_B].score
            if team then
                status = string.format('Team %s has returned the flag and won the round. %s', team == CTF_TEAM_A and 'A' or 'B', status)
            end
            for _, info in pairs(captureTheFlag.players) do
                local player = Player(info.name)
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, status)
                player:teleportTo(captureTheFlag.teams[info.team].base)
				player:addCondition(captureTheFlag.teams[info.team].outfit)
                info.state = CTF_STATE_FIGHT
            end
        else
            local status = 'Team ' .. (winner == CTF_TEAM_A and 'A' or 'B') .. ' has won!'
            for _, info in pairs(captureTheFlag.players) do
                local player = Player(info.name)
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, status)
                if info.team == winner then
                    for i, reward in ipairs(captureTheFlag.rewards) do
                        player:addItem(reward[1], reward[2])
                    end
                end
            end
 
            captureTheFlag.close()
        end
    end
 
    captureTheFlag.getPlayerState = function(player)
        local info = captureTheFlag.players[player:getName()]
        return info and info.state or CTF_STATE_NONE
    end
 
    captureTheFlag.setPlayerState = function(player, state)
        local info = captureTheFlag.players[player:getName()]
        if info then
            info.state = state
        end
    end
 
    captureTheFlag.onJoin = function(player)
        local info = {name = player:getName(), state = CTF_STATE_WAIT, flag = false}
        local playersA, playersB = captureTheFlag.teams[CTF_TEAM_A].players, captureTheFlag.teams[CTF_TEAM_B].players
        if playersA == playersB then
            info.team = math.random(CTF_TEAM_A, CTF_TEAM_B)
        elseif playersA > playersB then
            info.team = CTF_TEAM_B
        else
            info.team = CTF_TEAM_A
        end
 
        captureTheFlag.players[info.name] = info
        captureTheFlag.teams[info.team].players = captureTheFlag.teams[info.team].players + 1
 
        player:teleportTo(captureTheFlag.waitingRoom)
        player:addCondition(captureTheFlag.teams[info.team].outfit)
        player:registerEvent('CTFHealthChange')
        player:registerEvent('CTFDeath')
    end
 
    captureTheFlag.onDeath = function(player)
        local info = captureTheFlag.players[player:getName()]
        if info then
		
			-- info.state = CTF_STATE_WAIT   MUDEI AQUI, PROBLEM?
            info.state = CTF_STATE_FIGHT
 
            if info.flag then
                info.flag:drop(info.flag.position)
                info.flag = nil
            end
        end
		
		--player:teleportTo(captureTheFlag.waitingRoom)  MUDEI AQUI, PROBLEM?
        player:teleportTo(captureTheFlag.deathRoom) 
		player:addCondition(captureTheFlag.teams[info.team].outfit)
		-- testar
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You was killed.")
		--teste
        player:addHealth(player:getMaxHealth())
        player:addMana(player:getMaxMana())
 
        if player:getIp() == 0 then
            captureTheFlag.onLeave(player)
        end
    end
 
    captureTheFlag.onLeave = function(player)
        local info = captureTheFlag.players[player:getName()]
        if info then
            captureTheFlag.teams[info.team].players = captureTheFlag.teams[info.team].players - 1
            captureTheFlag.players[info.name] = nil
 
            if info.flag then
                info.flag:drop(info.flag.position)
                info.flag = nil
            end
        end
 
        player:teleportTo(captureTheFlag.exit)
		player:removeCondition(CONDITION_OUTFIT)
        player:unregisterEvent('CTFHealthChange')
        player:unregisterEvent('CTFDeath')
    end
 
    captureTheFlag.getFlag = function(item)
        for _, team in ipairs(captureTheFlag.teams) do
            if team.flag.id == item:getId() and team.flag.actionid == item:getActionId() then
                return team.flag
            end
        end
        return nil
    end
end