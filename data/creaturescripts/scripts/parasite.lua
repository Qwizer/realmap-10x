--[[
Created by Slavi
Credits are for me
]]
 
local function inRangeOfPos(fromPos, pos, toPos)
        if((pos.x >= fromPos.x) and (pos.y >= fromPos.y)) and ((pos.x <= toPos.x) and (pos.y <= toPos.y)) then
                return true
        else
                return false
        end
end
 
local time = 5 --[[ don't edit after this]]* 60 * 1000 -- TIME
local pos = {
                Position(33091, 31974, 11),
                Position(33101, 31980, 11)
}
local barrier = false
local last = false
barrierX = {
                                --{x = 33098, y = 31976, z = 11},
                                {x = 33098, y = 31977, z = 11},
                                {x = 33098, y = 31978, z = 11}--,
                                --{x = 33098, y = 31979, z = 11}
        }
 
function onKill(cid, target)
        if(target:getName():lower() == "parasite" and getGlobalStorageValue(99159) < 1) then
 
        local tPos = target:getPosition()
        if inRangeOfPos(pos[1], target:getPosition(), pos[2]) then
                        barrier = true
        end
                               
        if(barrier == true) then
                for i = 1, #barrierX do
                        --doRemoveItem(getThingfromPos(barrierX[i]).uid, 1)
						Tile(barrierX[i]):getItemById(18459):remove()
						
                end
                addEvent(recreateItems, time)
				
        end
       
       
        return true
end
function recreateItems()
        for i = 1, #barrierX do
                local tile = Tile(barrierX[i])
                local item = tile:getItemById(18459) or nil
                if not item then               
                        Game.createItem(18459,1, barrierX[i])
                end
        end
end
end