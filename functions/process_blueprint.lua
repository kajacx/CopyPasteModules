return function(blueprint_entities, cursor_position, rotation)
    -- first, rotate the blueprint and compute it's size
    local rotated_entities = {}

    local xCoord = rotation % 4 > 0 and "y" or "x"
    local yCoord = rotation % 4 > 0 and "x" or "y"
    local xSign = (rotation + 2) % 8 >= 4 and -1 or 1
    local ySign =  rotation          >= 4 and -1 or 1

    local minX =  1000000000
    local minY =  1000000000
    local maxX = -1000000000
    local maxY = -1000000000

    for _,entity in pairs(blueprint_entities) do
        local direction = defines.direction.north
        if game.entity_prototypes[entity.name].supports_direction then
            direction = ((entity.direction or defines.direction.north) + rotation) % 8
        end

        local posX = entity.position[xCoord] * xSign
        local posY = entity.position[yCoord] * ySign

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
