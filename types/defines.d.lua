---@class Defines This is the class of the `defines` object that will exist at runtime.
---@field alert_type alert_type
---@field behavior_result behavior_result AI command exit status. See [LuaEntity::set_command](LuaEntity::set_command)
---@field build_check_type build_check_type
---@field chain_signal_state chain_signal_state State of a chain signal.
---@field chunk_generated_status chunk_generated_status
---@field circuit_condition_index circuit_condition_index
---@field circuit_connector_id circuit_connector_id
---@field command command Command given to units describing what they should do.
---@field compound_command compound_command How commands are joined together in a compound command (see [defines.command.compound](defines.command.compound)).
---@field control_behavior control_behavior
---@field controllers controllers
---@field deconstruction_item deconstruction_item
---@field difficulty difficulty
---@field difficulty_settings difficulty_settings
---@field direction direction
---@field disconnect_reason disconnect_reason
---@field distraction distraction
---@field entity_status entity_status
---@field events events See the [events page](events.html) for more info on what events contain and when they get raised.
---@field flow_precision_index flow_precision_index
---@field group_state group_state
---@field gui_type gui_type
---@field input_action input_action
---@field inventory inventory
---@field logistic_member_index logistic_member_index
---@field logistic_mode logistic_mode
---@field mouse_button_type mouse_button_type
---@field prototypes prototypes A dictionary mapping all top-level prototypes by name to a list of their associated subtypes. This list is organized as a lookup table, meaning it maps the sub-prototype names to `0`. As an example, `defines.prototypes['entity']` looks like this: `{furnace=0, inserter=0, container=0, ...}`.
---@field rail_connection_direction rail_connection_direction
---@field rail_direction rail_direction
---@field relative_gui_position relative_gui_position
---@field relative_gui_type relative_gui_type
---@field render_mode render_mode
---@field rich_text_setting rich_text_setting
---@field riding riding
---@field shooting shooting
---@field signal_state signal_state State of an ordinary rail signal.
---@field train_state train_state
---@field transport_line transport_line
---@field wire_connection_id wire_connection_id
---@field wire_type wire_type

---@class alert_type
---@field custom DefinesAlertType
---@field entity_destroyed DefinesAlertType
---@field entity_under_attack DefinesAlertType
---@field no_material_for_construction DefinesAlertType
---@field no_storage DefinesAlertType
---@field not_enough_construction_robots DefinesAlertType
---@field not_enough_repair_packs DefinesAlertType
---@field train_out_of_fuel DefinesAlertType
---@field turret_fire DefinesAlertType

---@class DefinesAlertType Enum value type for alert_type

---@class behavior_result AI command exit status. See [LuaEntity::set_command](LuaEntity::set_command)
---@field deleted DefinesBehaviorResult
---@field fail DefinesBehaviorResult
---@field in_progress DefinesBehaviorResult
---@field success DefinesBehaviorResult

---@class DefinesBehaviorResult Enum value type for behavior_result

---@class build_check_type
---@field blueprint_ghost DefinesBuildCheckType
---@field ghost_revive DefinesBuildCheckType
---@field manual DefinesBuildCheckType
---@field manual_ghost DefinesBuildCheckType
---@field script DefinesBuildCheckType
---@field script_ghost DefinesBuildCheckType

---@class DefinesBuildCheckType Enum value type for build_check_type

---@class chain_signal_state State of a chain signal.
---@field all_open DefinesChainSignalState
---@field none DefinesChainSignalState
---@field none_open DefinesChainSignalState
---@field partially_open DefinesChainSignalState

---@class DefinesChainSignalState Enum value type for chain_signal_state

---@class chunk_generated_status
---@field basic_tiles DefinesChunkGeneratedStatus
---@field corrected_tiles DefinesChunkGeneratedStatus
---@field custom_tiles DefinesChunkGeneratedStatus
---@field entities DefinesChunkGeneratedStatus
---@field nothing DefinesChunkGeneratedStatus
---@field tiles DefinesChunkGeneratedStatus

---@class DefinesChunkGeneratedStatus Enum value type for chunk_generated_status

---@class circuit_condition_index
---@field arithmetic_combinator DefinesCircuitConditionIndex
---@field constant_combinator DefinesCircuitConditionIndex
---@field decider_combinator DefinesCircuitConditionIndex
---@field inserter_circuit DefinesCircuitConditionIndex
---@field inserter_logistic DefinesCircuitConditionIndex
---@field lamp DefinesCircuitConditionIndex
---@field offshore_pump DefinesCircuitConditionIndex
---@field pump DefinesCircuitConditionIndex

---@class DefinesCircuitConditionIndex Enum value type for circuit_condition_index

---@class circuit_connector_id
---@field accumulator DefinesCircuitConnectorId
---@field combinator_input DefinesCircuitConnectorId
---@field combinator_output DefinesCircuitConnectorId
---@field constant_combinator DefinesCircuitConnectorId
---@field container DefinesCircuitConnectorId
---@field electric_pole DefinesCircuitConnectorId
---@field inserter DefinesCircuitConnectorId
---@field lamp DefinesCircuitConnectorId
---@field offshore_pump DefinesCircuitConnectorId
---@field programmable_speaker DefinesCircuitConnectorId
---@field pump DefinesCircuitConnectorId
---@field rail_chain_signal DefinesCircuitConnectorId
---@field rail_signal DefinesCircuitConnectorId
---@field roboport DefinesCircuitConnectorId
---@field storage_tank DefinesCircuitConnectorId
---@field wall DefinesCircuitConnectorId

---@class DefinesCircuitConnectorId Enum value type for circuit_connector_id

---@class command Command given to units describing what they should do.
---@field attack DefinesCommand Attack another entity.
---@field attack_area DefinesCommand Go to a place and attack what you see.
---@field build_base DefinesCommand Go to a position and build a base there.
---@field compound DefinesCommand Chain commands together, see [defines.compound_command](defines.compound_command).
---@field flee DefinesCommand Flee from another entity.
---@field go_to_location DefinesCommand Go to a specific position.
---@field group DefinesCommand Do what your group wants you to do.
---@field stop DefinesCommand Stop moving and stay where you are.
---@field wander DefinesCommand Chill.

---@class DefinesCommand Enum value type for command

