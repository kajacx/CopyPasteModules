---@alias LocalisedString any Localised strings are a way to support translation of in-game text. It is an array where the first element is the key and the remaining elements are parameters that will be substituted for placeholders in the template designated by the key. The key identifies the string template. For example, `"gui-alert-tooltip.attack"` (for the template `"__1__ objects are being damaged"`; see the file `data/core/locale/en.cfg`). The template can contain placeholders such as `__1__` or `__2__`. These will be replaced by the respective parameter in the LocalisedString. The parameters themselves can be other localised strings, which will be processed recursively in the same fashion. Localised strings can not be recursed deeper than 20 levels and can not have more than 20 parameters. As a special case, when the key is just the empty string, all the parameters will be concatenated (after processing, if any are localised strings). If there is only one parameter, it will be used as is. Furthermore, when an API function expects a localised string, it will also accept a regular string (i.e. not a table) which will not be translated, as well as a number or boolean, which will be converted to their textual representation.

---@class DisplayResolution
---@field width uint
---@field height uint

---@class LogisticParameters
---@field name string The item. `nil` clears the filter.
---@field min uint
---@field max uint

---@alias RealOrientation any The smooth orientation. It is a [float](float) in the range `[0, 1)` that covers a full circle, starting at the top and going clockwise. This means a value of `0` indicates "north", a value of `0.5` indicates "south". For example then, a value of `0.625` would indicate "south-west", and a value of `0.875` would indicate "north-west".

---@class Position Coordinates of a tile in a map. Positions may be specified either as a dictionary with `x`, `y` as keys, or simply as an array with two elements.
---@field x int
---@field y int

---@class MapPosition Coordinates of an entity on a map. This uses the same format as [Position](Position), meaning it can be specified either with or without explicit keys.
---@field x double
---@field y double

---@class ChunkPosition Coordinates of a chunk in a [LuaSurface](LuaSurface) where each integer `x`/`y` represents a different chunk. This uses the same format as [Position](Position), meaning it can be specified either with or without explicit keys. A [Position](Position) can be translated to a ChunkPosition by dividing the `x`/`y` values by 32.
---@field x int
---@field y int

---@class TilePosition Coordinates of a tile in a chunk on a [LuaSurface](LuaSurface) where each integer `x`/`y` represents a different tile. This uses the same format as [Position](Position) except it rounds any `x`/`y` down to whole numbers. It can be specified either with or without explicit keys.
---@field x int
---@field y int

---@class GuiLocation Screen coordinates of a GUI element in a [LuaGui](LuaGui). This uses the same format as [Position](Position) except it rounds any `x`/`y` down to whole numbers. It can be specified either with or without explicit keys.
---@field x int
---@field y int

---@class ChunkPositionAndArea A [ChunkPosition](ChunkPosition) with an added bounding box for the area of the chunk.
---@field x int
---@field y int
---@field area BoundingBox

---@class EquipmentPoint A table used to define a manual shape for a piece of equipment.
---@field x uint
---@field y uint

---@class GuiAnchor
---@field gui DefinesRelativeGuiType
---@field position DefinesRelativeGuiPosition
---@field type string If provided, only anchors the GUI element when the opened things type matches the type.
---@field name string If provided, only anchors the GUI element when the opened thing matches the name. `name` takes precedence over `names`.
---@field names string[] If provided, only anchors the GUI element when the opened thing matches one of the names. When reading an anchor, `names` is always populated.

---@class TabAndContent
---@field tab LuaGuiElement
---@field content LuaGuiElement

---@class OldTileAndPosition
---@field old_tile LuaTilePrototype
---@field position TilePosition

---@alias Tags any A dictionary of string to the four basic Lua types: `string`, `boolean`, `number`, `table`.

---@class SmokeSource
---@field name string
---@field frequency double
---@field offset double
---@field position Vector
---@field north_position Vector
---@field east_position Vector
---@field south_position Vector
---@field west_position Vector
---@field deviation Position
---@field starting_frame_speed uint16
---@field starting_frame_speed_deviation double
---@field starting_frame uint16
---@field starting_frame_deviation double
---@field slow_down_factor uint8
---@field height float
---@field height_deviation float
---@field starting_vertical_speed float
---@field starting_vertical_speed_deviation float
---@field vertical_speed_slowdown float

---@alias Vector any A vector is a two-element array containing the `x` and `y` components. In some specific cases, the vector is a table with `x` and `y` keys instead, which the documentation will point out.

---@class BoundingBox Two positions, specifying the top-left and bottom-right corner of the box respectively. Like with [Position](Position), the names of the members may be omitted. When read from the game, the third member `orientation` is present if it is non-zero, however it is ignored when provided to the game.
---@field left_top Position
---@field right_bottom Position
---@field orientation RealOrientation

---@class ScriptArea An area defined using the map editor.
---@field area BoundingBox
---@field name string
---@field color Color
---@field id uint

---@class ScriptPosition A position defined using the map editor.
---@field position Position
---@field name string
---@field color Color
---@field id uint

---@class Color Red, green, blue and alpha values, all in range [0, 1] or all in range [0, 255] if any value is > 1. All values here are optional. Color channels default to `0`, the alpha channel defaults to `1`. Similar to [Position](Position), Color allows the short-hand notation of passing an array of exactly 3 or 4 numbers. The game usually expects colors to be in pre-multiplied form (color channels are pre-multiplied by alpha).
---@field r float
---@field g float
---@field b float
---@field a float

---@class ColorModifier Same as [Color](Color), but red, green, blue and alpha values can be any floating point number, without any special handling of the range [1, 255].
---@field r float
---@field g float
---@field b float
---@field a float

---@class CraftingQueueItem
---@field index uint The index of the item in the crafting queue.
---@field recipe string The recipe being crafted.
---@field count uint The amount of items being crafted.

---@class Alert
---@field tick uint The tick this alert was created.
---@field target LuaEntity
---@field prototype LuaEntityPrototype
---@field position Position
---@field icon SignalID The SignalID used for a custom alert. Only present for custom alerts.
---@field message LocalisedString The message for a custom alert. Only present for custom alerts.

---@class ScriptRenderVertexTarget One vertex of a ScriptRenderPolygon.
---@field target Position | LuaEntity
---@field target_offset Vector Only used if `target` is a LuaEntity.

---@class PathfinderWaypoint
---@field position Position The position of the waypoint on its surface.
---@field needs_destroy_to_reach boolean `true` if the path from the previous waypoint to this one goes through an entity that must be destroyed.

---@class CutsceneWaypoint
---@field position Position Position to pan the camera to.
---@field target LuaEntity | LuaUnitGroup Entity or unit group to pan the camera to.
---@field transition_time uint How many ticks it will take to reach this waypoint from the previous one.
---@field time_to_wait uint Time in ticks to wait before moving to the next waypoint.
---@field zoom double Zoom level to be set when the waypoint is reached. When not specified, the previous waypoint's zoom is used.

---@class Decorative
---@field name string The name of the decorative prototype.
---@field position Position
---@field amount uint8

---@class DecorativeResult
---@field position TilePosition
---@field decorative LuaDecorativePrototype
---@field amount uint

---@class ChartTagSpec
---@field position Position
---@field icon SignalID
---@field text string
---@field last_user PlayerIdentification

---@class GameViewSettings Parameters that affect the look and control of the game. Updating any of the member attributes here will immediately take effect in the game engine.
---@field show_controller_gui boolean Show the controller GUI elements. This includes the toolbar, the selected tool slot, the armour slot, and the gun and ammunition slots.
---@field show_minimap boolean Show the chart in the upper right-hand corner of the screen.
---@field show_research_info boolean Show research progress and name in the upper right-hand corner of the screen.
---@field show_entity_info boolean Show overlay icons on entities. Also known as "alt-mode".
---@field show_alert_gui boolean Show the flashing alert icons next to the player's toolbar.
---@field update_entity_selection boolean When `true` (the default), mousing over an entity will select it. Otherwise, moving the mouse won't update entity selection.
---@field show_rail_block_visualisation boolean When `true` (`false` is default), the rails will always show the rail block visualisation.
---@field show_side_menu boolean Shows or hides the buttons row.
---@field show_map_view_options boolean Shows or hides the view options when map is opened.
---@field show_quickbar boolean Shows or hides quickbar of shortcuts.
---@field show_shortcut_bar boolean Shows or hides the shortcut bar.

---@class MapViewSettings What is shown in the map view. If a field is not given, that setting will not be changed.
---@field show-logistic-network boolean
---@field show-electric-network boolean
---@field show-turret-range boolean
---@field show-pollution boolean
---@field show-train-station-names boolean
---@field show-player-names boolean
---@field show-networkless-logistic-members boolean
---@field show-non-standard-map-info boolean

---@class PollutionMapSettings These values are for the time frame of one second (60 ticks).
---@field enabled boolean Whether pollution is enabled at all.
---@field diffusion_ratio double The amount that is diffused to a neighboring chunk (possibly repeated for other directions as well). Defaults to `0.02`.
---@field min_to_diffuse double The amount of PUs that need to be in a chunk for it to start diffusing. Defaults to `15`.
---@field aeging double The amount of pollution eaten by a chunk's tiles as a percentage of 1. Defaults to `1`.
---@field expected_max_per_chunk double Any amount of pollution larger than this value is visualized as this value instead. Defaults to `150`.
---@field min_to_show_per_chunk double Any amount of pollution smaller than this value (but bigger than zero) is visualized as this value instead. Defaults to `50`.
---@field min_pollution_to_damage_trees double Defaults to `60`.
---@field pollution_with_max_forest_damage double Defaults to `150`.
---@field pollution_per_tree_damage double Defaults to `50`.
---@field pollution_restored_per_tree_damage double Defaults to `10`.
---@field max_pollution_to_restore_trees double Defaults to `20`.
---@field enemy_attack_pollution_consumption_modifier double Defaults to `1`.

---@class EnemyEvolutionMapSettings These values represent a percentual increase in evolution. This means a value of `0.1` would increase evolution by 10%.
---@field enabled boolean Whether enemy evolution is enabled at all.
---@field time_factor double The amount evolution naturally progresses by every second. Defaults to `0.000004`.
---@field destroy_factor double The amount evolution progresses for every destroyed spawner. Defaults to `0.002`.
---@field pollution_factor double The amount evolution progresses for every unit of pollution. Defaults to `0.0000009`.

