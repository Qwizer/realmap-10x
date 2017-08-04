local config = {
item_ID = 5014,   -- Id do item que será criado.
quantidade_Item = 1, -- Quantidade de itens que serão criados.
pos = {x = 6360, y = 5731, z = 13},  -- Pos, onde o item será criado.
creature_Name = "Jotunn"  -- Nome da criatura que será morta.
}
 
function onPrepareDeath(cid, deathList, lastHitKiller, mostDamageKiller)
 
         if getCreatureName(cid) == config.creature_Name then
            doCreateItem(config.item_ID, config.quantidade_Item, config.pos)
         end
         
  return true
end