local _tl_compat; if (tonumber((_VERSION or ''):match('[%d.]*$')) or 0) < 5.3 then local p, m = pcall(require, 'compat53.module'); if p then _tl_compat = m end end; local math = _tl_compat and _tl_compat.math or math; local clone_inventory = require("helpers/clone_inventory")
local remove_module_request = require("helpers/remove_module_request")
local dump_items_on_entity = require("helpers/dump_items_on_entity")
local create_module_request = require("helpers/create_module_request")
local mypairs = require("helpers/mypairs")
local better_print = require("helpers/better_print")
local get_desired_modules = require("helpers/get_desired_modules")

local function show_text(player, text)
   player.create_local_flying_text({ text = text, create_at_cursor = true })
end

local function put_modules_into_inventory(desired_inventory, previous_modules, target_inventory, player, interact_with_player)
   local player_inventory = player.get_main_inventory()
   local length = math.min(#desired_inventory, #previous_modules, #target_inventory)
   for i = 1, length do
      local desired_module = desired_inventory[i]
      if not desired_module.valid_for_read then
         goto continue
      end

      desired_module = {
         name = desired_module.name,
         quality = desired_module.quality,
         count = desired_module.count,
      }
      better_print("DM: " .. serpent.block(desired_module))

      better_print("MODULE AT " .. i .. " IS: " .. serpent.block(desired_module))





      local taken = previous_modules.remove(desired_module)
      better_print("TAKEN FROM PLAYER " .. taken .. i)

      if taken == 0 and interact_with_player then
         better_print("HOW???" .. serpent.block(player_inventory.get_contents()))
         local taken_from_player = player_inventory.remove(desired_module)
         if taken_from_player > 0 then
            better_print("TAKEN FROM PLAYER!!!!")
            show_text(player, "TAKEN 0 .. taken_from_player")
         end
         taken = 1
      end

      if taken == 1 then
         target_inventory[i].set_stack(desired_module)
         desired_inventory[i].clear()
         better_print("SETTING STACK, HOW??")
      end

      ::continue::
   end
end


local function give_items_to_player(player, item_inventory)
   local player_inventory = player.get_main_inventory()
   for _, item in mypairs(item_inventory.get_contents()) do
      local given = player_inventory.insert(item)
      if (given > 0) then

         item_inventory.remove({ name = item.name, quality = item.quality, count = given })

      end
   end
end

return function(source, target, player, interact_with_player, create_logistic_request)
   local desired_inventory = get_desired_modules(source)
   local target_inventory = target.get_module_inventory()
   if not desired_inventory or not target_inventory or source == target then
      return
   end


   remove_module_request(target, player)


   local previous_inventory = clone_inventory(target_inventory)
   target_inventory.clear()


   put_modules_into_inventory(desired_inventory, previous_inventory, target_inventory, player, interact_with_player)


   if interact_with_player then
      give_items_to_player(player, previous_inventory)
   end
   dump_items_on_entity(target, previous_inventory)


   if create_logistic_request then
      create_module_request(target, desired_inventory, player)
   end
end
