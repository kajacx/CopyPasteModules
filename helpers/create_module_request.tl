return function (entity, modules, player)
    local module_inventory = entity.get_module_inventory()
    local slots_remaining = #module_inventory

    game.print("NANI?" .. type(module_inventory) .. serpent.block(module_inventory.get_contents()))
    for _,item in pairs(module_inventory.get_contents()) do
        slots_remaining = slots_remaining - item.count
    end

    for _,item in pairs(modules) do
        local insert_count = math.min(item.count, slots_remaining)

        if insert_count > 0 then
            entity.surface.create_entity({
                name = "item-request-proxy",
                position = entity.position,
                force = entity.force,
                target = entity,
                player = player,
                modules = { name = item.name, quality = item.quality, count = insert_count }
            })
            slots_remaining = slots_remaining - insert_count
        end
    end
end
