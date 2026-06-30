
function getIndexOf(array, pred) -- returns index of found item if yes
	-- this function works on arrays only (keys: 1-n)
	for i = 1, #array, 1 do
		local item = array[i]
		if pred(item) then
			return i
		end
	end
	return false
end
function getWhereA(array, pred, startIndex) -- returns found item or nil
	-- this function works on arrays only (keys: 1-n)
	startIndex = startIndex or 1
	for i = 1, #array, startIndex do
		local item = array[i]
		if pred(item, i) then
			return item
		end
	end
end
function orderedListIterator_getNextItemIf(array, key) -- creates a function that returns the next item of an ordered list by key if the value at the specified key matches the passed nextValue
	-- this function works on arrays only (keys: 1-n)
	local index = 1
	function getNextItemIf(nextValue) 
		local item = array[index]
		if not item then return nil end
		if item[key] == nextValue then
			index = index + 1
			return item
		end
	end
	return getNextItemIf
end
function removeWhereA(array, pred, multiple) -- returns index of item if yes, or the number of removed items if yes and multiple=true
	-- this function works on arrays only (keys: 1-n)
	local removedNum = 0
	local i = 1
	while i <= #array do
		local item = array[i]
		if pred(item) then
			table.remove(array, i)
			if not multiple then
				return i
			end
			removedNum = removedNum + 1
		else
			i = i + 1
		end
	end
	if multiple then
		return removedNum
	end
