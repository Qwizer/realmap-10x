function onThink(cid, target)
local monsters = {
    ["Cat"] = {
        text = {"The cat lost her 7 lives! :D", "This sucker have lost his lives! :D"},
        emotes = {"MjaaaUUU1!!", "LoL sucker"},
        effect = 49,
        lives = 7
        },
    ["Trainer"] = {
        text = {}, -- No message after death needed, the Trainer can't die.
        emotes = {"You can't kill me!!!??", "I'm a training monk!"},
        effect = 0, -- 0 for no effects.
        lives = 0 -- 0 for imortality
        }
}
 
    local select = monsters[getCreatureName(target)]
   
    if select then
        local id = getGlobalStorageValue(target)
        if id >= select.lives and select.lives ~= 0 then
            if select.text[1] then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, select.text[math.random(1, #select.text)])
            end
        else
            setGlobalStorageValue(target,((lives ~= nil and (id == -1 and 1) or id+1) or -1))
            doCreatureAddHealth(target, getCreatureMaxHealth(target), 1)
            doSendMagicEffect(getCreaturePosition(target), select.effect)
            if select.emotes[1] then
                doPlayerSendTextMessage(target, select.emotes[math.random(1, #select.emotes)], TALKTYPE_ORANGE_1)
            end
            return false
        end
    end
    return true
end