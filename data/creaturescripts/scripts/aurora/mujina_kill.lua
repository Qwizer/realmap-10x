local config = {
item_ID = 9981,   -- Id do item que será criado.
quantidade_Item = 1, -- Quantidade de itens que serão criados.
pos = {x = 6313, y = 5594, z = 7},  -- Pos, onde o item será criado.
creature_Name = "The Mujina King"  -- Nome da criatura que será morta.
}
 
function onPrepareDeath(cid, deathList, lastHitKiller, mostDamageKiller)
 
         if getCreatureName(cid) == config.creature_Name then
            doCreateItem(config.item_ID, config.quantidade_Item, config.pos)
         end
         
  return true
end