---@class compound_command How commands are joined together in a compound command (see [defines.command.compound](defines.command.compound)).
---@field logical_and DefinesCompoundCommand Fail on first failure. Only succeeds if all commands (executed one after another) succeed.
---@field logical_or DefinesCompoundCommand Succeed on first success. Only fails if all commands (executed one after another) fail.
---@field return_last DefinesCompoundCommand Execute all commands in sequence and fail or succeed depending on the return status of the last command.

---@class DefinesCompoundCommand Enum value type for compound_command

---@class control_behavior
---@field inserter inserter
---@field logistic_container logistic_container
---@field lamp lamp
---@field mining_drill mining_drill
---@field transport_belt transport_belt
---@field type type

---@class inserter
---@field circuit_mode_of_operation circuit_mode_of_operation
---@field hand_read_mode hand_read_mode

---@class circuit_mode_of_operation
---@field enable_disable DefinesControlBehaviorInserterCircuitModeOfOperation
---@field none DefinesControlBehaviorInserterCircuitModeOfOperation
---@field read_hand_contents DefinesControlBehaviorInserterCircuitModeOfOperation
---@field set_filters DefinesControlBehaviorInserterCircuitModeOfOperation
---@field set_stack_size DefinesControlBehaviorInserterCircuitModeOfOperation

---@class DefinesControlBehaviorInserterCircuitModeOfOperation Enum value type for circuit_mode_of_operation

---@class hand_read_mode
---@field hold DefinesControlBehaviorInserterHandReadMode
---@field pulse DefinesControlBehaviorInserterHandReadMode

---@class DefinesControlBehaviorInserterHandReadMode Enum value type for hand_read_mode

---@class logistic_container
---@field circuit_mode_of_operation circuit_mode_of_operation

---@class circuit_mode_of_operation
---@field send_contents DefinesControlBehaviorLogisticContainerCircuitModeOfOperation
---@field set_requests DefinesControlBehaviorLogisticContainerCircuitModeOfOperation

---@class DefinesControlBehaviorLogisticContainerCircuitModeOfOperation Enum value type for circuit_mode_of_operation

---@class lamp
---@field circuit_mode_of_operation circuit_mode_of_operation

---@class circuit_mode_of_operation
---@field use_colors DefinesControlBehaviorLampCircuitModeOfOperation

---@class DefinesControlBehaviorLampCircuitModeOfOperation Enum value type for circuit_mode_of_operation

---@class mining_drill
---@field resource_read_mode resource_read_mode

---@class resource_read_mode
---@field entire_patch DefinesControlBehaviorMiningDrillResourceReadMode
---@field this_miner DefinesControlBehaviorMiningDrillResourceReadMode

---@class DefinesControlBehaviorMiningDrillResourceReadMode Enum value type for resource_read_mode

---@class transport_belt
---@field content_read_mode content_read_mode

---@class content_read_mode
---@field hold DefinesControlBehaviorTransportBeltContentReadMode
---@field pulse DefinesControlBehaviorTransportBeltContentReadMode

---@class DefinesControlBehaviorTransportBeltContentReadMode Enum value type for content_read_mode

---@class type
---@field accumulator DefinesControlBehaviorType [LuaAccumulatorControlBehavior](LuaAccumulatorControlBehavior)
---@field arithmetic_combinator DefinesControlBehaviorType [LuaArithmeticCombinatorControlBehavior](LuaArithmeticCombinatorControlBehavior)
---@field constant_combinator DefinesControlBehaviorType [LuaConstantCombinatorControlBehavior](LuaConstantCombinatorControlBehavior)
---@field container DefinesControlBehaviorType [LuaContainerControlBehavior](LuaContainerControlBehavior)
---@field decider_combinator DefinesControlBehaviorType [LuaDeciderCombinatorControlBehavior](LuaDeciderCombinatorControlBehavior)
---@field generic_on_off DefinesControlBehaviorType [LuaGenericOnOffControlBehavior](LuaGenericOnOffControlBehavior)
---@field inserter DefinesControlBehaviorType [LuaInserterControlBehavior](LuaInserterControlBehavior)
---@field lamp DefinesControlBehaviorType [LuaLampControlBehavior](LuaLampControlBehavior)
---@field logistic_container DefinesControlBehaviorType [LuaLogisticContainerControlBehavior](LuaLogisticContainerControlBehavior)
---@field mining_drill DefinesControlBehaviorType [LuaMiningDrillControlBehavior](LuaMiningDrillControlBehavior)
---@field programmable_speaker DefinesControlBehaviorType [LuaProgrammableSpeakerControlBehavior](LuaProgrammableSpeakerControlBehavior)
---@field rail_chain_signal DefinesControlBehaviorType [LuaRailChainSignalControlBehavior](LuaRailChainSignalControlBehavior)
---@field rail_signal DefinesControlBehaviorType [LuaRailSignalControlBehavior](LuaRailSignalControlBehavior)
---@field roboport DefinesControlBehaviorType [LuaRoboportControlBehavior](LuaRoboportControlBehavior)
---@field storage_tank DefinesControlBehaviorType [LuaStorageTankControlBehavior](LuaStorageTankControlBehavior)
---@field train_stop DefinesControlBehaviorType [LuaTrainStopControlBehavior](LuaTrainStopControlBehavior)
---@field transport_belt DefinesControlBehaviorType [LuaTransportBeltControlBehavior](LuaTransportBeltControlBehavior)
---@field wall DefinesControlBehaviorType [LuaWallControlBehavior](LuaWallControlBehavior)

---@class DefinesControlBehaviorType Enum value type for type

---@class controllers
---@field character DefinesControllers The controller controls a character. This is the default controller in freeplay.
---@field cutscene DefinesControllers The player can't interact with the world, and the camera pans around in a predefined manner.
---@field editor DefinesControllers The Editor Controller near ultimate power to do almost anything in the game.
---@field ghost DefinesControllers Can't interact with the world, can only observe. Used in the multiplayer waiting-to-respawn screen.
---@field god DefinesControllers The controller isn't tied to a character. This is the default controller in sandbox.
---@field spectator DefinesControllers Can't change anything in the world but can view anything.

---@class DefinesControllers Enum value type for controllers

---@class deconstruction_item
---@field entity_filter_mode entity_filter_mode
---@field tile_filter_mode tile_filter_mode
---@field tile_selection_mode tile_selection_mode

