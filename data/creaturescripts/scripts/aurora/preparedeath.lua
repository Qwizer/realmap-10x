local function sendLetter(p)
        local pos = p.pos
        local letter = p.letter
        doCreatureSay(pos, letter, TALKTYPE_MONSTER_SAY)
end
 
function onPrepareDeath(cid, deathList)
        local letters = {"O", "W", "N", "E", "D", "!"}
        for i = 1, #letters do
                addEvent(sendLetter, i * 150, {pos = getCreaturePosition(cid), letter = letters[i]})
        end
        return true
end