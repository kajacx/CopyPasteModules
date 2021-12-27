return function(blueprint_entities, event)
    local cursor_position = event.position
    local rotation = event.direction or defines.direction.north

    -- first, rotate (and/or flip) the blueprint and compute it's size
    local rotated_entities = {}

    -- map from "blueprint" entity direction to world direction
    local direction_map = { defines.direction.north, defines.direction.east, defines.direction.south, defines.direction.west }

    -- row-major tranformation matrix
    local location_tranform = {
        { x = 1, y = 0 },
        { x = 0, y = 1 },
    }

    if event.flip_horizontal then
        location_tranform[1].x = -1
        direction_map[2] = defines.direction.west
        direction_map[4] = defines.direction.east
    end
    if event.flip_vertical then
        location_tranform[2].y = -1
        direction_map[1] = defines.direction.south
        direction_map[3] = defines.direction.north
    end

    for _i=2,rotation,2 do
        -- multiply by the rotation matrix from the left
        local swap_x = location_tranform[1].x
        location_tranform[1].x = -location_tranform[2].x
        location_tranform[2].x = swap_x
        local swap_y = location_tranform[1].y
        location_tranform[1].y = -location_tranform[2].y
        location_tranform[2].y = swap_y
    end

    local minX =  1000000000
    local minY =  1000000000
    local maxX = -1000000000
    local maxY = -1000000000

    for _,entity in pairs(blueprint_entities) do
        local direction = defines.direction.north
        if game.entity_prototypes[entity.name].supports_direction then
            direction = entity.direction or defines.direction.north
            direction = direction_map[direction / 2 + 1]
        end

        local posX = location_tranform[1].x * entity.position.x + location_tranform[1].y * entity.position.y
        local posY = location_tranform[2].x * entity.position.x + location_tranform[2].y * entity.position.y

        table.insert(rotated_entities, {
            name = entity.name,
            position = {
                x = posX,
                y = posY,
            },
            direction = direction,
            items = entity.items
        })

        local collision_box = game.entity_prototypes[entity.name].collision_box
        local width  = (collision_box.right_bottom.x - collision_box.left_top.x)
        local height = (collision_box.right_bottom.y - collision_box.left_top.y)
    
        if direction == defines.direction.east or direction == defines.direction.west then
            local swap = width
            width = height
            height = swap
        end

        minX = math.min(minX, math.floor(posX - width  / 2 + 0.5))
        minY = math.min(minY, math.floor(posY - height / 2 + 0.5))
        maxX = math.max(maxX, math.floor(posX + width  / 2 + 0.5))
        maxY = math.max(maxY, math.floor(posY + height / 2 + 0.5))
    end

    local blueprint_width  = maxX - minX
    local blueprint_height = maxY - minY

    -- then, calculate the "align" so that entity pos + aligh = real position
    local alignX = math.floor(cursor_position.x - blueprint_width  / 2 + 0.5) - minX
    local alignY = math.floor(cursor_position.y - blueprint_height / 2 + 0.5) - minY

    -- finally, add align to entity positions
    local final_entities = {}
    for _,entity in pairs(rotated_entities) do
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

            table.insert(final_entities, {
                name = entity.name,
                position = {
                    x = entity.position.x + alignX,
                    y = entity.position.y + alignY,
                },
                direction = entity.direction,
                modules = modules
            })
        end
    end

    return final_entities
end
