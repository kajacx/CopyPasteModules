return function (inventory: LuaInventory)
    local cloned = game.create_inventory(#inventory)
    for _,item in ipairs(inventory.get_contents()) do
        cloned.insert(item)
    end
    return cloned
end
