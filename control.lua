--- EVENTS ---

script.on_event({defines.events.on_entity_settings_pasted},
    function(e)
        local player = game.players[e.player_index]
        local playerInventory = player.get_main_inventory()
        
        -- check if functionality is enabled
        if not player.mod_settings["kajacx_copy-paste-modules_enable"].value then
            return -- do nothing
        end
    
        local source = e.source
        local target = e.destination
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
                -- TODO: remove only requests with modules
                request.destroy()
            end
        end
        
        -- first, prepare the "diff", positive number indicates direction from player to target
        local diff = {}
        
        -- then, remove all modules from the machine, so they can be inserted later in the same order
        for name,count in pairs(targetInventory.get_contents()) do
            local moved = playerInventory.insert({name = name, count = count}) -- first insert items to player in case their inventory is full
            if moved > 0 then
                targetInventory.remove({name = name, count = moved}) -- target will always be able to remove the items
                diff[name] = -moved;
            end
            if moved < count then
                player.print({"message.kajacx_copy-paste-modules_no-inventory-space", game.item_prototypes[name].localised_name})
                -- TODO: dump items on the ground?
            end
        end
        
        -- next, insert modules from player to target
        local missing = {}
        for i=1,math.min(#targetInventory, #sourceInventory),1 do
            local currentItem = sourceInventory[i];
            if currentItem.valid_for_read then
                -- item present: try to insert it
                local taken = playerInventory.remove({name = currentItem.name, count = 1}) -- take item from player
                if (taken > 0) then
                    -- player has item: insert it into the target machine
                    targetInventory.insert({name = currentItem.name, count = 1})
                    diff[currentItem.name] = (diff[currentItem.name] or 0) + 1
                else
                    -- player doesn't have item: save that info for creating logistic request later
                    missing[currentItem.name] = (missing[currentItem.name] or 0) + 1
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
                    text = {"message.kajacx_copy-paste-modules_items-removed", count, game.item_prototypes[name].localised_name, playerInventory.get_item_count(name)}
                })
                messagePosition.y = messagePosition.y - 0.5
                playSound = true;
            elseif count < 0 then -- moving items from a machine to the player
                target.surface.create_entity({
                    name = "flying-text",
                    position = messagePosition,
                    text = {"message.kajacx_copy-paste-modules_items-added", -count, game.item_prototypes[name].localised_name, playerInventory.get_item_count(name)}
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
            local freeSlots = 0
            for i = 1,#targetInventory,1 do
                if not targetInventory[i].valid_for_read then
                    freeSlots = freeSlots + 1
                end
            end
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
            end
        end
    end
)
