local mypairs = require("helpers/mypairs")

return function(entity, items)
   for _, item in mypairs(items.get_contents()) do
      entity.surface.spill_item_stack({
         position = entity.position,
         stack = item,
         force = entity.force,
         allow_belts = false,
      })
   end
end
