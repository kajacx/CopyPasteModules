local clone_inventory = require("helpers/clone_inventory")
local mypairs = require("helpers/mypairs")

return function(entity: LuaEntity): LuaInventory
    local desired_modules = clone_inventory(entity.get_module_inventory())

    local target_requests: {LuaItemRequestProxyEntity} = entity.surface.find_entities_filtered({
        area = {
            { entity.position.x - 0.01, entity.position.y - 0.01 },
            { entity.position.x + 0.01, entity.position.y + 0.01 }
        },
        name = "item-request-proxy",
        force = entity.force
    })
    -- first pass: remove all modules that are scheduled for removal
    for _, request in mypairs(target_requests) do
        game.print("INSERT PLAN: " .. serpent.block(request.insert_plan))
        game.print("REMOVAL PLAN: " .. serpent.block(request.removal_plan))
        for _, removal in mypairs(request.removal_plan) do
            for _, removed_item in mypairs(removal.items.in_inventory) do

            end
        end
    end

    return desired_modules
end
