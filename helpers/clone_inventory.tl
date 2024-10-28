local mypairs = require("helpers/mypairs")

return function (inventory: LuaInventory): LuaInventory
    local cloned = game.create_inventory(#inventory)
    for _,item in mypairs(inventory.get_contents()) do
        cloned.insert(item)
    end
    return cloned
end
