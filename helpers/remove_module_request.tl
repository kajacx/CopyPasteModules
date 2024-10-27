return function (entity)
    local target_requests = entity.surface.find_entities_filtered({
        area = {
            { entity.position.x - 0.01, entity.position.y - 0.01 },
            { entity.position.x + 0.01, entity.position.y + 0.01 }
        },
        name = "item-request-proxy",
        force = entity.force
    })
    for _,request in pairs(target_requests) do
        game.print("NANI? " .. serpent.block(request.insert_plan[1]))

        if request.proxy_target == entity then
            local item_requests = request.item_requests
            for name,_ in pairs(item_requests) do
                if prototypes['item'][name].type == "module" then
                    item_requests[name] = nil
                end
            end
            if next(item_requests) == nil then
                request.destroy()
            else
                request.item_requests = item_requests
            end
        end
    end
end
