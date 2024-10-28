local clone_inventory = require("helpers/clone_inventory")
local remove_module_request = require("helpers/remove_module_request")
local dump_items_on_entity = require("helpers/dump_items_on_entity")
local create_module_request = require("helpers/create_module_request")
local mypairs = require("helpers/mypairs")

local function put_modules_into_inventory(desired_inventory: LuaInventory, previous_modules: LuaInventory, target_inventory: LuaInventory, player: LuaPlayer, interact_with_player: boolean)
    local player_inventory = player.get_main_inventory()
    local slots_remaining = #target_inventory
    for _, desired in mypairs(desired_inventory.get_contents()) do
        local desired_amount = math.min(desired.count, slots_remaining)
        if (desired_amount == 0) then -- game will crash when removing 0 items :(
            goto continue 
        end

        -- Take from previous modules first, then from player (if possible)
        local taken = previous_modules.remove({ name = desired.name, quality = desired.quality, count = desired_amount })
      
        if taken < desired_amount and interact_with_player then
            local taken_from_player = player_inventory.remove({ name = desired.name, quality = desired.quality, count = desired_amount - taken })
            if taken_from_player > 0 then
                game.print("TAKEN 0 .. taken_from_player") -- TODO: message       
            end
            taken = taken + taken_from_player
        end
      
        if taken > 0 then -- game with crash when inserting 0 items :(
            desired_inventory.remove({ name = desired.name, quality = desired.quality, count = taken })
            target_inventory.insert({ name = desired.name, quality = desired.quality, count = taken })
        end
      
        slots_remaining = slots_remaining - taken
        ::continue::
    end
end


local function give_items_to_player(player: LuaPlayer, item_inventory: LuaInventory)
    local player_inventory = player.get_main_inventory()
    for _,item in mypairs(item_inventory.get_contents()) do
        local given = player_inventory.insert(item)
        if (given > 0) then
            -- remove must be here, game will crash when removing 0 items
            item_inventory.remove({ name = item.name, quality = item.quality, count = given })
            -- TODO: message
        end
    end
end

local function show_text(player: LuaPlayer, text: string)
  player.create_local_flying_text({ text = text, create_at_cursor = true })
end

return function(source_module_inventory: LuaInventory, target_entity: LuaEntity, player: LuaPlayer, interact_with_player: boolean, create_logistic_request: boolean)
    local target_inventory = target_entity.get_module_inventory()
    if not target_inventory then
        return
    end
    
    -- before start, remove existing logistic requests for modules
    remove_module_request(target_entity, player)
    
    -- take previous items and store them in a variable to be given out later
    local previous_inventory = clone_inventory(target_inventory)
    target_inventory.clear()
    
    -- list of modules to be inserted, will be mutated (removed from) as modules are inserted
    local desired_inventory = clone_inventory(source_module_inventory)
    
    -- the "main" function that inserts into the target from previous_modules (mutating it) or player inventory
    put_modules_into_inventory(desired_inventory, previous_inventory, target_inventory, player, interact_with_player)
    
    -- Give out remaining modules
    if interact_with_player then
        give_items_to_player(player, previous_inventory)
    end
    dump_items_on_entity(target_entity, previous_inventory)
    
    -- Create logistinc request for missing modules
    if create_logistic_request then
        create_module_request(target_entity, desired_inventory, player)
    end
end