---@class entity_filter_mode
---@field blacklist DefinesDeconstructionItemEntityFilterMode
---@field whitelist DefinesDeconstructionItemEntityFilterMode

---@class DefinesDeconstructionItemEntityFilterMode Enum value type for entity_filter_mode

---@class tile_filter_mode
---@field blacklist DefinesDeconstructionItemTileFilterMode
---@field whitelist DefinesDeconstructionItemTileFilterMode

---@class DefinesDeconstructionItemTileFilterMode Enum value type for tile_filter_mode

---@class tile_selection_mode
---@field always DefinesDeconstructionItemTileSelectionMode
---@field never DefinesDeconstructionItemTileSelectionMode
---@field normal DefinesDeconstructionItemTileSelectionMode
---@field only DefinesDeconstructionItemTileSelectionMode

---@class DefinesDeconstructionItemTileSelectionMode Enum value type for tile_selection_mode

---@class difficulty
---@field easy DefinesDifficulty
---@field hard DefinesDifficulty
---@field normal DefinesDifficulty

---@class DefinesDifficulty Enum value type for difficulty

---@class difficulty_settings
---@field recipe_difficulty recipe_difficulty
---@field technology_difficulty technology_difficulty

---@class recipe_difficulty
---@field expensive DefinesDifficultySettingsRecipeDifficulty
---@field normal DefinesDifficultySettingsRecipeDifficulty

---@class DefinesDifficultySettingsRecipeDifficulty Enum value type for recipe_difficulty

---@class technology_difficulty
---@field expensive DefinesDifficultySettingsTechnologyDifficulty
---@field normal DefinesDifficultySettingsTechnologyDifficulty

---@class DefinesDifficultySettingsTechnologyDifficulty Enum value type for technology_difficulty

---@class direction
---@field east DefinesDirection
---@field north DefinesDirection
---@field northeast DefinesDirection
---@field northwest DefinesDirection
---@field south DefinesDirection
---@field southeast DefinesDirection
---@field southwest DefinesDirection
---@field west DefinesDirection

---@class DefinesDirection Enum value type for direction

---@class disconnect_reason
---@field afk DefinesDisconnectReason
---@field banned DefinesDisconnectReason
---@field cannot_keep_up DefinesDisconnectReason
---@field desync_limit_reached DefinesDisconnectReason
---@field dropped DefinesDisconnectReason
---@field kicked DefinesDisconnectReason
---@field kicked_and_deleted DefinesDisconnectReason
---@field quit DefinesDisconnectReason
---@field reconnect DefinesDisconnectReason
---@field switching_servers DefinesDisconnectReason
---@field wrong_input DefinesDisconnectReason

---@class DefinesDisconnectReason Enum value type for disconnect_reason

---@class distraction
---@field by_anything DefinesDistraction Attack closer enemy entities, including entities "built" by player (belts, inserters, chests).
---@field by_damage DefinesDistraction Attack when attacked.
---@field by_enemy DefinesDistraction Attack closer enemy entities with force.
---@field none DefinesDistraction Perform command even if someone attacks the unit.

---@class DefinesDistraction Enum value type for distraction

---@class entity_status
---@field cant_divide_segments DefinesEntityStatus Used by rail signals.
---@field charging DefinesEntityStatus Used by accumulators.
---@field closed_by_circuit_network DefinesEntityStatus
---@field disabled DefinesEntityStatus Used by constant combinators: Combinator is turned off via switch in GUI.
---@field disabled_by_control_behavior DefinesEntityStatus
---@field disabled_by_script DefinesEntityStatus
---@field discharging DefinesEntityStatus Used by accumulators.
---@field fluid_ingredient_shortage DefinesEntityStatus Used by crafting machines.
---@field full_output DefinesEntityStatus Used by crafting machines, boilers, burner energy sources and reactors: Reactor/burner has full burnt result inventory, boiler has full output fluidbox.
---@field fully_charged DefinesEntityStatus Used by accumulators.
---@field item_ingredient_shortage DefinesEntityStatus Used by crafting machines.
---@field launching_rocket DefinesEntityStatus Used by the rocket silo.
---@field low_input_fluid DefinesEntityStatus Used by boilers and fluid turrets: Boiler still has some fluid but is about to run out.
---@field low_power DefinesEntityStatus
---@field low_temperature DefinesEntityStatus Used by heat energy sources.
---@field marked_for_deconstruction DefinesEntityStatus
---@field missing_required_fluid DefinesEntityStatus Used by mining drills when the mining fluid is missing.
---@field missing_science_packs DefinesEntityStatus Used by labs.
---@field networks_connected DefinesEntityStatus Used by power switches.
---@field networks_disconnected DefinesEntityStatus Used by power switches.
---@field no_ammo DefinesEntityStatus Used by ammo turrets.
---@field no_fuel DefinesEntityStatus
---@field no_ingredients DefinesEntityStatus Used by furnaces.
---@field no_input_fluid DefinesEntityStatus Used by boilers, fluid turrets and fluid energy sources: Boiler has no fluid to work with.
---@field no_minable_resources DefinesEntityStatus Used by mining drills.
---@field no_modules_to_transmit DefinesEntityStatus Used by beacons.
---@field no_power DefinesEntityStatus
---@field no_recipe DefinesEntityStatus Used by assembling machines.
---@field no_research_in_progress DefinesEntityStatus Used by labs.
---@field normal DefinesEntityStatus
---@field not_connected_to_rail DefinesEntityStatus Used by rail signals.
---@field not_plugged_in_electric_network DefinesEntityStatus Used by generators and solar panels.
---@field opened_by_circuit_network DefinesEntityStatus
---@field out_of_logistic_network DefinesEntityStatus Used by logistic containers.
---@field preparing_rocket_for_launch DefinesEntityStatus Used by the rocket silo.
---@field recharging_after_power_outage DefinesEntityStatus Used by roboports.
---@field turned_off_during_daytime DefinesEntityStatus Used by lamps.
---@field waiting_for_source_items DefinesEntityStatus Used by inserters.
---@field waiting_for_space_in_destination DefinesEntityStatus Used by inserters and mining drills.
---@field waiting_for_target_to_be_built DefinesEntityStatus Used by inserters targeting entity ghosts.
---@field waiting_for_train DefinesEntityStatus Used by inserters targeting rails.
---@field waiting_to_launch_rocket DefinesEntityStatus Used by the rocket silo.
---@field working DefinesEntityStatus

