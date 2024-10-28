local clone_inventory = require("helpers/clone_inventory")
local remove_module_request = require("helpers/remove_module_request")
local dump_items_on_entity = require("helpers/dump_items_on_entity")
local create_module_request = require("helpers/create_module_request")
local mypairs = require("helpers/mypairs")
local better_print = require("helpers/better_print")
local get_desired_modules = require("helpers/get_desired_modules")

local function show_text(player: LuaPlayer, text: string)
  player.create_local_flying_text({ text = text, create_at_cursor = true })
end

local function put_modules_into_inventory(desired_inventory: LuaInventory, previous_modules: LuaInventory, target_inventory: LuaInventory, player: LuaPlayer, interact_with_player: boolean)
    local player_inventory = player.get_main_inventory()
    local length = math.min(#desired_inventory, #previous_modules, #target_inventory)
    for i = 1, length do
        local desired_module = desired_inventory[i]
        if not desired_module.valid_for_read then
            goto continue
        end

        desired_module = { -- clone it or it gets wierd
            name = desired_module.name,
            quality = desired_module.quality,
            count = desired_module.count,
        }
        better_print("DM: " .. serpent.block(desired_module))

        better_print("MODULE AT " .. i .. " IS: " .. serpent.block(desired_module))
        -- if (desired_module.count == 0) then
        --     better_print("SKIPPING")
        --     goto continue
        -- end
        -- Take from previous modules first, then from player (if possible)
        local taken = previous_modules.remove(desired_module)
        better_print("TAKEN FROM PLAYER " .. taken .. i)
      
        if taken == 0 and interact_with_player then
            better_print("HOW???" .. serpent.block(player_inventory.get_contents()))
            local taken_from_player = player_inventory.remove(desired_module)
            if taken_from_player > 0 then
                better_print("TAKEN FROM PLAYER!!!!")
                show_text(player, "TAKEN 0 .. taken_from_player") -- TODO: message       
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

return function(source: LuaEntity, target: LuaEntity, player: LuaPlayer, interact_with_player: boolean, create_logistic_request: boolean)
    local desired_inventory = get_desired_modules(source)
    local target_inventory = target.get_module_inventory()
    if not desired_inventory or not target_inventory or source == target then
        return
    end
    
    -- before start, remove existing logistic requests for modules
    remove_module_request(target, player)
    
    -- take previous items and store them in a variable to be given out later
    local previous_inventory = clone_inventory(target_inventory)
    target_inventory.clear()
    
    -- the "main" function that inserts into the target from previous_modules (mutating it) or player inventory
    put_modules_into_inventory(desired_inventory, previous_inventory, target_inventory, player, interact_with_player)
    
    -- Give out remaining modules
    if interact_with_player then
        give_items_to_player(player, previous_inventory)
    end
    dump_items_on_entity(target, previous_inventory)
    
    -- Create logistinc request for missing modules
    if create_logistic_request then
        create_module_request(target, desired_inventory, player)
    end
end
