local mypairs = require("helpers/mypairs")

return function (entity: LuaEntity, player: LuaPlayer)
    local target_requests: {LuaItemRequestProxyEntity} = entity.surface.find_entities_filtered({
        area = {
            { entity.position.x - 0.01, entity.position.y - 0.01 },
            { entity.position.x + 0.01, entity.position.y + 0.01 }
        },
        name = "item-request-proxy",
        force = entity.force
    })
    for _,request in mypairs(target_requests) do
        game.print("NANI? " .. serpent.block(request.insert_plan[1]))

        if request.proxy_target == entity then
            local item_requests = request.item_requests
            for index,item in mypairs(item_requests) do
                if prototypes['item'][item.name].type == "module" then
                    item_requests[index] = nil
                end
            end
            if next(item_requests) == nil then
                request.destroy(player)
            else
                request.item_requests = item_requests
            end
        end
    end
end
