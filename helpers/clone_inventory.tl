return function (inventory: LuaInventory): LuaInventory
    local cloned = game.create_inventory(#inventory)
    for i = 1, #inventory do
        cloned[i].set_stack(inventory[i])
    end
    return cloned
end