---@class DefinesEntityStatus Enum value type for entity_status

---@class events See the [events page](events.html) for more info on what events contain and when they get raised.
---@field on_ai_command_completed DefinesEvents
---@field on_area_cloned DefinesEvents
---@field on_biter_base_built DefinesEvents
---@field on_brush_cloned DefinesEvents
---@field on_build_base_arrived DefinesEvents
---@field on_built_entity DefinesEvents
---@field on_cancelled_deconstruction DefinesEvents
---@field on_cancelled_upgrade DefinesEvents
---@field on_character_corpse_expired DefinesEvents
---@field on_chart_tag_added DefinesEvents
---@field on_chart_tag_modified DefinesEvents
---@field on_chart_tag_removed DefinesEvents
---@field on_chunk_charted DefinesEvents
---@field on_chunk_deleted DefinesEvents
---@field on_chunk_generated DefinesEvents
---@field on_combat_robot_expired DefinesEvents
---@field on_console_chat DefinesEvents
---@field on_console_command DefinesEvents
---@field on_cutscene_cancelled DefinesEvents
---@field on_cutscene_waypoint_reached DefinesEvents
---@field on_difficulty_settings_changed DefinesEvents
---@field on_entity_cloned DefinesEvents
---@field on_entity_damaged DefinesEvents
---@field on_entity_destroyed DefinesEvents
---@field on_entity_died DefinesEvents
---@field on_entity_logistic_slot_changed DefinesEvents
---@field on_entity_renamed DefinesEvents
---@field on_entity_settings_pasted DefinesEvents
---@field on_entity_spawned DefinesEvents
---@field on_equipment_inserted DefinesEvents
---@field on_equipment_removed DefinesEvents
---@field on_force_cease_fire_changed DefinesEvents
---@field on_force_created DefinesEvents
---@field on_force_friends_changed DefinesEvents
---@field on_force_reset DefinesEvents
---@field on_forces_merged DefinesEvents
---@field on_forces_merging DefinesEvents
---@field on_game_created_from_scenario DefinesEvents
---@field on_gui_checked_state_changed DefinesEvents
---@field on_gui_click DefinesEvents
---@field on_gui_closed DefinesEvents
---@field on_gui_confirmed DefinesEvents
---@field on_gui_elem_changed DefinesEvents
---@field on_gui_location_changed DefinesEvents
---@field on_gui_opened DefinesEvents
---@field on_gui_selected_tab_changed DefinesEvents
---@field on_gui_selection_state_changed DefinesEvents
---@field on_gui_switch_state_changed DefinesEvents
---@field on_gui_text_changed DefinesEvents
---@field on_gui_value_changed DefinesEvents
---@field on_land_mine_armed DefinesEvents
---@field on_lua_shortcut DefinesEvents
---@field on_marked_for_deconstruction DefinesEvents
---@field on_marked_for_upgrade DefinesEvents
---@field on_market_item_purchased DefinesEvents
---@field on_mod_item_opened DefinesEvents
---@field on_permission_group_added DefinesEvents
---@field on_permission_group_deleted DefinesEvents
---@field on_permission_group_edited DefinesEvents
---@field on_permission_string_imported DefinesEvents
---@field on_picked_up_item DefinesEvents
---@field on_player_alt_selected_area DefinesEvents
---@field on_player_ammo_inventory_changed DefinesEvents
---@field on_player_armor_inventory_changed DefinesEvents
---@field on_player_banned DefinesEvents
---@field on_player_built_tile DefinesEvents
---@field on_player_cancelled_crafting DefinesEvents
---@field on_player_changed_force DefinesEvents
---@field on_player_changed_position DefinesEvents
---@field on_player_changed_surface DefinesEvents
---@field on_player_cheat_mode_disabled DefinesEvents
---@field on_player_cheat_mode_enabled DefinesEvents
---@field on_player_clicked_gps_tag DefinesEvents
---@field on_player_configured_blueprint DefinesEvents
---@field on_player_configured_spider_remote DefinesEvents
---@field on_player_crafted_item DefinesEvents
---@field on_player_created DefinesEvents
---@field on_player_cursor_stack_changed DefinesEvents
---@field on_player_deconstructed_area DefinesEvents
---@field on_player_demoted DefinesEvents
---@field on_player_died DefinesEvents
---@field on_player_display_resolution_changed DefinesEvents
---@field on_player_display_scale_changed DefinesEvents
---@field on_player_driving_changed_state DefinesEvents
---@field on_player_dropped_item DefinesEvents
---@field on_player_fast_transferred DefinesEvents
---@field on_player_flushed_fluid DefinesEvents
---@field on_player_gun_inventory_changed DefinesEvents
---@field on_player_joined_game DefinesEvents
---@field on_player_kicked DefinesEvents
---@field on_player_left_game DefinesEvents
---@field on_player_main_inventory_changed DefinesEvents
---@field on_player_mined_entity DefinesEvents
---@field on_player_mined_item DefinesEvents
---@field on_player_mined_tile DefinesEvents
---@field on_player_muted DefinesEvents
---@field on_player_pipette DefinesEvents
---@field on_player_placed_equipment DefinesEvents
---@field on_player_promoted DefinesEvents
---@field on_player_removed DefinesEvents
---@field on_player_removed_equipment DefinesEvents
---@field on_player_repaired_entity DefinesEvents
---@field on_player_respawned DefinesEvents
---@field on_player_rotated_entity DefinesEvents
---@field on_player_selected_area DefinesEvents
---@field on_player_set_quick_bar_slot DefinesEvents
---@field on_player_setup_blueprint DefinesEvents
---@field on_player_toggled_alt_mode DefinesEvents
---@field on_player_toggled_map_editor DefinesEvents
---@field on_player_trash_inventory_changed DefinesEvents
---@field on_player_unbanned DefinesEvents
---@field on_player_unmuted DefinesEvents
---@field on_player_used_capsule DefinesEvents
---@field on_player_used_spider_remote DefinesEvents
---@field on_post_entity_died DefinesEvents
---@field on_pre_build DefinesEvents
---@field on_pre_chunk_deleted DefinesEvents
---@field on_pre_entity_settings_pasted DefinesEvents
---@field on_pre_ghost_deconstructed DefinesEvents
---@field on_pre_permission_group_deleted DefinesEvents
---@field on_pre_permission_string_imported DefinesEvents
---@field on_pre_player_crafted_item DefinesEvents
---@field on_pre_player_died DefinesEvents
---@field on_pre_player_left_game DefinesEvents
---@field on_pre_player_mined_item DefinesEvents
---@field on_pre_player_removed DefinesEvents
---@field on_pre_player_toggled_map_editor DefinesEvents
---@field on_pre_robot_exploded_cliff DefinesEvents
---@field on_pre_script_inventory_resized DefinesEvents
---@field on_pre_surface_cleared DefinesEvents
---@field on_pre_surface_deleted DefinesEvents
---@field on_research_finished DefinesEvents
---@field on_research_reversed DefinesEvents
---@field on_research_started DefinesEvents
---@field on_resource_depleted DefinesEvents
---@field on_robot_built_entity DefinesEvents
---@field on_robot_built_tile DefinesEvents
---@field on_robot_exploded_cliff DefinesEvents
---@field on_robot_mined DefinesEvents
---@field on_robot_mined_entity DefinesEvents
---@field on_robot_mined_tile DefinesEvents
---@field on_robot_pre_mined DefinesEvents
---@field on_rocket_launch_ordered DefinesEvents
---@field on_rocket_launched DefinesEvents
---@field on_runtime_mod_setting_changed DefinesEvents
---@field on_script_inventory_resized DefinesEvents
---@field on_script_path_request_finished DefinesEvents
---@field on_script_trigger_effect DefinesEvents
---@field on_sector_scanned DefinesEvents
---@field on_selected_entity_changed DefinesEvents
---@field on_spider_command_completed DefinesEvents
---@field on_string_translated DefinesEvents
---@field on_surface_cleared DefinesEvents
---@field on_surface_created DefinesEvents
---@field on_surface_deleted DefinesEvents
---@field on_surface_imported DefinesEvents
---@field on_surface_renamed DefinesEvents
---@field on_technology_effects_reset DefinesEvents
---@field on_tick DefinesEvents
---@field on_train_changed_state DefinesEvents
---@field on_train_created DefinesEvents
---@field on_train_schedule_changed DefinesEvents
---@field on_trigger_created_entity DefinesEvents
---@field on_trigger_fired_artillery DefinesEvents
---@field on_unit_added_to_group DefinesEvents
---@field on_unit_group_created DefinesEvents
---@field on_unit_group_finished_gathering DefinesEvents
---@field on_unit_removed_from_group DefinesEvents
---@field on_worker_robot_expired DefinesEvents
---@field script_raised_built DefinesEvents
---@field script_raised_destroy DefinesEvents
---@field script_raised_revive DefinesEvents
---@field script_raised_set_tiles DefinesEvents

