function onThink(interval)
	if _Lib_Battle_Days[os.date("%A")] then
		hours = tostring(os.date("%X")):sub(1, 5)
		tb = _Lib_Battle_Days[os.date("%A")][hours]
		if tb and (tb.players % 2 == 0) then
			local tp = Game.createItem(1387, 1, _Lib_Battle_Info.tpPos)
			tp:setActionId(45000)
			CheckEvent(_Lib_Battle_Info.limit_Time)
			Game.setStorageValue(_Lib_Battle_Info.storage_count, tb.players)
			broadcastMessage("[BattleField] Um teleport foi criado no Event Room [Templo de Thais], voces tem 10 minutos para entrar, apenas " .. tb.players .. " jogadores poderao entrar, para serem divididos em " .. ((tb.players) / 2) .. " VS " .. ((tb.players) / 2) .. ".", MESSAGE_EVENT_ADVANCE)
		end
	end
	return true
end
