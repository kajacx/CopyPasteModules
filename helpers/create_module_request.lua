local _tl_compat; if (tonumber((_VERSION or ''):match('[%d.]*$')) or 0) < 5.3 then local p, m = pcall(require, 'compat53.module'); if p then _tl_compat = m end end; local math = _tl_compat and _tl_compat.math or math; local mypairs = require("helpers/mypairs")
local better_print = require("helpers/better_print")

return function(entity, modules, player)
   local module_inventory = entity.get_module_inventory()
   local slots_remaining = #module_inventory

   better_print("NANI?" .. type(module_inventory) .. serpent.block(module_inventory.get_contents()))
   for _, item in mypairs(module_inventory.get_contents()) do
      slots_remaining = slots_remaining - item.count
   end

   for _, item in mypairs(modules.get_contents()) do
      local insert_count = math.min(item.count, slots_remaining)

      if insert_count > 0 then
         entity.surface.create_entity({
            name = "item-request-proxy",
            position = entity.position,
            force = entity.force,
            target = entity,
            player = player,

         })
         slots_remaining = slots_remaining - insert_count
      end
   end
end