end
--- EVENTS ---
script.on_event({ defines.events.on_entity_settings_pasted },
  function(event)
    local player = game.players[event.player_index]

    -- check if functionality is enabled
    if not player or not player.mod_settings["kajacx_copy-paste-modules_enable"].value then
      return -- do nothing
    end
	local source = event.source
	local target = event.destination
    if not source or not target then
      return -- do nothing
    end
	 
	-- prepare commonly used variables
	local sourceIsGhost = source.name == "entity-ghost"
	local source_module_inventory = sourceIsGhost and nil or source.get_module_inventory()
	local sourceInventorySize = sourceIsGhost and source.ghost_prototype.module_inventory_size or source_module_inventory and #source_module_inventory or 0
	local targetIsGhost = target.name == "entity-ghost"
	local target_module_inventory = targetIsGhost and nil or target.get_module_inventory()
	local targetInventorySize = targetIsGhost and target.ghost_prototype.module_inventory_size or target_module_inventory and #target_module_inventory or 0
    if not (sourceInventorySize > 0 and targetInventorySize > 0) then
      return
    end
	
	
	local player_inventory = player.get_main_inventory()
	local target_module_inventory_index = target_module_inventory and target_module_inventory.index or source_module_inventory and source_module_inventory.index or nil
	local source_modules = {} -- {name, quality, stackIndex}[] -- the stackIndex starts at 0, should be index-1
	

	function getLogisticRequestsForEntity(entity)
		return entity.surface.find_entities_filtered({
			area = {
				{ entity.position.x - 0.01, entity.position.y - 0.01 },
				{ entity.position.x + 0.01, entity.position.y + 0.01 }
			},
			name = "item-request-proxy",
			force = player.force
		})
	end
	function forEachPlan(plans, func, inventory_id)
		for _i, plan in ipairs(plans) do
			if prototypes.item[plan.id.name].type == "module" then
				local positions = plan.items.in_inventory
				if positions then
					for __i, position in ipairs(positions) do
						if not inventory_id or position.inventory == inventory_id then
							func(plan, position)
						end
					end
				end
			end
		end
	end
	if not sourceIsGhost then
		-- 1st see existing modules in the source entity
		for i = 1, #source_module_inventory, 1 do
			local stack = source_module_inventory[i]
			if stack.valid_for_read then
				table.insert(source_modules, {stack.name, stack.quality.name, i-1})
			end
		end
		-- patch modules list with planned actions
		local source_requests = getLogisticRequestsForEntity(source)
		for _, request in pairs(source_requests) do
			if request.proxy_target == source then
				-- Remove modules that are to be removed by bot
				forEachPlan(request.removal_plan, function (plan, position)
					removeWhereA(source_modules, function (item)
						return item[3] == position.stack
					end)
				end, source_module_inventory.index)
				
				-- add modules that are to be brought by bot
				forEachPlan(request.insert_plan, function (plan, position)
					table.insert(source_modules, {plan.id.name, plan.id.quality or "normal", position.stack})
				end, source_module_inventory.index)
			end
		end
	else -- sourceIsGhost
		forEachPlan(source.insert_plan, function (plan, position)
			table.insert(source_modules, {plan.id.name, plan.id.quality or "normal", position.stack})
			if not target_module_inventory_index then
				target_module_inventory_index = position.inventory
			end
		end)
	end
	
	
	-- sort the list by stackindex
	table.sort(source_modules, function (a, b)
		return a[3] < b[3]
	end)
	-- if the target modules inventory is smaller than the source modules inventory then insert them without gaps until full
	local toAddInSequence = false
	if targetInventorySize < sourceInventorySize then
		toAddInSequence = true
		-- remove gaps
		for i, item in ipairs(source_modules) do
			item[3] = i-1
		end
	end


	-- before start, remove existing logistic requests for modules
	if not targetIsGhost then
		local target_requests = getLogisticRequestsForEntity(target)
		for _, request in pairs(target_requests) do
			if request.proxy_target == target then
				local combinedSize = 0
				for i, planType in ipairs({"insert_plan", "removal_plan"}) do
					local plan = request[planType]
					local numRemoved = removeWhereA(plan, function (plan)
						if prototypes.item[plan.id.name].type == "module" then
							return true
						end
					end, true)
					if numRemoved > 0 then
						request[planType] = plan
					end
					combinedSize = combinedSize + #plan
				end
				if combinedSize == 0 then
					request.destroy()
				end
			end
		end
	else
		target.insert_plan = {}
	end

	-- next, prepare the "diff" for message display, positive number indicates direction from player to target
	local modules_diff = {}  -- module_name => diff
	-- keep modules from target machine in a variable for now, give them to player (or dump them on the ground) at the end
	local modulesTakenFromTarget = {}  -- ItemCountWithQuality[]
	if target_module_inventory and player_inventory then
		modulesTakenFromTarget = target_module_inventory.get_contents()
	end
	
	


	-- then, (re)insert modules from previous modules or the player to target machine
	local missing = {} -- {name, quality, index}[] -- the index starts at 0
	local toRemove = {} -- {name, quality, index}[] 
	local modulesInTargetChanged = false
	function getPlan(name, quality, stackIndex)
		return {
			id = { name = name, quality = quality },
			items = {
				in_inventory = {{
					inventory = target_module_inventory_index,
					-- stack index starts at 0 apparently
					stack = stackIndex,
				}}
			}
		}
	end
	if sourceIsGhost and targetIsGhost then
		if toAddInSequence then
			local plans = {}
			for _idx = 1, math.min(targetInventorySize, #source_modules), 1 do
				table.insert(plans, getPlan(table.unpack(source_modules[_idx])))
			end
			target.insert_plan = plans
		else
			target.insert_plan = source.insert_plan
		end
	else
		if targetIsGhost then
			missing = source_modules
		else
			local getNextItemIf = orderedListIterator_getNextItemIf(source_modules, 3) -- O(1), much faster than getWhereA
			local newTargetModules = {}
			local isImmediateAction = not not player_inventory -- when the player character is present
			
			for stackIndex = 1, targetInventorySize, 1 do
				local currentItem = getNextItemIf(stackIndex-1)
				local name, quality
				if currentItem then
					name = currentItem[1]
					quality = currentItem[2]
				end
				local module_taken = false
				
				local target_module = target_module_inventory[stackIndex]
				local targetHasModule = target_module.valid_for_read
				local sameModulePresent = targetHasModule and currentItem and target_module.name == name and target_module.quality.name == quality
				
				if isImmediateAction then
					if currentItem then
						local hasModulesIndex = getIndexOf(modulesTakenFromTarget, function(item)
							return item.name == name and item.quality == quality and item.count > 0
						end)
						if hasModulesIndex then -- first, try to take from previous modules
							local remainingModulesTakenFromTarget = modulesTakenFromTarget[hasModulesIndex]
							remainingModulesTakenFromTarget.count = remainingModulesTakenFromTarget.count - 1
							module_taken = true
						else -- if that fails, try to take it from the player
							local taken = player_inventory.remove({ name = name, count = 1, quality = quality })
							if taken > 0 then
								modules_diff[name] = (modules_diff[name] or 0) + 1
								module_taken = true
							end
						end
						if module_taken and not sameModulePresent then
							modulesInTargetChanged = true
						end
					end
				else -- no player character with inventory (radar, remote view). Ghost actions only.
					-- create removal request if needed
					if(targetHasModule and not sameModulePresent) then
						table.insert(toRemove, {target_module.name, target_module.quality.name, stackIndex-1})
					end
				end
				
				
				
				if module_taken then
					-- we took the module and can now give it to the target machine
					newTargetModules[stackIndex] = { name = name, count = 1, quality = quality }
				elseif currentItem and (isImmediateAction or not sameModulePresent) then
					-- module is missing: save that info for creating a logistic request later
					table.insert(missing, currentItem)
				end
			end
			
			-- set target modules
			if isImmediateAction then
				target_module_inventory.clear()
				for stackIndex, module in pairs(newTargetModules) do
					target_module_inventory[stackIndex].set_stack(module)
				end
			end
		end
	end

	-- next, give remaining items to the player or dump them on the ground
	for i, modules in ipairs(modulesTakenFromTarget) do
		if modules.count > 0 then
			local given = 0;
			if player_inventory then
				given = player_inventory.insert(modules)
				if given > 0 then -- items given to player, save that info to "diff" to display message later
					modules_diff[modules.name] = (modules_diff[modules.name] or 0) - given
				end
			end
			if given < modules.count then -- not all items could be given, "dump" them the ground
				if (true) then
					player.print({ "message.kajacx_copy-paste-modules_no-inventory-space", prototypes.item[modules.name].localised_name })
				end
				target.surface.spill_item_stack({
					position = target.position,
					stack = { name = modules.name, count = modules.count - given, quality = modules.quality },
					enable_looted = true,
					force = player.force,
					allow_belts = false
				})
			end
		end
	end

	-- process the created "diff" to display "items moved" text and play sound
	if player_inventory then
		local message_position = { x = target.position.x, y = target.position.y }
		local play_sound = modulesInTargetChanged;

		for name, count in pairs(modules_diff) do
			if count ~= 0 then
				player.create_local_flying_text({
					text = {
						(count > 0 and "message.kajacx_copy-paste-modules_items-removed" or "message.kajacx_copy-paste-modules_items-added"),
						math.abs(count),
						prototypes.item[name].localised_name,
						player_inventory.get_item_count(name)
					},
					position = message_position,
				})
				message_position.y = message_position.y - 0.5
				play_sound = true;
			end
		end
		if play_sound then
			player.play_sound({ path = "utility/inventory_move" })
		end
	end
	
		

	-- finally, create logistic request in the target entity
	if #toRemove > 0 or #missing > 0 then
		assert(target_module_inventory_index ~= nil, "Could not obtain module inventory id")
		
		local request = {}
		if #missing > 0 then
			-- fill from missing to request as long as there are free slots avaliable	
			for _idx = 1, #missing, 1 do
				table.insert(request, getPlan(table.unpack(missing[_idx])))
			end
			
			if targetIsGhost then
				target.insert_plan = request
			end
		end
		
		if not targetIsGhost then
			local removal = {} 
			for i, item in ipairs(toRemove) do
				table.insert(removal, getPlan(table.unpack(item)))
			end
			
			if #request > 0 or #removal > 0 then
				target.surface.create_entity({
					name = "item-request-proxy",
					position = target.position,
					force = player.force,
					target = target,
					modules = request,
					removal_plan = removal,
					raise_built = true
				})
			end
		end
	end
  end
)

