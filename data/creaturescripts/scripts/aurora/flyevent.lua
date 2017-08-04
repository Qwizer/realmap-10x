function onMove(player, fromPosition, toPosition)
    if PvpRestrictions:lower() == "high" and player:isPzLocked() then
        return true
    end
 
    if player:isFlying() then
        local fromTile = Tile(fromPosition)
        local fromItem = fromTile:getItemById(460)
        if fromItem then
            fromItem:remove()
        end
        toPosition:createFlyFloor()
    end
    return true
end