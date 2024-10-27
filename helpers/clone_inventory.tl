return function (inventory)
    local cloned = game.create_inventory(#inventory)
    for _,item in pairs(inventory.get_contents()) do
        cloned.insert(item)
    end
    return cloned
end
