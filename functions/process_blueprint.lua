local function entity_size(entity_name)
    local collision_box = game.entity_prototypes[entity_name].collision_box

    -- FIXME: why would collision box in PROTOTYPE ever be rotated? ask the entity instead!

    -- TODO: is there no better way to compute the size of an entity?
    local width  = math.ceil(collision_box.right_bottom.x - collision_box.left_top.x)
    local height = math.ceil(collision_box.right_bottom.y - collision_box.left_top.y)

    if collision_box.direction == defines.direction.east or collision_box.direction == defines.direction.west then
        -- TODO: check that this is correct with a rectangular entity
        local swap = width
        width = height
        height = swap
    end

    return {
        width = width,
        height = height
    }
end

return function(blueprint_entities, cursor_position)
    -- first, compute the size of the blueprint
    local minX =  1000000000
    local minY =  1000000000
    local maxX = -1000000000
    local maxY = -1000000000

    for _,entity in pairs(blueprint_entities) do
        local size = entity_size(entity.name)

        minX = math.min(minX, math.floor(entity.position.x - size.width  / 2))
        minY = math.min(minY, math.floor(entity.position.y - size.height / 2))
        maxX = math.max(maxX, math.ceil (entity.position.x + size.width  / 2))
        maxY = math.max(maxY, math.ceil (entity.position.y + size.height / 2))
    end

    local blueprint_width  = maxX - minX
    local blueprint_height = maxY - minY

    -- then, calculate the "align" so that entity pos + aligh = real position
    local alignX = math.floor(cursor_position.x - blueprint_width  / 2 + 0.5) - minX
    local alignY = math.floor(cursor_position.y - blueprint_height / 2 + 0.5) - minY

    -- finally, process modules and add align to entity positions
    local new_entities = {}
    for _,entity in pairs(blueprint_entities) do
        if game.entity_prototypes[entity.name].module_inventory_size then
            local modules = {}
            for name,count in pairs(entity.items or {}) do
                if game.item_prototypes[name].type == "module" then
                    for _i=1,count,1 do
                        table.insert(modules, {
                            valid_for_read = true,
                            name = name
                        })
                    end
                end
            end

            table.insert(new_entities, {
                name = entity.name,
                position = {
                    x = entity.position.x + alignX,
                    y = entity.position.y + alignY
                },
                direction = entity.direction or defines.direction.north,
                modules = modules
            })
        end
    end

    return new_entities
end