---@class DefinesEvents Enum value type for events

---@class flow_precision_index
---@field fifty_hours DefinesFlowPrecisionIndex
---@field five_seconds DefinesFlowPrecisionIndex
---@field one_hour DefinesFlowPrecisionIndex
---@field one_minute DefinesFlowPrecisionIndex
---@field one_thousand_hours DefinesFlowPrecisionIndex
---@field ten_hours DefinesFlowPrecisionIndex
---@field ten_minutes DefinesFlowPrecisionIndex
---@field two_hundred_fifty_hours DefinesFlowPrecisionIndex

---@class DefinesFlowPrecisionIndex Enum value type for flow_precision_index

---@class group_state
---@field attacking_distraction DefinesGroupState
---@field attacking_target DefinesGroupState
---@field finished DefinesGroupState
---@field gathering DefinesGroupState
---@field moving DefinesGroupState
---@field pathfinding DefinesGroupState
---@field wander_in_group DefinesGroupState

---@class DefinesGroupState Enum value type for group_state

---@class gui_type
---@field achievement DefinesGuiType
---@field blueprint_library DefinesGuiType
---@field bonus DefinesGuiType
---@field controller DefinesGuiType
---@field custom DefinesGuiType
---@field entity DefinesGuiType
---@field equipment DefinesGuiType
---@field item DefinesGuiType
---@field logistic DefinesGuiType
---@field none DefinesGuiType
---@field other_player DefinesGuiType
---@field permissions DefinesGuiType
---@field player_management DefinesGuiType
---@field production DefinesGuiType
---@field research DefinesGuiType
---@field server_management DefinesGuiType
---@field tile DefinesGuiType
---@field trains DefinesGuiType
---@field tutorials DefinesGuiType

---@class DefinesGuiType Enum value type for gui_type

