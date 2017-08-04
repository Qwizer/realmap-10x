if not Battlefield then
	Battlefield = {
		open = false,

		wall = {
			id = 1049,

			top = Position(31424, 32550, 6),
			bottom = Position(31424, 32557, 6)
		},

		rewards = {
			-- {itemid, quantity}
			{21399, 1},
		},

		minLevel = 150,

		exit = Position(32369, 32237, 7),

		teams = {
			[1] = {
				name = 'Purple',

				outfit = {
					lookType = 138,
					lookAddons = 0,
					lookHead = 109,
					lookLegs = 109,
					lookBody = 109,
					lookFeet = 109,
				},

				position = Position(31393, 32554, 8),

				players = {}, 
				kills = 0,
				size = 0,
			},

			[2] = {
				name = 'Green',

				outfit = {
					lookType = 138,
					lookAddons = 0,
					lookHead = 82,
					lookLegs = 82,
					lookBody = 82,
					lookFeet = 82,
				},

				position = Position(31437, 32554, 8),

				players = {}, 
				kills = 0,
				size = 0,
			},				
		}
	}

	function Battlefield:Open()
		if self.open then return false end
		for y = self.wall.top.y, self.wall.bottom.y do
			local tile = Tile({x = self.wall.top.x, y = y, z = self.wall.top.z})
			if tile then
				local wall = tile:getItemById(self.wall.id)
				if wall then
					wall:remove()
				end
			end
		end 
		self.open = true
		return true
	end

	function Battlefield:Close(winner)
		if not self.open then return false end
		self.open = false
		for y = self.wall.top.y, self.wall.bottom.y do
			Game.createItem(self.wall.id, 1, Position(self.wall.top.x, y, self.wall.top.z))
		end

		if not winner then
			if self.teams[1].kills > self.teams[2].kills then
				winner = 1
			elseif self.teams[1].kills < self.teams[2].kills then
				winner = 2
			end
		end

		if winner then
			Game.broadcastMessage(string.format("Team %s win the BattleField Event!", self.teams[winner].name))
		else
			Game.broadcastMessage("There was a tie and nobody wins reward.")
		end

		for _, team in ipairs(self.teams) do
			for name, info in pairs(team.players) do
				local player = Player(name)
				if player then
					self:onLeave(player)
					if _ == winner then
						for k, item in ipairs(self.rewards) do
							player:addItem(item[1], item[2])
						end
					end
				end
			end
		end
		self.teams[1].players = {}
		self.teams[1].size = 0
		self.teams[1].kills = 0
		self.teams[2].players = {}
		self.teams[2].size = 0
		self.teams[2].kills = 0	
		return true
	end

	function Battlefield:findPlayer(player)
		local name = player:getName()
		return self.teams[1].players[name] or self.teams[2].players[name]
	end

	function Battlefield:onJoin(player)
		if player:getLevel() < self.minLevel then
			return false
		end

		local team
		if self.teams[1].size == self.teams[2].size then
			team = math.random(1, 2)
		elseif self.teams[1].size > self.teams[2].size then
			team = 2
		else
			team = 1
		end

		player:setOutfit(self.teams[team].outfit)
		player:teleportTo(self.teams[team].position)

		local info = {name = player:getName(), team = team}
		self.teams[team].size = self.teams[team].size + 1
		self.teams[team].players[player:getName()] = info

		Game.broadcastMessage(string.format("%s entered the BattleField Event!", info.name))

		player:registerEvent("BFPrepareDeath")
		player:registerEvent("BFHealthChange")
		player:registerEvent("BFManaChange")
		player:registerEvent("BFLogout")

		return true
	end

	function Battlefield:onLeave(player)
		local info = self:findPlayer(player)
		if not info then return false end
		player:unregisterEvent("BFHealthChange")
		player:unregisterEvent("BFPrepareDeath")
		player:unregisterEvent("BFManaChange")
		player:unregisterEvent("BFLogout")

		Game.broadcastMessage(string.format("%s left the BattleField Event!", info.name))

		player:teleportTo(self.exit)
		self.teams[info.team].size = self.teams[info.team].size - 1
		self.teams[info.team].players[info.name] = nil

		player:addHealth(player:getMaxHealth())
		player:addMana(player:getMaxMana())
		player:removeCondition(CONDITION_INFIGHT)

		if self.teams[info.team].size == 0 then
			self:Close(info.team == 1 and 2 or 1)			
		end
		return true
	end

	function Battlefield:onDeath(player, killer)
		local info = self:findPlayer(player)
		if not info then return false end
		if killer and killer.getName then
			local killerInfo = self:findPlayer(killer)
			if killerInfo and killerInfo.team ~= info.team then
				local killerTeam = self.teams[killerInfo.team]
				killerTeam.kills = killerTeam.kills + 1
			end
		end
		self:onLeave(player)
		return true
	end
end