---@class EnemyExpansionMapSettings Candidate chunks are given scores to determine which one of them should be expanded into. This score takes into account various settings noted below. The iteration is over a square region centered around the chunk for which the calculation is done, and includes the central chunk as well. Distances are calculated as [Manhattan distance](https://en.wikipedia.org/wiki/Taxicab_geometry). The pseudocode algorithm to determine a chunk's score is as follows: ``` player = 0 for neighbour in all chunks within enemy_building_influence_radius from chunk: player += number of player buildings on neighbour * building_coefficient * neighbouring_chunk_coefficient^distance(chunk, neighbour) base = 0 for neighbour in all chunk within friendly_base_influence_radius from chunk: base += num of enemy bases on neighbour * other_base_coefficient * neighbouring_base_chunk_coefficient^distance(chunk, neighbour) score(chunk) = 1 / (1 + player + base) ```
---@field enabled boolean Whether enemy expansion is enabled at all.
---@field max_expansion_distance uint Distance in chunks from the furthest base around to prevent expansions from reaching too far into the player's territory. Defaults to `7`.
---@field friendly_base_influence_radius uint Defaults to `2`.
---@field enemy_building_influence_radius uint Defaults to `2`.
---@field building_coefficient double Defaults to `0.1`.
---@field other_base_coefficient double Defaults to `2.0`.
---@field neighbouring_chunk_coefficient double Defaults to `0.5`.
---@field neighbouring_base_chunk_coefficient double Defaults to `0.4`.
---@field max_colliding_tiles_coefficient double A chunk has to have at most this high of a percentage of unbuildable tiles for it to be considered a candidate to avoid chunks full of water as candidates. Defaults to `0.9`, or 90%.
---@field settler_group_min_size uint The minimum size of a biter group that goes to build a new base. This is multiplied by the evolution factor. Defaults to `5`.
---@field settler_group_max_size uint The maximum size of a biter group that goes to build a new base. This is multiplied by the evolution factor. Defaults to `20`.
---@field min_expansion_cooldown uint The minimum time between expansions in ticks. The actual cooldown is adjusted to the current evolution levels. Defaults to `4*3,600=14,400` ticks.
---@field max_expansion_cooldown uint The maximum time between expansions in ticks. The actual cooldown is adjusted to the current evolution levels. Defaults to `60*3,600=216,000` ticks.

---@class UnitGroupMapSettings
---@field min_group_gathering_time uint The minimum amount of time in ticks a group will spend gathering before setting off. The actual time is a random time between the minimum and maximum times. Defaults to `3,600` ticks.
---@field max_group_gathering_time uint The maximum amount of time in ticks a group will spend gathering before setting off. The actual time is a random time between the minimum and maximum times. Defaults to `10*3,600=36,000` ticks.
---@field max_wait_time_for_late_members uint After gathering has finished, the group is allowed to wait this long in ticks for delayed members. New members are not accepted anymore however. Defaults to `2*3,600=7,200` ticks.
---@field min_group_radius double The minimum group radius in tiles. The actual radius is adjusted based on the number of members. Defaults to `5.0`.
---@field max_group_radius double The maximum group radius in tiles. The actual radius is adjusted based on the number of members. Defaults to `30.0`.
---@field max_member_speedup_when_behind double The maximum speed a percentage of its regular speed that a group member can speed up to when catching up with the group. Defaults to `1.4`, or 140%.
---@field max_member_slowdown_when_ahead double The minimum speed a percentage of its regular speed that a group member can slow down to when ahead of the group. Defaults to `0.6`, or 60%.
---@field max_group_slowdown_factor double The minimum speed as a percentage of its maximum speed that a group will slow down to so members that fell behind can catch up. Defaults to `0.3`, or 30%.
---@field max_group_member_fallback_factor double When a member of a group falls back more than this factor times the group radius, the group will slow down to its `max_group_slowdown_factor` speed to let them catch up. Defaults to `3`.
---@field member_disown_distance double When a member of a group falls back more than this factor times the group radius, it will be dropped from the group. Defaults to `10`.
---@field tick_tolerance_when_member_arrives uint
---@field max_gathering_unit_groups uint The maximum number of automatically created unit groups gathering for attack at any time. Defaults to `30`.
---@field max_unit_group_size uint The maximum number of members for an attack unit group. This only affects automatically created unit groups, manual groups created through the API are unaffected. Defaults to `200`.

---@class SteeringMapSetting
---@field radius double Does not include the radius of the unit.
---@field separation_factor double
---@field separation_force double
---@field force_unit_fuzzy_goto_behavior boolean Used to make steering look better for aesthetic purposes.

---@class SteeringMapSettings
---@field default SteeringMapSetting
---@field moving SteeringMapSetting

---@class PathFinderMapSettings
---@field fwd2bwd_ratio uint The pathfinder performs a step of the backward search every `fwd2bwd_ratio`'th step. The minimum allowed value is `2`, which means symmetric search. The default value is `5`.
---@field goal_pressure_ratio double When looking at which node to check next, their heuristic value is multiplied by this ratio. The higher it is, the more the search is directed straight at the goal. Defaults to `2`.
---@field max_steps_worked_per_tick double The maximum number of nodes that are expanded per tick. Defaults to `1,000`.
---@field max_work_done_per_tick uint The maximum amount of work each pathfinding job is allowed to do per tick. Defaults to `8,000`.
---@field use_path_cache boolean Whether to cache paths at all. Defaults to `true`.
---@field short_cache_size uint Number of elements in the short cache. Defaults to `5`.
---@field long_cache_size uint Number of elements in the long cache. Defaults to `25`.
---@field short_cache_min_cacheable_distance double The minimal distance to the goal in tiles required to be searched in the short path cache. Defaults to `10`.
---@field short_cache_min_algo_steps_to_cache uint The minimal number of nodes required to be searched in the short path cache. Defaults to `50`.
---@field long_cache_min_cacheable_distance double The minimal distance to the goal in tiles required to be searched in the long path cache. Defaults to `30`.
---@field cache_max_connect_to_cache_steps_multiplier uint When looking for a connection to a cached path, search at most for this number of steps times the original estimate. Defaults to `100`.
---@field cache_accept_path_start_distance_ratio double When looking for a path from cache, make sure it doesn't start too far from the requested start in relative terms. Defaults to `0.2`.
---@field cache_accept_path_end_distance_ratio double When looking for a path from cache, make sure it doesn't end too far from the requested end in relative terms. This is typically more lenient than the start ratio since the end target could be moving. Defaults to `0.15`.
---@field negative_cache_accept_path_start_distance_ratio double Same principle as `cache_accept_path_start_distance_ratio`, but used for negative cache queries. Defaults to `0.3`.
---@field negative_cache_accept_path_end_distance_ratio double Same principle as `cache_accept_path_end_distance_ratio`, but used for negative cache queries. Defaults to `0.3`.
---@field cache_path_start_distance_rating_multiplier double When assigning a rating to the best path, this multiplier times start distances is considered. Defaults to `10`.
---@field cache_path_end_distance_rating_multiplier double When assigning a rating to the best path, this multiplier times end distances is considered. This value is typically higher than the start multiplier as this results in better end path quality. Defaults to `20`.
---@field stale_enemy_with_same_destination_collision_penalty double A penalty that is applied for another unit that is on the way to the goal. This is mainly relevant for situations where a group of units has arrived at the target they are supposed to attack, making units further back circle around to reach the target. Defaults to `30`.
---@field ignore_moving_enemy_collision_distance double The distance in tiles after which other moving units are not considered for pathfinding. Defaults to `5`.
---@field enemy_with_different_destination_collision_penalty double A penalty that is applied for another unit that is too close and either not moving or has a different goal. Defaults to `30`.
---@field general_entity_collision_penalty double The general collision penalty with other units. Defaults to `10`.
---@field general_entity_subsequent_collision_penalty double The collision penalty for positions that require the destruction of an entity to get to. Defaults to `3`.
---@field extended_collision_penalty double The collision penalty for collisions in the extended bounding box but outside the entity's actual bounding box. Defaults to `3`.
---@field max_clients_to_accept_any_new_request uint The amount of path finder requests accepted per tick regardless of the requested path's length. Defaults to `10`.
---@field max_clients_to_accept_short_new_request uint When the `max_clients_to_accept_any_new_request` amount is exhausted, only path finder requests with a short estimate will be accepted until this amount (per tick) is reached. Defaults to `100`.
---@field direct_distance_to_consider_short_request uint The maximum direct distance in tiles before a request is no longer considered short. Defaults to `100`.
---@field short_request_max_steps uint The maximum amount of nodes a short request will traverse before being rescheduled as a long request. Defaults to `1000`.
---@field short_request_ratio double The amount of steps that are allocated to short requests each tick, as a percentage of all available steps. Defaults to `0.5`, or 50%.
---@field min_steps_to_check_path_find_termination uint The minimum amount of steps that are guaranteed to be performed for every request. Defaults to `2000`.
---@field start_to_goal_cost_multiplier_to_terminate_path_find double If the actual amount of steps is higher than the initial estimate by this factor, pathfinding is terminated. Defaults to `2000.0`.
---@field overload_levels uint[] The thresholds of waiting clients after each of which the per-tick work limit will be increased by the corresponding value in `overload_multipliers`. This is to avoid clients having to wait too long. Must have the same number of elements as `overload_multipliers`. Defaults to `{0, 100, 500}`.
---@field overload_multipliers double[] The multipliers to the amount of per-tick work applied after the corresponding thresholds in `overload_levels` have been reached. Must have the same number of elements as `overload_multipliers`. Defaults to `{2, 3, 4}`.
---@field negative_path_cache_delay_interval uint The delay in ticks between decrementing the score of all paths in the negative cache by one. Defaults to `20`.

---@class MapSettings Various game-related settings. Updating any of the attributes will immediately take effect in the game engine.
---@field pollution PollutionMapSettings
---@field enemy_evolution EnemyEvolutionMapSettings
---@field enemy_expansion EnemyExpansionMapSettings
---@field unit_group UnitGroupMapSettings
---@field steering SteeringMapSettings
---@field path_finder PathFinderMapSettings
---@field max_failed_behavior_count uint If a behavior fails this many times, the enemy (or enemy group) is destroyed. This solves biters getting stuck within their own base.

---@class DifficultySettings Technology and recipe difficulty settings. Updating any of the attributes will immediately take effect in the game engine.
---@field recipe_difficulty DefinesDifficultySettingsRecipeDifficulty
---@field technology_difficulty DefinesDifficultySettingsTechnologyDifficulty
---@field technology_price_multiplier double A value in range [0.001, 1000].
---@field research_queue_setting string Either `"after-victory"`, `"always"` or `"never"`. Changing this to `"always"` or `"after-victory"` does not automatically unlock the research queue. See [LuaForce](LuaForce) for that.

---@class MapAndDifficultySettings All regular [MapSettings](MapSettings) plus an additional table that contains the [DifficultySettings](DifficultySettings).
---@field pollution PollutionMapSettings
---@field enemy_evolution EnemyEvolutionMapSettings
---@field enemy_expansion EnemyExpansionMapSettings
---@field unit_group UnitGroupMapSettings
---@field steering SteeringMapSettings
---@field path_finder PathFinderMapSettings
---@field max_failed_behavior_count uint If a behavior fails this many times, the enemy (or enemy group) is destroyed. This solves biters getting stuck within their own base.
---@field difficulty_settings DifficultySettings

---@class MapExchangeStringData The data that can be extracted from a map exchange string, as a plain table.
---@field map_settings MapAndDifficultySettings
---@field map_gen_settings MapGenSettings

---@class BlueprintItemIcon
---@field name string Name of the item prototype whose icon should be used.
---@field index uint Index of the icon in the blueprint icons slots. Has to be an integer in the range [1, 4].

---@class BlueprintSignalIcon
---@field signal SignalID The icon to use. It can be any item icon as well as any virtual signal icon.
---@field index uint Index of the icon in the blueprint icons slots. Has to be an integer in the range [1, 4].

---@class BlueprintEntity The representation of an entity inside of a blueprint. It has at least these fields, but can contain additional ones depending on the kind of entity.
---@field entity_number uint The entity's unique identifier in the blueprint.
---@field name string The prototype name of the entity.
---@field position Position The position of the entity.
---@field direction DefinesDirection The direction the entity is facing. Only present for entities that can face in different directions and when the entity is not facing north.
---@field tags Tags The entity tags of the entity, if there are any. Only relevant for entity ghosts.
---@field items table<string, uint> The items that the entity will request when revived, if there are any. It's a mapping of prototype names to amounts. Only relevant for entity ghosts.
---@field connections BlueprintCircuitConnection The circuit network connections of the entity, if there are any. Only relevant for entities that support circuit connections.
---@field control_behavior BlueprintControlBehavior The control behavior of the entity, if it has one. The format of the control behavior depends on the entity's type. Only relevant for entities that support control behaviors.
---@field schedule TrainScheduleRecord[] The schedule of the entity, if it has one. Only relevant for locomotives.

---@class Tile
---@field position Position The position of the tile.
---@field name string The prototype name of the tile.

---@class Fluid
---@field name string Fluid prototype name of the fluid.
---@field amount double Amount of the fluid.
---@field temperature double The temperature. When reading from [LuaFluidBox](LuaFluidBox), this field will always be present. It is not necessary to specify it when writing, however. When not specified, the fluid will be set to the fluid's default temperature as specified in the fluid's prototype.

---@class Ingredient
---@field type string `"item"` or `"fluid"`.
---@field name string Prototype name of the required item or fluid.
---@field amount double Amount of the item or fluid.
---@field catalyst_amount uint | double How much of this ingredient is a catalyst.

---@class Product
---@field type string `"item"` or `"fluid"`.
---@field name string Prototype name of the result.
---@field amount double Amount of the item or fluid to give. If not specified, `amount_min`, `amount_max` and `probability` must all be specified.
---@field amount_min uint | double Minimal amount of the item or fluid to give. Has no effect when `amount` is specified.
---@field amount_max uint | double Maximum amount of the item or fluid to give. Has no effect when `amount` is specified.
---@field probability double A value in range [0, 1]. Item or fluid is only given with this probability; otherwise no product is produced.
---@field catalyst_amount uint | double How much of this product is a catalyst.

---@class Loot
---@field item string Item prototype name of the result.
---@field probability double Probability that any loot at all will drop, as a number in range [0, 1].
---@field count_min double Minimum amount of loot to drop.
---@field count_max double Maximum amount of loot to drop.

---@class TechnologyModifier The effect that is applied when a technology is researched. It is a table that contains at least the field `type`.
---@field type string Modifier type. Specifies which of the other fields will be available. Possible values are: `"inserter-stack-size-bonus"`, `"stack-inserter-capacity-bonus"`, `"laboratory-speed"`, `"character-logistic-trash-slots"`, `"maximum-following-robots-count"`, `"worker-robot-speed"`, `"worker-robot-storage"`, `"ghost-time-to-live"`, `"turret-attack"`, `"ammo-damage"`, `"give-item"`, `"gun-speed"`, `"unlock-recipe"`, `"character-crafting-speed"`, `"character-mining-speed"`, `"character-running-speed"`, `"character-build-distance"`, `"character-item-drop-distance"`, `"character-reach-distance"`, `"character-resource-reach-distance"`, `"character-item-pickup-distance"`, `"character-loot-pickup-distance"`, `"character-inventory-slots-bonus"`, `"deconstruction-time-to-live"`, `"max-failed-attempts-per-tick-per-construction-queue"`, `"max-successful-attempts-per-tick-per-construction-queue"`, `"character-health-bonus"`, `"mining-drill-productivity-bonus"`, `"train-braking-force-bonus"`, `"zoom-to-world-enabled"`, `"zoom-to-world-ghost-building-enabled"`, `"zoom-to-world-blueprint-enabled"`, `"zoom-to-world-deconstruction-planner-enabled"`, `"zoom-to-world-upgrade-planner-enabled"`, `"zoom-to-world-selection-tool-enabled"`, `"worker-robot-battery"`, `"laboratory-productivity"`, `"follower-robot-lifetime"`, `"artillery-range"`, `"nothing"`, `"character-additional-mining-categories"`, `"character-logistic-requests"`.

---@class Offer A single offer on a market entity.
---@field price Ingredient[] List of prices.
---@field offer TechnologyModifier The action that will take place when a player accepts the offer. Usually a `"give-item"` modifier.

---@class AutoplaceSpecification Specifies how probability and richness are calculated when placing something on the map. Can be specified either using `probability_expression` and `richness_expression` or by using all the other fields.
---@field probability_expression NoiseExpression
---@field richness_expression NoiseExpression
---@field coverage double
---@field sharpness double
---@field max_probability double
---@field placement_density uint
---@field richness_base double
---@field richness_multiplier double
---@field richness_multiplier_distance_bonus double
---@field starting_area_size uint
---@field order string
---@field default_enabled boolean
---@field peaks AutoplaceSpecificationPeak[]
---@field control string Control prototype name.
---@field tile_restriction AutoplaceSpecificationRestriction[]
---@field force string
---@field random_probability_penalty double

---@class NoiseExpression A fragment of a functional program used to generate coherent noise, probably for purposes related to terrain generation. These can only be meaningfully written/modified during the data load phase. More detailed information is found on the [wiki](https://wiki.factorio.com/Types/NoiseExpression).
---@field type string Names the type of the expression and determines what other fields are required.

---@class AutoplaceSpecificationPeak
---@field influence double
---@field max_influence double
---@field min_influence double
---@field richness_influence double
---@field noisePersistence double
---@field noise_layer string Prototype name of the noise layer.
---@field noise_octaves_difference double
---@field water_optimal double
---@field water_range double
---@field water_max_range double
---@field water_top_property_limit double
---@field elevation_optimal double
---@field elevation_range double
---@field elevation_max_range double
---@field elevation_top_property_limit double
---@field temperature_optimal double
---@field temperature_range double
---@field temperature_max_range double
---@field temperature_top_property_limit double
---@field starting_area_weight_optimal double
---@field starting_area_weight_range double
---@field starting_area_weight_max_range double
---@field starting_area_weight_top_property_limit double
---@field tier_from_start_optimal double
---@field tier_from_start_range double
---@field tier_from_start_max_range double
---@field tier_from_start_top_property_limit double
---@field distance_optimal double
---@field distance_range double
---@field distance_max_range double
---@field distance_top_property_limit double
---@field aux_optimal double
---@field aux_range double
---@field aux_max_range double
---@field aux_top_property_limit double

---@class AutoplaceSpecificationRestriction
---@field first string Tile prototype name
---@field second string Second prototype name

---@class Resistance
---@field decrease float Absolute damage decrease
---@field percent float Percentual damage decrease

---@alias MapGenSize any A floating point number specifying an amount. For backwards compatibility, MapGenSizes can also be specified as one of the following strings, which will be converted to a number (when queried, a number will always be returned): - `"none"` - equivalent to `0` - `"very-low"`, `"very-small"`, `"very-poor"` - equivalent to `1/2` - `"low"`, `"small"`, `"poor"` - equivalent to `1/sqrt(2)` - `"normal"`, `"medium"`, `"regular"` - equivalent to `1` - `"high"`, `"big"`, `"good"` - equivalent to `sqrt(2)` - `"very-high"`, `"very-big"`, `"very-good"` - equivalent to `2`

---@class AutoplaceSetting
---@field frequency MapGenSize
---@field size MapGenSize
---@field richness MapGenSize

---@class AutoplaceSettings
---@field treat_missing_as_default boolean Whether missing autoplace names for this type should be default enabled.
---@field settings table<string, AutoplaceSetting>

---@class AutoplaceControl
---@field frequency MapGenSize For things that are placed as spots such as ores and enemy bases, frequency is generally proportional to number of spots placed per unit area. For continuous features such as forests, frequency is how compressed the probability function is over distance, i.e. the inverse of 'scale' (similar to terrain_segmentation). When the [LuaAutoplaceControlPrototype](LuaAutoplaceControlPrototype) is of the category `"terrain"`, then scale is shown in the map generator GUI instead of frequency.
---@field size MapGenSize For things that are placed as spots, size is proportional to the area of each spot. For continuous features, size affects how much of the map is covered with the thing, and is called 'coverage' in the GUI.
---@field richness MapGenSize Has different effects for different things, but generally affects the 'health' or density of a thing that is placed without affecting where it is placed. For trees, richness affects tree health. For ores, richness multiplies the amount of ore at any given tile in a patch. Metadata about autoplace controls (such as whether or not 'richness' does anything for them) can be found in the [LuaAutoplaceControlPrototype](LuaAutoplaceControlPrototype) by looking up `game.autoplace_control_prototypes[(control prototype name)]`, e.g. `game.autoplace_control_prototypes["enemy-base"].richness` is false, because enemy base autoplacement doesn't use richness.

---@class CliffPlacementSettings
---@field name string Name of the cliff prototype.
---@field cliff_elevation_0 float Elevation at which the first row of cliffs is placed. The default is `10`, and this cannot be set from the map generation GUI.
---@field cliff_elevation_interval float Elevation difference between successive rows of cliffs. This is inversely proportional to 'frequency' in the map generation GUI. Specifically, when set from the GUI the value is `40 / frequency`.
---@field richness MapGenSize Corresponds to 'continuity' in the GUI. This value is not used directly, but is used by the 'cliffiness' noise expression, which in combination with elevation and the two cliff elevation properties drives cliff placement (cliffs are placed when elevation crosses the elevation contours defined by `cliff_elevation_0` and `cliff_elevation_interval` when 'cliffiness' is greater than `0.5`). The default 'cliffiness' expression interprets this value such that larger values result in longer unbroken walls of cliffs, and smaller values (between `0` and `1`) result in larger gaps in cliff walls.

---@class MapGenSettings The 'map type' dropdown in the map generation GUI is actually a selector for elevation generator. The base game sets `property_expression_names.elevation` to `"0_16-elevation"` to reproduce terrain from 0.16 or to `"0_17-island"` for the island preset. If generators are available for other properties, the 'map type' dropdown in the GUI will be renamed to 'elevation' and shown along with selectors for the other selectable properties.
---@field terrain_segmentation MapGenSize The inverse of 'water scale' in the map generator GUI. Lower `terrain_segmentation` increases the scale of elevation features (lakes, continents, etc). This behavior can be overridden with alternate elevation generators (see `property_expression_names`, below).
---@field water MapGenSize The equivalent to 'water coverage' in the map generator GUI. Specifically, when this value is non-zero, `water_level = 10 * log2` (the value of this field), and the elevation generator subtracts water level from elevation before adding starting lakes. If water is set to 'none', elevation is clamped to a small positive value before adding starting lakes. This behavior can be overridden with alternate elevation generators (see `property_expression_names`, below).
---@field autoplace_controls table<string, AutoplaceControl> Indexed by autoplace control prototype name.
---@field default_enable_all_autoplace_controls boolean Whether undefined `autoplace_controls` should fall back to the default controls or not. Defaults to `true`.
---@field autoplace_settings table<string, AutoplaceSettings> Each setting in this dictionary maps the string type to the settings for that type. Valid types are `"entity"`, `"tile"` and `"decorative"`.
---@field cliff_settings CliffPlacementSettings Map generation settings for entities of the type "cliff".
---@field seed uint The random seed used to generated this map.
---@field width uint Width in tiles. If `0`, the map has 'infinite' width, with the actual limitation being one million tiles in each direction from the center.
---@field height uint Height in tiles. If `0`, the map has 'infinite' height, with the actual limitation being one million tiles in each direction from the center.
---@field starting_area MapGenSize Size of the starting area.
---@field starting_points Position[] Positions of the starting areas.
---@field peaceful_mode boolean Whether peaceful mode is enabled for this map.
---@field property_expression_names table<string, string> Overrides for tile property value generators. Values either name a NamedNoiseExpression or can be literal numbers, stored as strings (e.g. `"5"`). All other controls can be overridden by a property expression names. Notable properties: - `moisture` - a value between 0 and 1 that determines whether a tile becomes sandy (low moisture) or grassy (high moisture). - `aux` - a value between 0 and 1 that determines whether low-moisture tiles become sand or red desert. - `temperature` - provides a value (vaguely representing degrees Celsius, varying between -20 and 50) that is used (together with moisture and aux) as part of tree and decorative placement. - `elevation` - tiles values less than zero become water. Cliffs are placed along certain contours according to [CliffPlacementSettings](CliffPlacementSettings). - `cliffiness` - determines whether (when >0.5) or not (when <0.5) a cliff will be placed at an otherwise suitable (according to [CliffPlacementSettings](CliffPlacementSettings)) location. - `enemy-base-intensity` - a number that is referenced by both `enemy-base-frequency` and `enemy-base-radius`. i.e. if this is overridden, enemy base frequency and size will both be affected and do something reasonable. By default, this expression returns a value proportional to distance from any starting point, clamped at about 7. - `enemy-base-frequency` - a number representing average number of enemy bases per tile for a region, by default in terms of `enemy-base-intensity`. - `enemy-base-radius` - a number representing the radius of an enemy base, if one were to be placed on the given tile, by default proportional to a constant plus `enemy-base-intensity`. Climate controls ('Moisture' and 'Terrain type' at the bottom of the Terrain tab in the map generator GUI) don't have their own dedicated structures in MapGenSettings. Instead, their values are stored as property expression overrides with long names: - `control-setting:moisture:frequency:multiplier` - frequency (inverse of scale) multiplier for moisture noise. Default is 1. - `control-setting:moisture:bias` - global bias for moisture (which normally varies between 0 and 1). Default is 0. - `control-setting:aux:frequency:multiplier` - frequency (inverse of scale) multiplier for aux (called 'terrain type' in the GUI) noise. Default is 1. - `control-setting:aux:bias` - global bias for aux/terrain type (which normally varies between 0 and 1). Default is 0. All other MapGenSettings feed into named noise expressions, and therefore placement can be overridden by including the name of a property in this dictionary. The probability and richness functions for placing specific tiles, entities, and decoratives can be overridden by including an entry named `{tile|entity|decorative}:(prototype name):{probability|richness}`.

---@class SignalID
---@field type string `"item"`, `"fluid"`, or `"virtual"`.
---@field name string Name of the item, fluid or virtual signal.

---@class Signal An actual signal transmitted by the network.
---@field signal SignalID ID of the signal.
---@field count int Value of the signal.

---@class UpgradeFilter
---@field type string `"item"`, or `"entity"`.
---@field name string Name of the item, or entity.

---@class InfinityInventoryFilter A single filter used by an infinity-filters instance.
---@field name string Name of the item.
---@field count uint The count of the filter.
---@field mode string `"at-least"`, `"at-most"`, or `"exactly"`. Defaults to `"at-least"`.
---@field index uint The index of this filter in the filters list.

---@class InfinityPipeFilter A single filter used by an infinity-pipe type entity.
---@field name string Name of the fluid.
---@field percentage double The fill percentage the pipe (e.g. 0.5 for 50%). Can't be negative.
---@field temperature double The temperature of the fluid. Defaults to the default/minimum temperature of the fluid.
---@field mode string `"at-least"`, `"at-most"`, `"exactly"`, `"add"`, or `"remove"`. Defaults to `"at-least"`.

---@class FluidBoxFilter
---@field name string Fluid prototype name of the filtered fluid.
---@field minimum_temperature double The minimum temperature allowed into the fluidbox.
---@field maximum_temperature double The maximum temperature allowed into the fluidbox.

---@class FluidBoxFilterSpec
---@field name string Fluid prototype name of the filtered fluid.
---@field minimum_temperature double The minimum temperature allowed into the fluidbox.
---@field maximum_temperature double The maximum temperature allowed into the fluidbox.
---@field force boolean Force the filter to be set, regardless of current fluid content.

---@class HeatSetting The settings used by a heat-interface type entity.
---@field temperature double The target temperature. Defaults to the minimum temperature of the heat buffer.
---@field mode string `"at-least"`, `"at-most"`, `"exactly"`, `"add"`, or `"remove"`. Defaults to `"at-least"`.

---@class HeatConnection
---@field position Vector
---@field direction DefinesDirection

---@class FluidBoxConnection A definition of a fluidbox connection point.
---@field type string The connection type: "input", "output", or "input-output".
---@field positions Vector[] The 4 cardinal direction connection points for this pipe. This vector is a table with `x` and `y` keys instead of an array.
---@field max_underground_distance uint The maximum tile distance this underground connection can connect at if this is an underground pipe.

---@class ArithmeticCombinatorParameters
---@field first_signal SignalID First signal to use in an operation. If not specified, the second argument will be the value of `first_constant`.
---@field second_signal SignalID Second signal to use in an operation. If not specified, the second argument will be the value of `second_constant`.
---@field first_constant int Constant to use as the first argument of the operation. Has no effect when `first_signal` is set. Defaults to `0`.
---@field second_constant int Constant to use as the second argument of the operation. Has no effect when `second_signal` is set. Defaults to `0`.
---@field operation string Must be one of `"*"`, `"/"`, `"+"`, `"-"`, `"%"`, `"^"`, `"<<"`, `">>"`, `"AND"`, `"OR"`, `"XOR"`. When not specified, defaults to `"*"`.
---@field output_signal SignalID Specifies the signal to output.

---@class ConstantCombinatorParameters
---@field signal SignalID Signal to emit.
---@field count int Value of the signal to emit.
---@field index uint Index of the constant combinator's slot to set this signal to.

---`=` "equal to"
---
---`>` "greater than"
---
---`<` "lesser than"
---
---`≥` "greater than or equal to"
---
---`>=` "greater than or equal to"
---
---`≤` "lesser than or equal to"
---
---`<=` "lesser than or equal to"
---
---`≠` "not equal to"
---
---`!=` "not equal to"
---@alias ComparatorString string A [string](string) that specifies how the inputs should be compared.

---@class DeciderCombinatorParameters
---@field first_signal SignalID Defaults to blank.
---@field second_signal SignalID Second signal to use in an operation, if any. If this is not specified, the second argument to a decider combinator's operation is assumed to be the value of `constant`.
---@field constant uint Constant to use as the second argument of operation. Defaults to `0`.
---@field comparator ComparatorString Specifies how the inputs should be compared. If not specified, defaults to `"<"`.
---@field output_signal SignalID Defaults to blank.
---@field copy_count_from_input boolean Defaults to `true`. When `false`, will output a value of `1` for the given `output_signal`.

---@class InserterCircuitConditions
---@field circuit CircuitCondition
---@field logistics CircuitCondition

---@class CircuitCondition
---@field comparator ComparatorString Specifies how the inputs should be compared. If not specified, defaults to `"<"`.
---@field first_signal SignalID Defaults to blank
---@field second_signal SignalID What to compare `first_signal` to. If not specified, `first_signal` will be compared to `constant`.
---@field constant int Constant to compare `first_signal` to. Has no effect when `second_signal` is set. When neither `second_signal` nor `constant` are specified, the effect is as though `constant` were specified with the value `0`.

---@class CircuitConditionDefinition
---@field condition CircuitCondition
---@field fulfilled boolean Whether the condition is currently fulfilled

---@class CircuitConnectionDefinition
---@field wire DefinesWireType Wire color, either [defines.wire_type.red](defines.wire_type.red) or [defines.wire_type.green](defines.wire_type.green).
---@field target_entity LuaEntity
---@field source_circuit_id DefinesCircuitConnectorId
---@field target_circuit_id DefinesCircuitConnectorId

---@class WireConnectionDefinition
---@field wire DefinesWireType Wire color, either [defines.wire_type.red](defines.wire_type.red) or [defines.wire_type.green](defines.wire_type.green).
---@field target_entity LuaEntity The entity to (dis)connect the source entity with.
---@field source_circuit_id DefinesCircuitConnectorId Mandatory if the source entity has more than one circuit connection using circuit wire.
---@field target_circuit_id DefinesCircuitConnectorId Mandatory if the target entity has more than one circuit connection using circuit wire.
---@field source_wire_id DefinesCircuitConnectorId Mandatory if the source entity has more than one wire connection using copper wire.
---@field target_wire_id DefinesCircuitConnectorId Mandatory if the target entity has more than one wire connection using copper wire.

---@class InventoryFilter
---@field index uint Position of the corresponding filter slot.
---@field name string Item prototype name of the item to filter.

---@class PlaceAsTileResult
---@field result LuaTilePrototype The tile prototype.
---@field condition_size uint
---@field condition CollisionMask

---@class Command Commands can be given to enemies and unit groups.
---@field type DefinesCommand Type of command. The remaining fields depend on the value of this field.

---@class PathfinderFlags
---@field allow_destroy_friendly_entities boolean Allows pathing through friendly entities. Defaults to `false`.
---@field allow_paths_through_own_entities boolean Allows the pathfinder to path through entities of the same force. Defaults to `false`.
---@field cache boolean Enables path caching. This can be more efficient, but might fail to respond to changes in the environment. Defaults to `true`.
---@field prefer_straight_paths boolean Makes the pathfinder try to path in straight lines. Defaults to `false`.
---@field low_priority boolean Sets lower priority on the path request, meaning it might take longer to find a path at the expense of speeding up others. Defaults to `false`.
---@field no_break boolean Makes the pathfinder not break in the middle of processing this pathfind, no matter how much work is needed. Defaults to `false`.

---@class UnitSpawnDefinition
---@field unit string Prototype name of the unit that would be spawned.
---@field spawn_points SpawnPointDefinition[] The points at which to spawn the unit.

---@class SpawnPointDefinition
---@field evolution_factor double Evolution factor for which this weight applies.
---@field weight double Probability of spawning this unit at this evolution factor.

---@class ItemStackDefinition
---@field name string Prototype name of the item the stack holds.
---@field count uint Number of items the stack holds. If not specified, defaults to `1`.
---@field health float Health of the items in the stack. Defaults to `1.0`.
---@field durability double Durability of the tool items in the stack.
---@field ammo double Amount of ammo in the ammo items in the stack.
---@field tags string[] Tags of the items with tags in the stack.

---@alias SimpleItemStack string | ItemStackDefinition

---@alias FluidIdentification string | LuaFluidPrototype | Fluid

---@alias ForceIdentification string | LuaForce

---@alias TechnologyIdentification string | LuaTechnology | LuaTechnologyPrototype

---@alias SurfaceIdentification uint | string | LuaSurface

---@alias PlayerIdentification uint | string | LuaPlayer

---@alias ItemStackIdentification SimpleItemStack | LuaItemStack

---@alias EntityPrototypeIdentification LuaEntity | LuaEntityPrototype | string

---@alias ItemPrototypeIdentification LuaItemStack | LuaItemPrototype | string

---@class WaitCondition
---@field type string One of `"time"`, `"inactivity"`, `"full"`, `"empty"`, `"item_count"`, `"circuit"`, `"robots_inactive"`, `"fluid_count"`, `"passenger_present"`, `"passenger_not_present"`.
---@field compare_type string Either `"and"`, or `"or"`. Tells how this condition is to be compared with the preceding conditions in the corresponding `wait_conditions` array.
---@field ticks uint Number of ticks to wait or of inactivity. Only present when `type` is `"time"` or `"inactivity"`.
---@field condition CircuitCondition Only present when `type` is `"item_count"`, `"circuit"` or `"fluid_count"`.

---@class TrainScheduleRecord
---@field station string Name of the station.
---@field rail LuaEntity Rail to path to. Ignored if `station` is present.
---@field rail_direction DefinesRailDirection When a train is allowed to reach rail target from any direction it will be `nil`. If rail has to be reached from specific direction, this value allows to choose the direction. This value corresponds to [LuaEntity::connected_rail_direction](LuaEntity::connected_rail_direction) of a TrainStop.
---@field wait_conditions WaitCondition[]
---@field temporary boolean Only present when the station is temporary, the value is then always `true`.

---@class TrainSchedule
---@field current uint Index of the currently active record
---@field records TrainScheduleRecord[]

---@class GuiArrowSpecification Used for specifying where a GUI arrow should point to.
---@field type string This determines which of the following fields will be required. Must be one of `"nowhere"` (will remove the arrow entirely), `"goal"` (will point to the current goal), `"entity_info"`, `"active_window"`, `"entity"`, `"position"`, `"crafting_queue"` or `"item_stack"` (will point to a given item stack in an inventory). Depending on this value, other fields may have to be specified.

---@class AmmoType
---@field action TriggerItem[]
---@field target_type string One of `"entity"` (fires at an entity), `"position"` (fires directly at a position), or `"direction"` (fires in a direction).
---@field clamp_position boolean When `true`, the gun will be able to shoot even when the target is out of range. Only applies when `target_type` is `position`. The gun will fire at the maximum range in the direction of the target position. Defaults to `false`.
---@field category string Ammo category of this ammo.
---@field energy_consumption double Energy consumption of a single shot, if applicable. Defaults to `0`.

---@class BeamTarget
---@field entity LuaEntity The target entity.
---@field position Position The target position.

---@class RidingState
---@field acceleration DefinesRidingAcceleration
---@field direction DefinesRidingDirection

---@alias SpritePath any It is specified by [string](string). It can be either the name of a [sprite prototype](https://wiki.factorio.com/Prototype/Sprite) defined in the data stage or a path in form "type/name". The supported types are: - `"item"` - for example "item/iron-plate" is the icon sprite of iron plate - `"entity"` - for example "entity/small-biter" is the icon sprite of the small biter - `"technology"` - `"recipe"` - `"item-group"` - `"fluid"` - `"tile"` - `"virtual-signal"` - `"achievement"` - `"equipment"` - `"file"` - path to an image file located inside the current scenario. This file is not preloaded so it will be slower; for frequently used sprites, it is better to define sprite prototype and use it instead. - `"utility"` - sprite defined in the utility-sprites object, these are the pictures used by the game internally for the UI.

---@alias SoundPath any A sound defined by a [string](string). It can be either the name of a [sound prototype](https://wiki.factorio.com/Prototype/Sound) defined in the data stage or a path in the form `"type/name"`. The latter option can be sorted into three categories. The utility and ambient types each contain general use sound prototypes defined by the game itself. - `"utility"` - Uses the [UtilitySounds](https://wiki.factorio.com/Prototype/UtilitySounds) prototype. Example: `"utility/wire_connect_pole"` - `"ambient"` - Uses [AmbientSound](https://wiki.factorio.com/Prototype/AmbientSound) prototypes. Example: `"ambient/resource-deficiency"` The following types can be combined with any tile name as long as its prototype defines the corresponding sound. - `"tile-walking"` - Uses [Tile::walking_sound](https://wiki.factorio.com/Prototype/Tile#walking_sound). Example: `"tile-walking/concrete"` - `"tile-mined"` - Uses [Tile::mined_sound](https://wiki.factorio.com/Prototype/Tile#mined_sound) - `"tile-build-small"` - Uses [Tile::build_sound](https://wiki.factorio.com/Prototype/Tile#build_sound). Example: `"tile-build-small/concrete"` - `"tile-build-medium"` - Uses [Tile::build_sound](https://wiki.factorio.com/Prototype/Tile#build_sound) - `"tile-build-large"` - Uses [Tile::build_sound](https://wiki.factorio.com/Prototype/Tile#build_sound) The following types can be combined with any entity name as long as its prototype defines the corresponding sound. - `"entity-build"` - Uses [Entity::build_sound](https://wiki.factorio.com/Prototype/Entity#build_sound). Example: `"entity-build/wooden-chest"` - `"entity-mined"` - Uses [Entity::mined_sound](https://wiki.factorio.com/Prototype/Entity#mined_sound) - `"entity-mining"` - Uses [Entity::mining_sound](https://wiki.factorio.com/Prototype/Entity#mining_sound) - `"entity-vehicle_impact"` - Uses [Entity::vehicle_impact_sound](https://wiki.factorio.com/Prototype/Entity#vehicle_impact_sound) - `"entity-rotated"` - Uses [Entity::rotated_sound](https://wiki.factorio.com/Prototype/Entity#rotated_sound) - `"entity-open"` - Uses [Entity::open_sound](https://wiki.factorio.com/Prototype/Entity#open_sound) - `"entity-close"` - Uses [Entity::close_sound](https://wiki.factorio.com/Prototype/Entity#close_sound)

---@class ModuleEffectValue
---@field bonus float The percentual increase of the attribute. A value of `0.6` means a 60% increase.

---@class ModuleEffects
---@field consumption ModuleEffectValue
---@field speed ModuleEffectValue
---@field productivity ModuleEffectValue
---@field pollution ModuleEffectValue

---@class EntityPrototypeFlags This is a set of flags given as a dictionary[[string](string) &rarr; [boolean](boolean)]. When a flag is set, it is present in the dictionary with the value `true`. Unset flags aren't present in the dictionary at all. So, the boolean value is meaningless and exists just for easy table lookup if a flag is set.
---@field not-rotatable boolean
---@field placeable-neutral boolean
---@field placeable-player boolean
---@field placeable-enemy boolean
---@field placeable-off-grid boolean
---@field player-creation boolean
---@field building-direction-8-way boolean
---@field filter-directions boolean
---@field fast-replaceable-no-build-while-moving boolean
---@field breaths-air boolean
---@field not-repairable boolean
---@field not-on-map boolean
---@field not-deconstructable boolean
---@field not-blueprintable boolean
---@field hidden boolean
---@field hide-alt-info boolean
---@field fast-replaceable-no-cross-type-while-moving boolean
---@field no-gap-fill-while-building boolean
---@field not-flammable boolean
---@field no-automated-item-removal boolean
---@field no-automated-item-insertion boolean
---@field no-copy-paste boolean
---@field not-selectable-in-game boolean
---@field not-upgradable boolean
---@field not-in-kill-statistics boolean

---@class ItemPrototypeFlags This is a set of flags given as dictionary[[string](string) &rarr; [boolean](boolean)]. When a flag is set, it is present in the dictionary with the value `true`. Unset flags aren't present in the dictionary at all. So, the boolean value is meaningless and exists just for easy table lookup if a flag is set.
---@field draw-logistic-overlay boolean
---@field hidden boolean
---@field always-show boolean
---@field hide-from-bonus-gui boolean
---@field hide-from-fuel-tooltip boolean
---@field not-stackable boolean
---@field can-extend-inventory boolean
---@field primary-place-result boolean
---@field mod-openable boolean
---@field only-in-cursor boolean
---@field spawnable boolean

---@alias CollisionMaskLayer any A [string](string) specifying a collision mask layer. Possible values for the string are: - `"ground-tile"` - `"water-tile"` - `"resource-layer"` - `"doodad-layer"` - `"floor-layer"` - `"item-layer"` - `"ghost-layer"` - `"object-layer"` - `"player-layer"` - `"train-layer"` - `"rail-layer"` - `"transport-belt-layer"` - `"not-setup"` Additionally the values `"layer-13"` through `"layer-55"`. These layers are currently unused by the game but may change. If a mod is going to use one of the unused layers it's recommended to start at the higher layers because the base game will take from the lower ones.

---@alias CollisionMask any This is a set of masks given as a dictionary[[CollisionMaskLayer](CollisionMaskLayer) &rarr; [boolean](boolean)]. Only set masks are present in the dictionary and they have the value `true`. Unset flags aren't present at all.

---@alias CollisionMaskWithFlags any A [CollisionMask](CollisionMask) but also includes any flags this mask has. Flags such as: - `"not-colliding-with-itself"` - `"consider-tile-transitions"` - `"colliding-with-tiles-only"`

---@alias TriggerTargetMask any This is a set of trigger target masks given as a dictionary[[string](string) &rarr; [boolean](boolean)].

---@class TriggerEffectItem
---@field type string One of`"damage"`, `"create-entity"`, `"create-explosion"`, `"create-fire"`, `"create-smoke"`, `"create-trivial-smoke"`, `"create-particle"`, `"create-sticker"`, `"nested-result"`, `"play-sound"`, `"push-back"`, `"destroy-cliffs"`, `"show-explosion-on-chart"`, `"insert-item"`, `"script"`.
---@field repeat_count uint
---@field affects_target boolean
---@field show_in_tooltip boolean

---@class TriggerDelivery
---@field type string One of `"instant"`, `"projectile"`, `"flame-thrower"`, `"beam"`, `"stream"`, `"artillery"`.
---@field source_effects TriggerEffectItem[]
---@field target_effects TriggerEffectItem[]

---@class TriggerItem
---@field type string One of `"direct"`, `"area"`, `"line"`, `"cluster"`.
---@field action_delivery TriggerDelivery[]
---@field entity_flags EntityPrototypeFlags The trigger will only affect entities that contain any of these flags.
---@field ignore_collision_condition boolean
---@field collision_mask CollisionMask The trigger will only affect entities that would collide with given collision mask.
---@field trigger_target_mask TriggerTargetMask
---@field force ForceCondition If `"enemy"`, the trigger will only affect entities whose force is different from the attacker's and for which there is no cease-fire set. `"ally"` is the opposite of `"enemy"`.
---@field repeat_count uint

---@class CircularParticleCreationSpecification
---@field name string Name of the [LuaEntityPrototype](LuaEntityPrototype)
---@field direction float
---@field direction_deviation float
---@field speed float
---@field speed_deviation float
---@field starting_frame_speed float
---@field starting_frame_speed_deviation float
---@field height float
---@field height_deviation float
---@field vertical_speed float
---@field vertical_speed_deviation float
---@field center Vector This vector is a table with `x` and `y` keys instead of an array.
---@field creation_distance double
---@field creation_distance_orientation double
---@field use_source_position boolean

---@alias CircularProjectileCreationSpecification any An array with the following members: - A [RealOrientation](RealOrientation) - A [Vector](Vector)

---@class AttackParameterFluid
---@field type string Name of the [LuaFluidPrototype](LuaFluidPrototype).
---@field damage_modifier double Multiplier applied to the damage of an attack.

---@class AttackParameters
---@field type string The type of AttackParameter. One of `'projectile'`, `'stream'` or `'beam'`.
---@field range float Maximum range of attack.
---@field min_range float Minimum range of attack. Used with flamethrower turrets to prevent self-immolation.
---@field range_mode string Defines how the range is determined. Either `'center-to-center'` or `'bounding-box-to-bounding-box'`.
---@field fire_penalty float When searching for the nearest enemy to attack, `fire_penalty` is added to the enemy's distance if they are on fire.
---@field rotate_penalty float When searching for an enemy to attack, a higher `rotate_penalty` will discourage targeting enemies that would take longer to turn to face.
---@field health_penalty float When searching for an enemy to attack, a higher `health_penalty` will discourage targeting enemies with high health. A negative penalty will do the opposite.
---@field min_attack_distance float If less than `range`, the entity will choose a random distance between `range` and `min_attack_distance` and attack from that distance. Used for spitters.
---@field turn_range float The arc that the entity can attack in as a fraction of a circle. A value of `1` means the full 360 degrees.
---@field damage_modifier float Multiplier applied to the damage of an attack.
---@field ammo_consumption_modifier float Multiplier applied to the ammo consumption of an attack.
---@field cooldown float Minimum amount of ticks between shots. If this is less than `1`, multiple shots can be performed per tick.
---@field warmup uint Number of ticks it takes for the weapon to actually shoot after it has been ordered to do so.
---@field movement_slow_down_factor double
---@field movement_slow_down_cooldown float
---@field ammo_type AmmoType
---@field ammo_categories string[] List of the names of compatible [LuaAmmoCategoryPrototypes](LuaAmmoCategoryPrototype).

---@class CapsuleAction
---@field type string One of `"throw"`, `"equipment-remote"`, `"use-on-self"`.
---@field attack_parameters AttackParameters Only present when `type` is `"throw"` or `"use-on-self"`.
---@field equipment string Only present when `type` is `"equipment-remote"`. It is the equipment prototype name.

---@class SelectionModeFlags This is a set of flags given as a dictionary[[string](string) &rarr; [boolean](boolean)]. Set flags are present in the dictionary with the value `true`; unset flags aren't present at all.
---@field blueprint boolean Entities that can be selected for blueprint.
---@field deconstruct boolean Entities that can be marked for deconstruction.
---@field cancel-deconstruct boolean Entities that can be marked for deconstruction cancelling.
---@field items boolean
---@field trees boolean
---@field buildable-type boolean Buildable entities.
---@field nothing boolean Only select an area.
---@field items-to-place boolean Entities that can be placed using an item.
---@field any-entity boolean
---@field any-tile boolean
---@field same-force boolean Entities with the same force as the selector.
---@field not-same-force boolean
---@field friend boolean
---@field enemy boolean
---@field upgrade boolean
---@field cancel-upgrade boolean
---@field entity-with-health boolean
---@field entity-with-force boolean
---@field entity-with-owner boolean

---@class LogisticFilter
---@field index uint The index this filter applies to.
---@field name string The item name for this filter.
---@field count uint The count for this filter.

---@class ModSetting
---@field value uint | double | boolean | string The value of the mod setting. The type depends on the setting.

---@alias AnyBasic any Any basic type (string, number, boolean) or table.

---@alias Any any Any basic type (string, number, boolean), table, or LuaObject.

---@class ProgrammableSpeakerParameters
---@field playback_volume double
---@field playback_globally boolean
---@field allow_polyphony boolean

---@class ProgrammableSpeakerAlertParameters
---@field show_alert boolean
---@field show_on_map boolean
---@field icon_signal_id SignalID
---@field alert_message string

---@class ProgrammableSpeakerCircuitParameters
---@field signal_value_is_pitch boolean
---@field instrument_id uint
---@field note_id uint

---@class ProgrammableSpeakerInstrument
---@field name string
---@field notes string[]

---`top-left`
---
---`middle-left`
---
---`left` The same as `"middle-left"`
---
---`bottom-left`
---
---`top-center`
---
---`middle-center`
---
---`center` The same as `"middle-center"`
---
---`bottom-center`
---
---`top-right`
---
---`right` The same as `"middle-right"`
---
---`bottom-right`
---@alias Alignment string A [string](string) that specifies where a gui element should be.

---@class EventData Information about the event that has been raised. The table can also contain other fields depending on the type of event. See [the list of Factorio events](events.html) for more information on these.
---@field name DefinesEvents The identifier of the event this handler was registered to.
---@field tick uint The tick during which the event happened.
---@field mod_name string The name of the mod that raised the event if it was raised using [LuaBootstrap::raise_event](LuaBootstrap::raise_event).

---@class NthTickEventData
---@field tick uint The tick during which the event happened.
---@field nth_tick uint The nth tick this handler was registered to.

---@class ModChangeData
---@field old_version string Old version of the mod. May be `nil` if the mod wasn't previously present (i.e. it was just added).
---@field new_version string New version of the mod. May be `nil` if the mod is no longer present (i.e. it was just removed).

---@class ConfigurationChangedData
---@field old_version string Old version of the map. Present only when loading map version other than the current version.
---@field new_version string New version of the map. Present only when loading map version other than the current version.
---@field mod_changes table<string, ModChangeData> Dictionary of mod changes. It is indexed by mod name.
---@field mod_startup_settings_changed boolean `true` when mod startup settings have changed since the last time this save was loaded.
---@field migration_applied boolean `true` when mod prototype migrations have been applied since the last time this save was loaded.

---@class CustomCommandData
---@field name string The name of the command.
---@field tick uint The tick the command was used in.
---@field player_index uint The player who issued the command, or `nil` if it was issued from the server console.
---@field parameter string The parameter passed after the command, if there is one.

---@class SelectedPrototypeData
---@field base_type string E.g. `"entity"`.
---@field derived_type string E.g. `"tree"`.
---@field name string E.g. `"tree-05"`.

---@class ScriptRenderTarget
---@field entity LuaEntity
---@field entity_offset Vector
---@field position Position

---@alias MouseButtonFlags any This is a set of flags given as a dictionary[[string](string) &rarr; [boolean](boolean)]. When a flag is set, it is present in the dictionary with the value `true`. Unset flags aren't present in the dictionary at all. To write to this, use an array[[string](string)] of the mouse buttons that should be possible to use with on button. When setting flags, the flag `"left-and-right"` can also be set which will set `"left"` and `"right"` true. Possible flags when reading are: - `"left"` - `"right"` - `"middle"` - `"button-4"` - `"button-5"` - `"button-6"` - `"button-7"` - `"button-8"` - `"button-9"`

---`entity` Yellow box.
---
---`not-allowed` Red box.
---
---`electricity` Light blue box.
---
---`pair` Light blue box.
---
---`copy` Green box.
---
---`train-visualization` White box.
---
---`logistics` Light blue box.
---
---`blueprint-snap-rectangle` Green box.
---@alias CursorBoxRenderType string It is specified by [string](string).

---`all` All forces pass.
---
---`enemy` Forces which will attack pass.
---
---`ally` Forces which won't attack pass.
---
---`friend` Forces which are friends pass.
---
---`not-friend` Forces which are not friends pass.
---
---`same` The same force pass.
---
---`not-same` The non-same forces pass.
---@alias ForceCondition string It is specified by [string](string).

---@alias RenderLayer any A value between 0 and 255 inclusive represented by one of the following named [string](string) or string version of the value (for example `"27"` and `"decals"` are both valid). Higher values are rendered on top of lower values. - `"water-tile"`: 15 - `"ground-tile"`: 25 - `"tile-transition"`: 26 - `"decals"`: 27 - `"lower-radius-visualization"`: 29 - `"radius-visualization"`: 30 - `"transport-belt-integration"`: 65 - `"resource"`:66 - `"building-smoke"`:67 - `"decorative"`: 92 - `"ground-patch"`: 93 - `"ground-patch-higher"`: 94 - `"ground-patch-higher2"`: 95 - `"remnants"`: 112 - `"floor"`: 113 - `"transport-belt"`: 114 - `"transport-belt-endings"`: 115 - `"floor-mechanics-under-corpse"`: 120 - `"corpse"`: 121 - `"floor-mechanics"`: 122 - `"item"`: 123 - `"lower-object"`: 124 - `"transport-belt-circuit-connector"`: 126 - `"lower-object-above-shadow"`: 127 - `"object"`: 129 - `"higher-object-under"`: 131 - `"higher-object-above"`: 132 - `"item-in-inserter-hand"`: 134 - `"wires"`: 135 - `"wires-above"`: 136 - `"entity-info-icon"`: 138 - `"entity-info-icon-above"`: 139 - `"explosion"`: 142 - `"projectile"`: 143 - `"smoke"`: 144 - `"air-object"`: 145 - `"air-entity-info-icon"`: 147 - `"light-effect"`: 148 - `"selection-box"`: 187 - `"higher-selection-box"`: 188 - `"collision-selection-box"`: 189 - `"arrow"`: 190 - `"cursor"`: 210

---`west-to-east`
---
---`north-to-south`
---
---`east-to-west`
---
---`south-to-north`
---
---`west-to-north`
---
---`north-to-east`
---
---`east-to-south`
---
---`south-to-west`
---
---`west-to-south`
---
---`north-to-west`
---
---`east-to-north`
---
---`south-to-east`
---
---`west-to-none`
---
---`none-to-east`
---
---`east-to-none`
---
---`none-to-west`
---
---`north-to-none`
---
---`none-to-south`
---
---`south-to-none`
---
---`none-to-north`
---@alias CliffOrientation string

---@class ItemStackLocation
---@field inventory DefinesInventory
---@field slot uint

---@class VehicleAutomaticTargetingParameters
---@field auto_target_without_gunner boolean
---@field auto_target_with_gunner boolean

---`game-effect`
---
---`gui-effect`
---
---`ambient`
---
---`environment`
---
---`walking`
---
---`alert`
---
---`wind`
---@alias SoundType string Defines which slider in the game's sound settings affects the volume of this sound. Furthermore, some sound types are mixed differently than others, e.g. zoom level effects are applied.

---@class ItemPrototypeFilterPlaceResult
---@field elem_filters EntityPrototypeFilter[] Filters for the place result.

---@class ItemPrototypeFilterBurntResult
---@field elem_filters ItemPrototypeFilter[] Filters for the burnt result.

---@class ItemPrototypeFilterPlaceAsTile
---@field elem_filters TilePrototypeFilter[] Filters for the placed tile.

---@class ItemPrototypeFilterPlacedAsEquipmentResult
---@field elem_filters EquipmentPrototypeFilter[] Filters for the placed equipment.

---@class ItemPrototypeFilterName For use within nested filters such as the `has-product-item` filter of array[[RecipePrototypeFilter](RecipePrototypeFilter)]. To get a specific prototype by name, see [LuaGameScript::item_prototypes](LuaGameScript::item_prototypes).
---@field name string | string[] The prototype name, or list of acceptable names.

---@class ItemPrototypeFilterType Usage example: ``` game.get_filtered_item_prototypes({{filter = "type", type = "armor"}}) ```
---@field type string The prototype type

---@class ItemPrototypeFilterFlag
---@field flag string One of the values in [ItemPrototypeFlags](ItemPrototypeFlags).

---@class ItemPrototypeFilterSubgroup
---@field subgroup string A [LuaGroup](LuaGroup) (subgroup) name

---@class ItemPrototypeFilterFuelCategory
---@field fuel-category string A [LuaFuelCategoryPrototype](LuaFuelCategoryPrototype) name

---@class ItemPrototypeFilterStackSize Usage example: ``` game.get_filtered_item_prototypes({{filter = "stack-size", comparison = ">", value = 20}, {filter = "stack-size", comparison = "<", value = 100, mode = "and"}}) ```
---@field comparison ComparatorString
---@field value uint The value to compare against.

---@class ItemPrototypeFilterDefaultRequestAmount
---@field comparison ComparatorString
---@field value uint The value to compare against.

---@class ItemPrototypeFilterWireCount
---@field comparison ComparatorString
---@field value uint The value to compare against.

---@class ItemPrototypeFilterFuelValue
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class ItemPrototypeFilterFuelAccelerationMultiplier
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class ItemPrototypeFilterFuelTopSpeedMultiplier
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class ItemPrototypeFilterFuelEmissionsMultiplier
---@field comparison ComparatorString
---@field value double The value to compare against.

---@alias ItemPrototypeFilter ItemPrototypeFilterPlaceResult | ItemPrototypeFilterBurntResult | ItemPrototypeFilterPlaceAsTile | ItemPrototypeFilterPlacedAsEquipmentResult | ItemPrototypeFilterName | ItemPrototypeFilterType | ItemPrototypeFilterFlag | ItemPrototypeFilterSubgroup | ItemPrototypeFilterFuelCategory | ItemPrototypeFilterStackSize | ItemPrototypeFilterDefaultRequestAmount | ItemPrototypeFilterWireCount | ItemPrototypeFilterFuelValue | ItemPrototypeFilterFuelAccelerationMultiplier | ItemPrototypeFilterFuelTopSpeedMultiplier | ItemPrototypeFilterFuelEmissionsMultiplier

---@class ModSettingPrototypeFilterType
---@field type string The prototype type

---@class ModSettingPrototypeFilterMod
---@field mod string The mod name

---@class ModSettingPrototypeFilterSettingType
---@field type string The setting scope type (startup, runtime-global, or runtime-per-user)

---@alias ModSettingPrototypeFilter ModSettingPrototypeFilterType | ModSettingPrototypeFilterMod | ModSettingPrototypeFilterSettingType

---@class TechnologyPrototypeFilterResearchUnitIngredient
---@field ingredient string The research ingredient to check.

---@class TechnologyPrototypeFilterLevel
---@field comparison ComparatorString
---@field value uint The value to compare against.

---@class TechnologyPrototypeFilterMaxLevel
---@field comparison ComparatorString
---@field value uint The value to compare against.

---@class TechnologyPrototypeFilterTime
---@field comparison ComparatorString
---@field value uint The value to compare against.

---@alias TechnologyPrototypeFilter TechnologyPrototypeFilterResearchUnitIngredient | TechnologyPrototypeFilterLevel | TechnologyPrototypeFilterMaxLevel | TechnologyPrototypeFilterTime

---@class DecorativePrototypeFilterCollisionMask
---@field mask CollisionMask | CollisionMaskWithFlags
---@field mask_mode string How to filter: `"collides"` or `"layers-equals"`

---@alias DecorativePrototypeFilter DecorativePrototypeFilterCollisionMask

---@class AchievementPrototypeFilterType
---@field type string The prototype type

---@alias AchievementPrototypeFilter AchievementPrototypeFilterType

---@class FluidPrototypeFilterName For use within nested filters such as the `has-product-fluid` filter of array[[RecipePrototypeFilter](RecipePrototypeFilter)]. To get a specific prototype by name, see [LuaGameScript::fluid_prototypes](LuaGameScript::fluid_prototypes).
---@field name string | string[] The prototype name, or list of acceptable names.

---@class FluidPrototypeFilterSubgroup
---@field subgroup string A [LuaGroup](LuaGroup) (subgroup) name

---@class FluidPrototypeFilterDefaultTemperature
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class FluidPrototypeFilterMaxTemperature
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class FluidPrototypeFilterHeatCapacity
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class FluidPrototypeFilterFuelValue
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class FluidPrototypeFilterEmissionsMultiplier
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class FluidPrototypeFilterGasTemperature
---@field comparison ComparatorString
---@field value double The value to compare against.

---@alias FluidPrototypeFilter FluidPrototypeFilterName | FluidPrototypeFilterSubgroup | FluidPrototypeFilterDefaultTemperature | FluidPrototypeFilterMaxTemperature | FluidPrototypeFilterHeatCapacity | FluidPrototypeFilterFuelValue | FluidPrototypeFilterEmissionsMultiplier | FluidPrototypeFilterGasTemperature

---@class EquipmentPrototypeFilterType
---@field type string The prototype type

---@alias EquipmentPrototypeFilter EquipmentPrototypeFilterType

---@class TilePrototypeFilterCollisionMask
---@field mask CollisionMask | CollisionMaskWithFlags
---@field mask_mode string How to filter: `"collides"` or `"layers-equals"`

---@class TilePrototypeFilterWalkingSpeedModifier
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class TilePrototypeFilterVehicleFrictionModifier
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class TilePrototypeFilterDecorativeRemovalProbability
---@field comparison ComparatorString
---@field value float The value to compare against.

---@class TilePrototypeFilterEmissions
---@field comparison ComparatorString
---@field value double The value to compare against.

---@alias TilePrototypeFilter TilePrototypeFilterCollisionMask | TilePrototypeFilterWalkingSpeedModifier | TilePrototypeFilterVehicleFrictionModifier | TilePrototypeFilterDecorativeRemovalProbability | TilePrototypeFilterEmissions

---@class RecipePrototypeFilterHasIngredientItem
---@field elem_filters ItemPrototypeFilter[] Matches if at least 1 ingredient is an item that matches these filters.

---@class RecipePrototypeFilterHasIngredientFluid Usage example: ``` -- selects recipes that consume sulfuric acid {{filter = "has-ingredient-fluid", elem_filters = {{filter = "name", name = "sulfuric-acid"}}}} ```
---@field elem_filters FluidPrototypeFilter[] Matches if at least 1 ingredient is a fluid that matches these filters.

---@class RecipePrototypeFilterHasProductItem Usage example: ``` -- selects recipes that produce an item {{filter = "has-product-item"}} -- selects recipes that produce iron plates {{filter = "has-product-item", elem_filters = {{filter = "name", name = "iron-plate"}}}} -- selects recipes that produce items that place furnaces {{filter = "has-product-item", elem_filters = {{filter = "place-result", elem_filters = {{filter = "type", type = "furnace"}}}}}} ```
---@field elem_filters ItemPrototypeFilter[] Matches if at least 1 product is an item that matches these filters.

---@class RecipePrototypeFilterHasProductFluid
---@field elem_filters FluidPrototypeFilter[] Matches if at least 1 product is a fluid that matches these filters.

---@class RecipePrototypeFilterSubgroup
---@field subgroup string A [LuaGroup](LuaGroup) (subgroup) name

---@class RecipePrototypeFilterCategory
---@field category string A [LuaRecipeCategoryPrototype](LuaRecipeCategoryPrototype) name

---@class RecipePrototypeFilterEnergy
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class RecipePrototypeFilterEmissionsMultiplier
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class RecipePrototypeFilterRequestPasteMultiplier
---@field comparison ComparatorString
---@field value uint The value to compare against.

---@class RecipePrototypeFilterOverloadMultiplier
---@field comparison ComparatorString
---@field value uint The value to compare against.

---@alias RecipePrototypeFilter RecipePrototypeFilterHasIngredientItem | RecipePrototypeFilterHasIngredientFluid | RecipePrototypeFilterHasProductItem | RecipePrototypeFilterHasProductFluid | RecipePrototypeFilterSubgroup | RecipePrototypeFilterCategory | RecipePrototypeFilterEnergy | RecipePrototypeFilterEmissionsMultiplier | RecipePrototypeFilterRequestPasteMultiplier | RecipePrototypeFilterOverloadMultiplier

---@class EntityPrototypeFilterName For use within nested filters such as the `place-result` filter of array[[ItemPrototypeFilter](ItemPrototypeFilter)]. To get a specific prototype by name, see [LuaGameScript::entity_prototypes](LuaGameScript::entity_prototypes).
---@field name string | string[] The prototype name, or list of acceptable names.

---@class EntityPrototypeFilterType Usage example: ``` game.get_filtered_entity_prototypes({{filter = "type", type = "unit"}}) ```
---@field type string The prototype type

---@class EntityPrototypeFilterCollisionMask Usage example: ``` game.get_filtered_entity_prototypes({{filter = "collision-mask", mask = "player-layer", mask_mode = "collides"}}) ```
---@field mask CollisionMask | CollisionMaskWithFlags
---@field mask_mode string How to filter: `"collides"` or `"layers-equals"`

---@class EntityPrototypeFilterFlag Usage example: ``` game.get_filtered_entity_prototypes({{filter = "flag", flag = "placeable-player"}, {filter = "flag", flag = "placeable-enemy", mode = "and"}}) ```
---@field flag string One of the values in [EntityPrototypeFlags](EntityPrototypeFlags).

---@class EntityPrototypeFilterBuildBaseEvolutionRequirement
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class EntityPrototypeFilterSelectionPriority
---@field comparison ComparatorString
---@field value uint8 The value to compare against.

---@class EntityPrototypeFilterEmissions
---@field comparison ComparatorString
---@field value double The value to compare against.

---@class EntityPrototypeFilterCraftingCategory
---@field crafting_category string Matches if the prototype is for a crafting machine with this crafting category.

---@alias EntityPrototypeFilter EntityPrototypeFilterName | EntityPrototypeFilterType | EntityPrototypeFilterCollisionMask | EntityPrototypeFilterFlag | EntityPrototypeFilterBuildBaseEvolutionRequirement | EntityPrototypeFilterSelectionPriority | EntityPrototypeFilterEmissions | EntityPrototypeFilterCraftingCategory

---@alias EventFilter any Used to filter out irrelevant event callbacks in a performant way. Available filters: - [LuaEntityClonedEventFilter](LuaEntityClonedEventFilter) - [LuaEntityDamagedEventFilter](LuaEntityDamagedEventFilter) - [LuaPlayerMinedEntityEventFilter](LuaPlayerMinedEntityEventFilter) - [LuaPreRobotMinedEntityEventFilter](LuaPreRobotMinedEntityEventFilter) - [LuaRobotBuiltEntityEventFilter](LuaRobotBuiltEntityEventFilter) - [LuaPostEntityDiedEventFilter](LuaPostEntityDiedEventFilter) - [LuaEntityDiedEventFilter](LuaEntityDiedEventFilter) - [LuaScriptRaisedReviveEventFilter](LuaScriptRaisedReviveEventFilter) - [LuaPrePlayerMinedEntityEventFilter](LuaPrePlayerMinedEntityEventFilter) - [LuaEntityMarkedForDeconstructionEventFilter](LuaEntityMarkedForDeconstructionEventFilter) - [LuaPreGhostDeconstructedEventFilter](LuaPreGhostDeconstructedEventFilter) - [LuaEntityDeconstructionCancelledEventFilter](LuaEntityDeconstructionCancelledEventFilter) - [LuaEntityMarkedForUpgradeEventFilter](LuaEntityMarkedForUpgradeEventFilter) - [LuaSectorScannedEventFilter](LuaSectorScannedEventFilter) - [LuaRobotMinedEntityEventFilter](LuaRobotMinedEntityEventFilter) - [LuaScriptRaisedDestroyEventFilter](LuaScriptRaisedDestroyEventFilter) - [LuaUpgradeCancelledEventFilter](LuaUpgradeCancelledEventFilter) - [LuaScriptRaisedBuiltEventFilter](LuaScriptRaisedBuiltEventFilter) - [LuaPlayerBuiltEntityEventFilter](LuaPlayerBuiltEntityEventFilter) - [LuaPlayerRepairedEntityEventFilter](LuaPlayerRepairedEntityEventFilter)

---@class LuaScriptRaisedReviveEventFilterType
---@field type string The prototype type

---@class LuaScriptRaisedReviveEventFilterName
---@field name string The prototype name

---@class LuaScriptRaisedReviveEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaScriptRaisedReviveEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaScriptRaisedReviveEventFilter LuaScriptRaisedReviveEventFilterType | LuaScriptRaisedReviveEventFilterName | LuaScriptRaisedReviveEventFilterGhostType | LuaScriptRaisedReviveEventFilterGhostName

---@class LuaEntityDiedEventFilterType
---@field type string The prototype type

---@class LuaEntityDiedEventFilterName
---@field name string The prototype name

---@class LuaEntityDiedEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaEntityDiedEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaEntityDiedEventFilter LuaEntityDiedEventFilterType | LuaEntityDiedEventFilterName | LuaEntityDiedEventFilterGhostType | LuaEntityDiedEventFilterGhostName

---@class LuaEntityMarkedForDeconstructionEventFilterType
---@field type string The prototype type

---@class LuaEntityMarkedForDeconstructionEventFilterName
---@field name string The prototype name

---@class LuaEntityMarkedForDeconstructionEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaEntityMarkedForDeconstructionEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaEntityMarkedForDeconstructionEventFilter LuaEntityMarkedForDeconstructionEventFilterType | LuaEntityMarkedForDeconstructionEventFilterName | LuaEntityMarkedForDeconstructionEventFilterGhostType | LuaEntityMarkedForDeconstructionEventFilterGhostName

---@class LuaPreGhostDeconstructedEventFilterType
---@field type string The prototype type

---@class LuaPreGhostDeconstructedEventFilterName
---@field name string The prototype name

---@class LuaPreGhostDeconstructedEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaPreGhostDeconstructedEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaPreGhostDeconstructedEventFilter LuaPreGhostDeconstructedEventFilterType | LuaPreGhostDeconstructedEventFilterName | LuaPreGhostDeconstructedEventFilterGhostType | LuaPreGhostDeconstructedEventFilterGhostName

---@class LuaScriptRaisedDestroyEventFilterType
---@field type string The prototype type

---@class LuaScriptRaisedDestroyEventFilterName
---@field name string The prototype name

---@class LuaScriptRaisedDestroyEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaScriptRaisedDestroyEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaScriptRaisedDestroyEventFilter LuaScriptRaisedDestroyEventFilterType | LuaScriptRaisedDestroyEventFilterName | LuaScriptRaisedDestroyEventFilterGhostType | LuaScriptRaisedDestroyEventFilterGhostName

---@class LuaUpgradeCancelledEventFilterType
---@field type string The prototype type

---@class LuaUpgradeCancelledEventFilterName
---@field name string The prototype name

---@class LuaUpgradeCancelledEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaUpgradeCancelledEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaUpgradeCancelledEventFilter LuaUpgradeCancelledEventFilterType | LuaUpgradeCancelledEventFilterName | LuaUpgradeCancelledEventFilterGhostType | LuaUpgradeCancelledEventFilterGhostName

---@class LuaPlayerRepairedEntityEventFilterType
---@field type string The prototype type

---@class LuaPlayerRepairedEntityEventFilterName
---@field name string The prototype name

---@class LuaPlayerRepairedEntityEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaPlayerRepairedEntityEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaPlayerRepairedEntityEventFilter LuaPlayerRepairedEntityEventFilterType | LuaPlayerRepairedEntityEventFilterName | LuaPlayerRepairedEntityEventFilterGhostType | LuaPlayerRepairedEntityEventFilterGhostName

---@class LuaEntityMarkedForUpgradeEventFilterType
---@field type string The prototype type

---@class LuaEntityMarkedForUpgradeEventFilterName
---@field name string The prototype name

---@class LuaEntityMarkedForUpgradeEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaEntityMarkedForUpgradeEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaEntityMarkedForUpgradeEventFilter LuaEntityMarkedForUpgradeEventFilterType | LuaEntityMarkedForUpgradeEventFilterName | LuaEntityMarkedForUpgradeEventFilterGhostType | LuaEntityMarkedForUpgradeEventFilterGhostName

---@class LuaPostEntityDiedEventFilterType
---@field type string The prototype type

---@alias LuaPostEntityDiedEventFilter LuaPostEntityDiedEventFilterType

---@class LuaPreRobotMinedEntityEventFilterType
---@field type string The prototype type

---@class LuaPreRobotMinedEntityEventFilterName
---@field name string The prototype name

---@class LuaPreRobotMinedEntityEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaPreRobotMinedEntityEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaPreRobotMinedEntityEventFilter LuaPreRobotMinedEntityEventFilterType | LuaPreRobotMinedEntityEventFilterName | LuaPreRobotMinedEntityEventFilterGhostType | LuaPreRobotMinedEntityEventFilterGhostName

---@class LuaEntityClonedEventFilterType
---@field type string The prototype type

---@class LuaEntityClonedEventFilterName
---@field name string The prototype name

---@class LuaEntityClonedEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaEntityClonedEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaEntityClonedEventFilter LuaEntityClonedEventFilterType | LuaEntityClonedEventFilterName | LuaEntityClonedEventFilterGhostType | LuaEntityClonedEventFilterGhostName

---@class LuaScriptRaisedBuiltEventFilterType
---@field type string The prototype type

---@class LuaScriptRaisedBuiltEventFilterName
---@field name string The prototype name

---@class LuaScriptRaisedBuiltEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaScriptRaisedBuiltEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaScriptRaisedBuiltEventFilter LuaScriptRaisedBuiltEventFilterType | LuaScriptRaisedBuiltEventFilterName | LuaScriptRaisedBuiltEventFilterGhostType | LuaScriptRaisedBuiltEventFilterGhostName

---@class LuaRobotMinedEntityEventFilterType
---@field type string The prototype type

---@class LuaRobotMinedEntityEventFilterName
---@field name string The prototype name

---@class LuaRobotMinedEntityEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaRobotMinedEntityEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaRobotMinedEntityEventFilter LuaRobotMinedEntityEventFilterType | LuaRobotMinedEntityEventFilterName | LuaRobotMinedEntityEventFilterGhostType | LuaRobotMinedEntityEventFilterGhostName

---@class LuaPrePlayerMinedEntityEventFilterType
---@field type string The prototype type

---@class LuaPrePlayerMinedEntityEventFilterName
---@field name string The prototype name

---@class LuaPrePlayerMinedEntityEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaPrePlayerMinedEntityEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaPrePlayerMinedEntityEventFilter LuaPrePlayerMinedEntityEventFilterType | LuaPrePlayerMinedEntityEventFilterName | LuaPrePlayerMinedEntityEventFilterGhostType | LuaPrePlayerMinedEntityEventFilterGhostName

---@class LuaRobotBuiltEntityEventFilterType
---@field type string The prototype type

---@class LuaRobotBuiltEntityEventFilterName
---@field name string The prototype name

---@class LuaRobotBuiltEntityEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaRobotBuiltEntityEventFilterGhostName
---@field name string The ghost prototype name

---@class LuaRobotBuiltEntityEventFilterForce
---@field force string The entity force

---@alias LuaRobotBuiltEntityEventFilter LuaRobotBuiltEntityEventFilterType | LuaRobotBuiltEntityEventFilterName | LuaRobotBuiltEntityEventFilterGhostType | LuaRobotBuiltEntityEventFilterGhostName | LuaRobotBuiltEntityEventFilterForce

---@class LuaEntityDeconstructionCancelledEventFilterType
---@field type string The prototype type

---@class LuaEntityDeconstructionCancelledEventFilterName
---@field name string The prototype name

---@class LuaEntityDeconstructionCancelledEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaEntityDeconstructionCancelledEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaEntityDeconstructionCancelledEventFilter LuaEntityDeconstructionCancelledEventFilterType | LuaEntityDeconstructionCancelledEventFilterName | LuaEntityDeconstructionCancelledEventFilterGhostType | LuaEntityDeconstructionCancelledEventFilterGhostName

---@class LuaPlayerBuiltEntityEventFilterType
---@field type string The prototype type

---@class LuaPlayerBuiltEntityEventFilterName
---@field name string The prototype name

---@class LuaPlayerBuiltEntityEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaPlayerBuiltEntityEventFilterGhostName
---@field name string The ghost prototype name

---@class LuaPlayerBuiltEntityEventFilterForce
---@field force string The entity force

---@alias LuaPlayerBuiltEntityEventFilter LuaPlayerBuiltEntityEventFilterType | LuaPlayerBuiltEntityEventFilterName | LuaPlayerBuiltEntityEventFilterGhostType | LuaPlayerBuiltEntityEventFilterGhostName | LuaPlayerBuiltEntityEventFilterForce

---@class LuaPlayerMinedEntityEventFilterType
---@field type string The prototype type

---@class LuaPlayerMinedEntityEventFilterName
---@field name string The prototype name

---@class LuaPlayerMinedEntityEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaPlayerMinedEntityEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaPlayerMinedEntityEventFilter LuaPlayerMinedEntityEventFilterType | LuaPlayerMinedEntityEventFilterName | LuaPlayerMinedEntityEventFilterGhostType | LuaPlayerMinedEntityEventFilterGhostName

---@class LuaEntityDamagedEventFilterType
---@field type string The prototype type

---@class LuaEntityDamagedEventFilterName
---@field name string The prototype name

---@class LuaEntityDamagedEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaEntityDamagedEventFilterGhostName
---@field name string The ghost prototype name

---@class LuaEntityDamagedEventFilterOriginalDamageAmount
---@field comparison ComparatorString
---@field value float The value to compare against.

---@class LuaEntityDamagedEventFilterFinalDamageAmount
---@field comparison ComparatorString
---@field value float The value to compare against.

---@class LuaEntityDamagedEventFilterDamageType
---@field type string A [LuaDamagePrototype](LuaDamagePrototype) name

---@class LuaEntityDamagedEventFilterFinalHealth
---@field comparison ComparatorString
---@field value float The value to compare against.

---@alias LuaEntityDamagedEventFilter LuaEntityDamagedEventFilterType | LuaEntityDamagedEventFilterName | LuaEntityDamagedEventFilterGhostType | LuaEntityDamagedEventFilterGhostName | LuaEntityDamagedEventFilterOriginalDamageAmount | LuaEntityDamagedEventFilterFinalDamageAmount | LuaEntityDamagedEventFilterDamageType | LuaEntityDamagedEventFilterFinalHealth

---@class LuaSectorScannedEventFilterType
---@field type string The prototype type

---@class LuaSectorScannedEventFilterName
---@field name string The prototype name

---@class LuaSectorScannedEventFilterGhostType
---@field type string The ghost prototype type

---@class LuaSectorScannedEventFilterGhostName
---@field name string The ghost prototype name

---@alias LuaSectorScannedEventFilter LuaSectorScannedEventFilterType | LuaSectorScannedEventFilterName | LuaSectorScannedEventFilterGhostType | LuaSectorScannedEventFilterGhostName