---@class input_action
---@field activate_copy DefinesInputAction
---@field activate_cut DefinesInputAction
---@field activate_paste DefinesInputAction
---@field add_permission_group DefinesInputAction
---@field add_train_station DefinesInputAction
---@field admin_action DefinesInputAction
---@field alt_select_area DefinesInputAction
---@field alt_select_blueprint_entities DefinesInputAction
---@field alternative_copy DefinesInputAction
---@field begin_mining DefinesInputAction
---@field begin_mining_terrain DefinesInputAction
---@field build DefinesInputAction
---@field build_rail DefinesInputAction
---@field build_terrain DefinesInputAction
---@field cancel_craft DefinesInputAction
---@field cancel_deconstruct DefinesInputAction
---@field cancel_new_blueprint DefinesInputAction
---@field cancel_research DefinesInputAction
---@field cancel_upgrade DefinesInputAction
---@field change_active_character_tab DefinesInputAction
---@field change_active_item_group_for_crafting DefinesInputAction
---@field change_active_item_group_for_filters DefinesInputAction
---@field change_active_quick_bar DefinesInputAction
---@field change_arithmetic_combinator_parameters DefinesInputAction
---@field change_decider_combinator_parameters DefinesInputAction
---@field change_entity_label DefinesInputAction
---@field change_item_description DefinesInputAction
---@field change_item_label DefinesInputAction
---@field change_multiplayer_config DefinesInputAction
---@field change_picking_state DefinesInputAction
---@field change_programmable_speaker_alert_parameters DefinesInputAction
---@field change_programmable_speaker_circuit_parameters DefinesInputAction
---@field change_programmable_speaker_parameters DefinesInputAction
---@field change_riding_state DefinesInputAction
---@field change_shooting_state DefinesInputAction
---@field change_train_stop_station DefinesInputAction
---@field change_train_wait_condition DefinesInputAction
---@field change_train_wait_condition_data DefinesInputAction
---@field clear_cursor DefinesInputAction
---@field connect_rolling_stock DefinesInputAction
---@field copy DefinesInputAction
---@field copy_entity_settings DefinesInputAction
---@field copy_opened_blueprint DefinesInputAction
---@field copy_opened_item DefinesInputAction
---@field craft DefinesInputAction
---@field cursor_split DefinesInputAction
---@field cursor_transfer DefinesInputAction
---@field custom_input DefinesInputAction
---@field cycle_blueprint_book_backwards DefinesInputAction
---@field cycle_blueprint_book_forwards DefinesInputAction
---@field deconstruct DefinesInputAction
---@field delete_blueprint_library DefinesInputAction
---@field delete_blueprint_record DefinesInputAction
---@field delete_custom_tag DefinesInputAction
---@field delete_permission_group DefinesInputAction
---@field destroy_item DefinesInputAction
---@field destroy_opened_item DefinesInputAction
---@field disconnect_rolling_stock DefinesInputAction
---@field drag_train_schedule DefinesInputAction
---@field drag_train_wait_condition DefinesInputAction
---@field drop_blueprint_record DefinesInputAction
---@field drop_item DefinesInputAction
---@field edit_blueprint_tool_preview DefinesInputAction
---@field edit_custom_tag DefinesInputAction
---@field edit_permission_group DefinesInputAction
---@field export_blueprint DefinesInputAction
---@field fast_entity_split DefinesInputAction
---@field fast_entity_transfer DefinesInputAction
---@field flush_opened_entity_fluid DefinesInputAction
---@field flush_opened_entity_specific_fluid DefinesInputAction
---@field go_to_train_station DefinesInputAction
---@field grab_blueprint_record DefinesInputAction
---@field gui_checked_state_changed DefinesInputAction
---@field gui_click DefinesInputAction
---@field gui_confirmed DefinesInputAction
---@field gui_elem_changed DefinesInputAction
---@field gui_location_changed DefinesInputAction
---@field gui_selected_tab_changed DefinesInputAction
---@field gui_selection_state_changed DefinesInputAction
---@field gui_switch_state_changed DefinesInputAction
---@field gui_text_changed DefinesInputAction
---@field gui_value_changed DefinesInputAction
---@field import_blueprint DefinesInputAction
---@field import_blueprint_string DefinesInputAction
---@field import_blueprints_filtered DefinesInputAction
---@field import_permissions_string DefinesInputAction
---@field inventory_split DefinesInputAction
---@field inventory_transfer DefinesInputAction
---@field launch_rocket DefinesInputAction
---@field lua_shortcut DefinesInputAction
---@field map_editor_action DefinesInputAction
---@field market_offer DefinesInputAction
---@field mod_settings_changed DefinesInputAction
---@field open_achievements_gui DefinesInputAction
---@field open_blueprint_library_gui DefinesInputAction
---@field open_blueprint_record DefinesInputAction
---@field open_bonus_gui DefinesInputAction
---@field open_character_gui DefinesInputAction
---@field open_current_vehicle_gui DefinesInputAction
---@field open_equipment DefinesInputAction
---@field open_gui DefinesInputAction
---@field open_item DefinesInputAction
---@field open_logistic_gui DefinesInputAction
---@field open_mod_item DefinesInputAction
---@field open_parent_of_opened_item DefinesInputAction
---@field open_production_gui DefinesInputAction
---@field open_technology_gui DefinesInputAction
---@field open_tips_and_tricks_gui DefinesInputAction
---@field open_train_gui DefinesInputAction
---@field open_train_station_gui DefinesInputAction
---@field open_trains_gui DefinesInputAction
---@field paste_entity_settings DefinesInputAction
---@field place_equipment DefinesInputAction
---@field quick_bar_pick_slot DefinesInputAction
---@field quick_bar_set_selected_page DefinesInputAction
---@field quick_bar_set_slot DefinesInputAction
---@field reassign_blueprint DefinesInputAction
---@field remove_cables DefinesInputAction
---@field remove_train_station DefinesInputAction
---@field reset_assembling_machine DefinesInputAction
---@field reset_item DefinesInputAction
---@field rotate_entity DefinesInputAction
---@field select_area DefinesInputAction
---@field select_blueprint_entities DefinesInputAction
---@field select_entity_slot DefinesInputAction
---@field select_item DefinesInputAction
---@field select_mapper_slot DefinesInputAction
---@field select_next_valid_gun DefinesInputAction
---@field select_tile_slot DefinesInputAction
---@field send_spidertron DefinesInputAction
---@field set_auto_launch_rocket DefinesInputAction
---@field set_autosort_inventory DefinesInputAction
---@field set_behavior_mode DefinesInputAction
---@field set_car_weapons_control DefinesInputAction
---@field set_circuit_condition DefinesInputAction
---@field set_circuit_mode_of_operation DefinesInputAction
---@field set_controller_logistic_trash_filter_item DefinesInputAction
---@field set_deconstruction_item_tile_selection_mode DefinesInputAction
---@field set_deconstruction_item_trees_and_rocks_only DefinesInputAction
---@field set_entity_color DefinesInputAction
---@field set_entity_energy_property DefinesInputAction
---@field set_entity_logistic_trash_filter_item DefinesInputAction
---@field set_filter DefinesInputAction
---@field set_flat_controller_gui DefinesInputAction
---@field set_heat_interface_mode DefinesInputAction
---@field set_heat_interface_temperature DefinesInputAction
---@field set_infinity_container_filter_item DefinesInputAction
---@field set_infinity_container_remove_unfiltered_items DefinesInputAction
---@field set_infinity_pipe_filter DefinesInputAction
---@field set_inserter_max_stack_size DefinesInputAction
---@field set_inventory_bar DefinesInputAction
---@field set_linked_container_link_i_d DefinesInputAction
---@field set_logistic_filter_item DefinesInputAction
---@field set_logistic_filter_signal DefinesInputAction
---@field set_player_color DefinesInputAction
---@field set_recipe_notifications DefinesInputAction
---@field set_request_from_buffers DefinesInputAction
---@field set_research_finished_stops_game DefinesInputAction
---@field set_signal DefinesInputAction
---@field set_splitter_priority DefinesInputAction
---@field set_train_stopped DefinesInputAction
---@field set_trains_limit DefinesInputAction
---@field set_vehicle_automatic_targeting_parameters DefinesInputAction
---@field setup_assembling_machine DefinesInputAction
---@field setup_blueprint DefinesInputAction
---@field setup_single_blueprint_record DefinesInputAction
---@field smart_pipette DefinesInputAction
---@field spawn_item DefinesInputAction
---@field stack_split DefinesInputAction
---@field stack_transfer DefinesInputAction
---@field start_repair DefinesInputAction
---@field start_research DefinesInputAction
---@field start_walking DefinesInputAction
---@field stop_building_by_moving DefinesInputAction
---@field switch_connect_to_logistic_network DefinesInputAction
---@field switch_constant_combinator_state DefinesInputAction
---@field switch_inserter_filter_mode_state DefinesInputAction
---@field switch_power_switch_state DefinesInputAction
---@field switch_to_rename_stop_gui DefinesInputAction
---@field take_equipment DefinesInputAction
---@field toggle_deconstruction_item_entity_filter_mode DefinesInputAction
---@field toggle_deconstruction_item_tile_filter_mode DefinesInputAction
---@field toggle_driving DefinesInputAction
---@field toggle_enable_vehicle_logistics_while_moving DefinesInputAction
---@field toggle_entity_logistic_requests DefinesInputAction
---@field toggle_equipment_movement_bonus DefinesInputAction
---@field toggle_map_editor DefinesInputAction
---@field toggle_personal_logistic_requests DefinesInputAction
---@field toggle_personal_roboport DefinesInputAction
---@field toggle_show_entity_info DefinesInputAction
---@field translate_string DefinesInputAction
---@field undo DefinesInputAction
---@field upgrade DefinesInputAction
---@field upgrade_opened_blueprint_by_item DefinesInputAction
---@field upgrade_opened_blueprint_by_record DefinesInputAction
---@field use_artillery_remote DefinesInputAction
---@field use_item DefinesInputAction
---@field wire_dragging DefinesInputAction
---@field write_to_console DefinesInputAction

