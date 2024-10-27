return function (entity, items)
    for _,item in pairs(items) do
        entity.surface.spill_item_stack({
          position = entity.position,
          stack = item,
          force = entity.force,
          allow_belts = false,
        })
    end
end
