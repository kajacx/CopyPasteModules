-- Definitions of complete types. This is the only .d.lua file that is edited manually.

---@class MapGenPreset A map gen preset. Used in [Prototype/MapGenPresets](https://wiki.factorio.com/Prototype/MapGenPresets).
---@field order string Specifies the ordering the map generator gui.
---@field default boolean Whether this is the default preset. If set to boolean, this preset may not have any other properties besides this and order.
---@field basic_settings MapGenSettings This is a table with the below key/value pairs. All key/value pairs are optional. If not set they will just use the default values.
---@field advanced_settings any TODO: add advanced settings

--- The compatible type of filter is determined by elem_type:
---
--- Type `"item"` - `ItemPrototypeFilter`
---
--- Type `"tile"` - `TilePrototypeFilter`
---
--- Type `"entity"` - `EntityPrototypeFilter`
---
--- Type `"signal"` - Does not support filters
--- 
--- Type `"fluid"` - `FluidPrototypeFilter`
---
--- Type `"recipe"` - `RecipePrototypeFilter`
---
--- Type `"decorative"` - `DecorativePrototypeFilter`
---
--- Type `"item-group` - Does not support filters
---
--- Type `"achievement"` - `AchievementPrototypeFilter`
---
--- Type `"equipment"` - `EquipmentPrototypeFilter`
---
--- Type `"technology"` - `TechnologyPrototypeFilter`
---
---@alias PrototypeFilter ItemPrototypeFilter | TilePrototypeFilter | EntityPrototypeFilter | FluidPrototypeFilter | RecipePrototypeFilter | DecorativePrototypeFilter | AchievementPrototypeFilter | EquipmentPrototypeFilter | TechnologyPrototypeFilter

--- Object containing information about the connections to other entities formed by red or green wires.
--- [View Documentation](https://wiki.factorio.com/Blueprint_string_format#Connection_object).
---
--- First element is the first connection point. The default for everything that doesn't have multiple connection points.
---
--- Second element is the second connection point. For example, the "output" part of an arithmetic combinator.
---@alias BlueprintCircuitConnection BlueprintConnectionPoint[]

--- The actual point where a wire is connected to. Contains information about where it is connected to.
--- [View Documentation](https://wiki.factorio.com/Blueprint_string_format#Connection_point_object).
---@class BlueprintConnectionPoint
--- An array of `BlueprintConnectionData` containing all the connections from this point created by red wire.
---@field red BlueprintConnectionData[]
--- An array of `BlueprintConnectionData` containing all the connections from this point created by green wire.
---@field green BlueprintConnectionData[]

--- Information about a single connection between two connection points.
--- [View Documentation](https://wiki.factorio.com/Blueprint_string_format#Connection_data_object)
---@class BlueprintConnectionData
--- ID of the entity this connection is connected with.
---@field entity_id uint
--- The circuit connector id of the entity this connection is connected to.
---@field circuit_id DefinesCircuitConnectorId

--- TODO: Add types to this
---@alias BlueprintControlBehavior any

--- TODO: Add types to this
---@alias prototypes any

--- TODO: Add types to this
---@class Data
---@field raw table<string, any[]>
--- The `data` table expects a specific format for each item in the table. Missing properties will either fall back to
--- default values or give an error indicating what's missing. Extra properties that the game isn't looking for are
--- simply ignored.
---@field extend fun(prototypes: any[])