---@class DefinesInputAction Enum value type for input_action

---@class inventory
---@field artillery_turret_ammo DefinesInventory
---@field artillery_wagon_ammo DefinesInventory
---@field assembling_machine_input DefinesInventory
---@field assembling_machine_modules DefinesInventory
---@field assembling_machine_output DefinesInventory
---@field beacon_modules DefinesInventory
---@field burnt_result DefinesInventory
---@field car_ammo DefinesInventory
---@field car_trunk DefinesInventory
---@field cargo_wagon DefinesInventory
---@field character_ammo DefinesInventory
---@field character_armor DefinesInventory
---@field character_corpse DefinesInventory
---@field character_guns DefinesInventory
---@field character_main DefinesInventory
---@field character_trash DefinesInventory
---@field character_vehicle DefinesInventory
---@field chest DefinesInventory
---@field editor_ammo DefinesInventory
---@field editor_armor DefinesInventory
---@field editor_guns DefinesInventory
---@field editor_main DefinesInventory
---@field fuel DefinesInventory
---@field furnace_modules DefinesInventory
---@field furnace_result DefinesInventory
---@field furnace_source DefinesInventory
---@field god_main DefinesInventory
---@field item_main DefinesInventory
---@field lab_input DefinesInventory
---@field lab_modules DefinesInventory
---@field mining_drill_modules DefinesInventory
---@field roboport_material DefinesInventory
---@field roboport_robot DefinesInventory
---@field robot_cargo DefinesInventory
---@field robot_repair DefinesInventory
---@field rocket DefinesInventory
---@field rocket_silo_result DefinesInventory
---@field rocket_silo_rocket DefinesInventory
---@field spider_ammo DefinesInventory
---@field spider_trash DefinesInventory
---@field spider_trunk DefinesInventory
---@field turret_ammo DefinesInventory

---@class DefinesInventory Enum value type for inventory

---@class logistic_member_index
---@field character_provider DefinesLogisticMemberIndex
---@field character_requester DefinesLogisticMemberIndex
---@field character_storage DefinesLogisticMemberIndex
---@field generic_on_off_behavior DefinesLogisticMemberIndex
---@field logistic_container DefinesLogisticMemberIndex
---@field vehicle_storage DefinesLogisticMemberIndex

---@class DefinesLogisticMemberIndex Enum value type for logistic_member_index

---@class logistic_mode
---@field active_provider DefinesLogisticMode
---@field buffer DefinesLogisticMode
---@field none DefinesLogisticMode
---@field passive_provider DefinesLogisticMode
---@field requester DefinesLogisticMode
---@field storage DefinesLogisticMode

---@class DefinesLogisticMode Enum value type for logistic_mode

---@class mouse_button_type
---@field left DefinesMouseButtonType
---@field middle DefinesMouseButtonType
---@field none DefinesMouseButtonType
---@field right DefinesMouseButtonType

---@class DefinesMouseButtonType Enum value type for mouse_button_type

---@class rail_connection_direction
---@field left DefinesRailConnectionDirection
---@field none DefinesRailConnectionDirection
---@field right DefinesRailConnectionDirection
---@field straight DefinesRailConnectionDirection

---@class DefinesRailConnectionDirection Enum value type for rail_connection_direction

---@class rail_direction
---@field back DefinesRailDirection
---@field front DefinesRailDirection

---@class DefinesRailDirection Enum value type for rail_direction

---@class relative_gui_position
---@field bottom DefinesRelativeGuiPosition
---@field left DefinesRelativeGuiPosition
---@field right DefinesRelativeGuiPosition
---@field top DefinesRelativeGuiPosition

---@class DefinesRelativeGuiPosition Enum value type for relative_gui_position

