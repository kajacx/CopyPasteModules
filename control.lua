--- EVENTS ---

script.on_event({defines.events.on_entity_settings_pasted},
    function(event)
        local player = game.players[event.player_index]
        local playerInventory = player.get_main_inventory()
        
        -- check if functionality is enabled
        if not player.mod_settings["kajacx_copy-paste-modules_enable"].value then
            return -- do nothing
        end
    
        local source = event.source
        local target = event.destination
        if not source or not target then
            return
        end
    
        local sourceInventory = source.get_module_inventory()
        local targetInventory = target.get_module_inventory()
        if not sourceInventory or not targetInventory then
            return
        end
        
        -- before start, remove existing logistic requests
        local targetRequests = target.surface.find_entities_filtered({
            area = {{target.position.x - 0.01, target.position.y - 0.01}, {target.position.x + 0.01, target.position.y + 0.01}},
            name = "item-request-proxy",
            force = player.force
        })
        for _,request in pairs(targetRequests) do
            if request.proxy_target == target then
                local itemRequests = request.item_requests
                for name,_ in pairs(itemRequests) do
                    if game.item_prototypes[name].type == "module" then
                        itemRequests[name] = nil
                    end
                end
                if next(itemRequests) == nil then
                    request.destroy()
                else
                    request.item_requests = itemRequests
                end
            end
        end
        
        -- prepare the "diff" for message display, positive number indicates direction from player to target
        local diff = {}

        -- keep modules from target machine in a variable for now, give them to player (or dump them on the ground) at the end
        local modulesToGive = targetInventory.get_contents()
        -- and clear target inventory
        targetInventory.clear()
        
        -- insert modules from previous modules or the player to target machine
        local missing = {}
        for i=1,math.min(#targetInventory, #sourceInventory),1 do
            local currentItem = sourceInventory[i];
            if currentItem.valid_for_read then -- item present
                local name = currentItem.name
                local moduleTaken = false
                
                if (modulesToGive[name] or 0) > 0 then -- first, try to take from previous modules
                    modulesToGive[name] = modulesToGive[name] - 1
                    moduleTaken = true
                else -- if that fails, try to take it from the player
                    local taken = playerInventory.remove({name = name, count = 1})
                    if taken > 0 then
                        diff[name] = (diff[name] or 0) + 1
                        moduleTaken = true
                    end
                end

                if moduleTaken then -- we took the module and can now give it to the target machine
                    targetInventory[i].set_stack({name = name, count = 1})
                else -- module is missing: save that info for creating a logistic request later
                    missing[name] = (missing[name] or 0) + 1
                end
            end
        end

        -- give remaining items to the player if possible
        for name,count in pairs(modulesToGive) do
            if count > 0 then
                local given = playerInventory.insert({name = name, count = count})
                if given > 0 then -- items given to player, save that info to "diff" to display message later
                    diff[name] = (diff[name] or 0) - given
                end
                if given < count then -- not all items could be given, "dump" them the ground
                    player.print({"message.kajacx_copy-paste-modules_no-inventory-space", game.item_prototypes[name].localised_name})
                    target.surface.spill_item_stack(
                        target.position,
                        {name = name, count = count - given},
                        true,
                        player.force,
                        false
                    )
                end
            end
        end

        -- process the created "diff" to display "items moved" text and play sound
        local messagePosition = {x = target.position.x, y = target.position.y}
        local playSound = false;

        for name,count in pairs(diff) do
            if count > 0 then -- moving items from the player to a machine
                target.surface.create_entity({
                    name = "flying-text",
                    position = messagePosition,
                    text = {
                        "message.kajacx_copy-paste-modules_items-removed",
                        count,
                        game.item_prototypes[name].localised_name,
                        playerInventory.get_item_count(name)
                    }
                })
                messagePosition.y = messagePosition.y - 0.5
                playSound = true;
            elseif count < 0 then -- moving items from a machine to the player
                target.surface.create_entity({
                    name = "flying-text",
                    position = messagePosition,
                    text = {
                        "message.kajacx_copy-paste-modules_items-added",
                        -count,
                        game.item_prototypes[name].localised_name,
                        playerInventory.get_item_count(name)
                    }
                })
                messagePosition.y = messagePosition.y - 0.5
                playSound = true;
            end
        end
        if playSound then
            player.play_sound({path = "utility/inventory_move"})
        end
        
        -- finally, create logistic request in the target entity
        if next(missing) ~= nil and player.mod_settings["kajacx_copy-paste-modules_enable-request"].value then
            local freeSlots = targetInventory.count_empty_stacks()
            if freeSlots > 0 then
                local request = {} -- fill from missing to request as long as there are free slots avaliable
                for name,count in pairs(missing) do
                    if count <= freeSlots then
                        request[name] = count
                        freeSlots = freeSlots - count
                    else
                        request[name] = freeSlots
                        break
                    end
                end
                target.surface.create_entity({
                    name = "item-request-proxy",
                    position = target.position,
                    force = player.force,
                    target = target,
                    modules = request,
                    raise_built = true
                })
                -- TODO: sort the items once the request is completed?
            end
        end
    end
)
