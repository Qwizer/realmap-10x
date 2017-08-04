local startupGlobalStorages = {GlobalStorage.TheAncientTombs.AshmunrahSwitchesGlobalStorage, GlobalStorage.TheAncientTombs.DiprathSwitchesGlobalStorage, GlobalStorage.TheAncientTombs.ThalasSwitchesGlobalStorage}

function onStartup()
	print(string.format('>> Loaded %d npcs and spawned %d monsters.\n>> Loaded %d towns with %d houses in total.', Game.getNpcCount(), Game.getMonsterCount(), #Game.getTowns(), #Game.getHouses()))
	for i = 1, #startupGlobalStorages do
		Game.setStorageValue(startupGlobalStorages[i], 0)
	end

	local time = os.time()
	db.asyncQuery('TRUNCATE TABLE `players_online`')
	
	-- deletar as guilds canceladas e rejeitadas
	db.asyncQuery('DELETE FROM `guild_wars` WHERE `status` = 2')
	db.asyncQuery('DELETE FROM `guild_wars` WHERE `status` = 3')
	
	-- deletar as guilds que estão muito tempo pendentes 3 dias
	db.asyncQuery('DELETE FROM `guild_wars` WHERE `status` = 0 AND (`started` + 72 * 60 * 60) <= ' .. os.time()) 
	
	
	
	--[[
	
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (409)') --1
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (408)') --2
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (407)') --3
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (404)') --4
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (403)') --5
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (402)') --6
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (401)') --7
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (400)') --8
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (399)') --9
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (332)') --10
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (331)') --11
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (330)') --12
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (329)') --13
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (328)') --	14
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (324)') --15
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (325)') --16
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (326)') --17
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (327)') --18
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (664)') --19
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (1136)') --20
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (1156)') --21
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (461)') --22
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (460)') --23
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (459)') --24
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (458)') --25
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (457)') --26
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (456)') --27
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (455)') --28
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (454)') --29
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (452)') --30
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (451)') --31
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (450)') --32
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (448)') --33
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (447)') --34
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (446)') --35
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (445)') --36
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (444)') --37
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (442)') --38
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (441)') --39
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (440)') --40
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (438)') --41
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (437)') --42
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (436)') --43
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (435)') --44
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (434)') --45
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (433)') --46
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (432)') --47
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (431)') --48
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (430)') --49
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (429)') --50
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (428)') --51
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (427)') --52
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (426)') --53
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (425)') --54
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (424)') --55
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (423)') --56
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (422)') --57
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (421)') --58
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (420)') --59
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (419)') --60
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (418)') --61
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (417)') --62
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (416)') --63
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (414)') --64
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (415)') --65
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (413)') --66
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (412)') --67
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (411)') --68
	db.asyncQuery('INSERT INTO `players_online` (`player_id`) VALUES (410)') --69
	
	--]]
    
	
	--db.asyncQuery("UPDATE `guild_wars` SET `status` = 4, `ended` = " .. os.time() .. " WHERE `status` = 1 AND (`started` + 3* 60 * 60) < " .. os.time())
	db.asyncQuery('DELETE FROM `players` WHERE `deletion` != 0 AND `deletion` < ' .. time)
	db.asyncQuery('DELETE FROM `ip_bans` WHERE `expires_at` != 0 AND `expires_at` <= ' .. time)
	db.asyncQuery('DELETE FROM `market_history` WHERE `inserted` <= ' .. (time - configManager.getNumber(configKeys.MARKET_OFFER_DURATION)))

	-- Move expired bans to ban history
	local resultId = db.storeQuery('SELECT * FROM `account_bans` WHERE `expires_at` != 0 AND `expires_at` <= ' .. time)
	if resultId ~= false then
		repeat
			local accountId = result.getNumber(resultId, 'account_id')
			db.asyncQuery('INSERT INTO `account_ban_history` (`account_id`, `reason`, `banned_at`, `expired_at`, `banned_by`) VALUES (' .. accountId .. ', ' .. db.escapeString(result.getString(resultId, 'reason')) .. ', ' .. result.getNumber(resultId, 'banned_at') .. ', ' .. result.getNumber(resultId, 'expires_at') .. ', ' .. result.getNumber(resultId, 'banned_by') .. ')')
			db.asyncQuery('DELETE FROM `account_bans` WHERE `account_id` = ' .. accountId)
		until not result.next(resultId)
		result.free(resultId)
	end
	
	
	-- Check house auctions
	local resultId = db.storeQuery('SELECT `id`, `highest_bidder`, `last_bid`, (SELECT `balance` FROM `players` WHERE `players`.`id` = `highest_bidder`) AS `balance` FROM `houses` WHERE `owner` = 0 AND `bid_end` != 0 AND `bid_end` < ' .. time)
	if resultId ~= false then
		repeat
			local house = House(result.getNumber(resultId, 'id'))
			if house then
				local highestBidder = result.getNumber(resultId, 'highest_bidder')
				local balance = result.getNumber(resultId, 'balance')
				local lastBid = result.getNumber(resultId, 'last_bid')
				if balance >= lastBid then
					db.query('UPDATE `players` SET `balance` = ' .. (balance - lastBid) .. ' WHERE `id` = ' .. highestBidder)
					house:setOwnerGuid(highestBidder)
				end
				db.asyncQuery('UPDATE `houses` SET `last_bid` = 0, `bid_end` = 0, `highest_bidder` = 0, `bid` = 0 WHERE `id` = ' .. house:getId())
			end
		until not result.next(resultId)
		result.free(resultId)
	end
	loadEvent() -- SnowBall event loader

end