---@class relative_gui_type
---@field accumulator_gui DefinesRelativeGuiType
---@field achievement_gui DefinesRelativeGuiType
---@field additional_entity_info_gui DefinesRelativeGuiType
---@field admin_gui DefinesRelativeGuiType
---@field arithmetic_combinator_gui DefinesRelativeGuiType
---@field armor_gui DefinesRelativeGuiType
---@field assembling_machine_gui DefinesRelativeGuiType
---@field assembling_machine_select_recipe_gui DefinesRelativeGuiType
---@field beacon_gui DefinesRelativeGuiType
---@field blueprint_book_gui DefinesRelativeGuiType
---@field blueprint_library_gui DefinesRelativeGuiType
---@field blueprint_setup_gui DefinesRelativeGuiType
---@field bonus_gui DefinesRelativeGuiType
---@field burner_equipment_gui DefinesRelativeGuiType
---@field car_gui DefinesRelativeGuiType
---@field constant_combinator_gui DefinesRelativeGuiType
---@field container_gui DefinesRelativeGuiType
---@field controller_gui DefinesRelativeGuiType
---@field decider_combinator_gui DefinesRelativeGuiType
---@field deconstruction_item_gui DefinesRelativeGuiType
---@field electric_energy_interface_gui DefinesRelativeGuiType
---@field electric_network_gui DefinesRelativeGuiType
---@field entity_variations_gui DefinesRelativeGuiType
---@field entity_with_energy_source_gui DefinesRelativeGuiType
---@field equipment_grid_gui DefinesRelativeGuiType
---@field furnace_gui DefinesRelativeGuiType
---@field generic_on_off_entity_gui DefinesRelativeGuiType
---@field heat_interface_gui DefinesRelativeGuiType
---@field infinity_pipe_gui DefinesRelativeGuiType
---@field inserter_gui DefinesRelativeGuiType
---@field item_with_inventory_gui DefinesRelativeGuiType
---@field lab_gui DefinesRelativeGuiType
---@field lamp_gui DefinesRelativeGuiType
---@field linked_container_gui DefinesRelativeGuiType
---@field loader_gui DefinesRelativeGuiType
---@field logistic_gui DefinesRelativeGuiType
---@field market_gui DefinesRelativeGuiType
---@field mining_drill_gui DefinesRelativeGuiType
---@field other_player_gui DefinesRelativeGuiType
---@field permissions_gui DefinesRelativeGuiType
---@field pipe_gui DefinesRelativeGuiType
---@field power_switch_gui DefinesRelativeGuiType
---@field production_gui DefinesRelativeGuiType
---@field programmable_speaker_gui DefinesRelativeGuiType
---@field rail_chain_signal_gui DefinesRelativeGuiType
---@field rail_signal_gui DefinesRelativeGuiType
---@field reactor_gui DefinesRelativeGuiType
---@field rename_stop_gui DefinesRelativeGuiType
---@field resource_entity_gui DefinesRelativeGuiType
---@field roboport_gui DefinesRelativeGuiType
---@field rocket_silo_gui DefinesRelativeGuiType
---@field server_config_gui DefinesRelativeGuiType
---@field spider_vehicle_gui DefinesRelativeGuiType
---@field splitter_gui DefinesRelativeGuiType
---@field standalone_character_gui DefinesRelativeGuiType
---@field storage_tank_gui DefinesRelativeGuiType
---@field tile_variations_gui DefinesRelativeGuiType
---@field train_gui DefinesRelativeGuiType
---@field train_stop_gui DefinesRelativeGuiType
---@field trains_gui DefinesRelativeGuiType
---@field transport_belt_gui DefinesRelativeGuiType
---@field upgrade_item_gui DefinesRelativeGuiType
---@field wall_gui DefinesRelativeGuiType

---@class DefinesRelativeGuiType Enum value type for relative_gui_type

---@class render_mode
---@field chart DefinesRenderMode
---@field chart_zoomed_in DefinesRenderMode
---@field game DefinesRenderMode

---@class DefinesRenderMode Enum value type for render_mode

---@class rich_text_setting
---@field disabled DefinesRichTextSetting
---@field enabled DefinesRichTextSetting
---@field highlight DefinesRichTextSetting

---@class DefinesRichTextSetting Enum value type for rich_text_setting

---@class riding
---@field acceleration acceleration
---@field direction direction

---@class acceleration
---@field accelerating DefinesRidingAcceleration
---@field braking DefinesRidingAcceleration
---@field nothing DefinesRidingAcceleration
---@field reversing DefinesRidingAcceleration

---@class DefinesRidingAcceleration Enum value type for acceleration

---@class direction
---@field left DefinesRidingDirection
---@field right DefinesRidingDirection
---@field straight DefinesRidingDirection

---@class DefinesRidingDirection Enum value type for direction

---@class shooting
---@field not_shooting DefinesShooting
---@field shooting_enemies DefinesShooting
---@field shooting_selected DefinesShooting

---@class DefinesShooting Enum value type for shooting

---@class signal_state State of an ordinary rail signal.
---@field closed DefinesSignalState Red.
---@field open DefinesSignalState Green.
---@field reserved DefinesSignalState Orange.
---@field reserved_by_circuit_network DefinesSignalState Red - From circuit network.

---@class DefinesSignalState Enum value type for signal_state

---@class train_state
---@field arrive_signal DefinesTrainState Braking before a rail signal.
---@field arrive_station DefinesTrainState Braking before a station.
---@field destination_full DefinesTrainState Same as no_path but all candidate train stops are full
---@field manual_control DefinesTrainState Can move if user explicitly sits in and rides the train.
---@field manual_control_stop DefinesTrainState Switched to manual control and has to stop.
---@field no_path DefinesTrainState Has no path and is stopped.
---@field no_schedule DefinesTrainState Doesn't have anywhere to go.
---@field on_the_path DefinesTrainState Normal state -- following the path.
---@field path_lost DefinesTrainState Had path and lost it -- must stop.
---@field wait_signal DefinesTrainState Waiting at a signal.
---@field wait_station DefinesTrainState Waiting at a station.

---@class DefinesTrainState Enum value type for train_state

---@class transport_line
---@field left_line DefinesTransportLine
---@field left_split_line DefinesTransportLine
---@field left_underground_line DefinesTransportLine
---@field right_line DefinesTransportLine
---@field right_split_line DefinesTransportLine
---@field right_underground_line DefinesTransportLine
---@field secondary_left_line DefinesTransportLine
---@field secondary_left_split_line DefinesTransportLine
---@field secondary_right_line DefinesTransportLine
---@field secondary_right_split_line DefinesTransportLine

---@class DefinesTransportLine Enum value type for transport_line

---@class wire_connection_id
---@field electric_pole DefinesWireConnectionId
---@field power_switch_left DefinesWireConnectionId
---@field power_switch_right DefinesWireConnectionId

---@class DefinesWireConnectionId Enum value type for wire_connection_id

---@class wire_type
---@field copper DefinesWireType
---@field green DefinesWireType
---@field red DefinesWireType

---@class DefinesWireType Enum value type for wire_type
