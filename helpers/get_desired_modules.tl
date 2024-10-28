local mypairs = require("helpers/mypairs")
local clone_inventory = require("helpers/clone_inventory")
local better_print = require("helpers/better_print")

return function(entity: LuaEntity): LuaInventory
    local existing_modules = entity.get_module_inventory();
    if not existing_modules then
        return nil
    end

    -- first pass: modules directly in machine
    local desired_modules = clone_inventory(existing_modules)

    -- get requests for second and final pass
    local target_requests = entity.surface.find_entities_filtered({
        area = {
            { entity.position.x - 0.01, entity.position.y - 0.01 },
            { entity.position.x + 0.01, entity.position.y + 0.01 }
        },
        name = "item-request-proxy",
        force = entity.force
    })

    -- second pass: remove all modules that are scheduled for removal
    for _, request in mypairs(target_requests) do
        for _, removal in mypairs(request.removal_plan) do
            for _, removed_item in mypairs(removal.items.in_inventory) do
                -- BUG: stack is 0-indexed https://forums.factorio.com/viewtopic.php?f=7&t=118217
                desired_modules[removed_item.stack + 1].clear()
            end
        end
    end

    -- final pass pass: add all modules that are scheduled for insertion
    for _, request in mypairs(target_requests) do
        for _, insert in mypairs(request.insert_plan) do
            for _, inserted_item in mypairs(insert.items.in_inventory) do
                better_print("SETTING AT " .. (inserted_item.stack + 1) .. " NAME: " .. insert.id.name)
                -- BUG: stack is 0-indexed https://forums.factorio.com/viewtopic.php?f=7&t=118217
                desired_modules[inserted_item.stack + 1].set_stack{
                    name = insert.id.name,
                    count = 1,
                    quality = insert.id.quality,
                }
            end
        end
    end

    better_print("DESIRED CONTENT: " .. serpent.block(desired_modules.get_contents()))

    return desired_modules
end
