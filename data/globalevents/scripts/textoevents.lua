local effects = {
    {position = Position(32303, 31874, 7), text = 'ZOMBIE EVENT', effect = CONST_ME_HOLYAREA},
    {position = Position(32311, 31874, 7), text = 'BATTLEFIELD', effect = CONST_ME_HOLYAREA},
	{position = Position(32313, 31877, 7), text = 'CAPTURE THE FLAG', effect = CONST_ME_HOLYAREA},
	{position = Position(32311, 31881, 7), text = 'ANCHANTED FLOREST', effect = CONST_ME_HOLYAREA},	
	{position = Position(32303, 31882, 7), text = 'LAST MAN STANDING', effect = CONST_ME_HOLYAREA},
    {position = Position(32308, 31883, 7), text = '', effect = CONST_ME_WATERCREATURE},
	{position = Position(32308, 31873, 7), text = '', effect = CONST_ME_WATERCREATURE},
}
 
function onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end
 