global record LuaPlayer 
    get_main_inventory: function(): LuaInventory
    create_local_flying_text: function(text: any)
    mod_settings: {string: ModSetting}
end

global interface ModSetting
    value: any
end

global interface LuaInventory
    -- is {LuaItemStack}
    is {ItemCountWithQuality}
    get_contents: function(): {ItemCountWithQuality}
    remove: function(items: ItemCountWithQuality): integer
    insert: function(items: ItemCountWithQuality): integer
    clear: function()
end

global record LuaEntity
    name: string
    get_module_inventory: function(): LuaInventory
    surface: LuaSurface
    position: MapPosition
    force: LuaForce
    destroy: function(player?: LuaPlayer)
end

global record LuaItemRequestProxyEntity is LuaEntity
    where self.name == "request-item-proxy"
    proxy_target: LuaEntity
    insert_plan: {BlueprintInsertPlan}
    removal_plan: {BlueprintInsertPlan}
    item_requests: {ItemCountWithQuality}
end


global record LuaSurface
    create_entity: function(entity: CreateEntityParams): LuaEntity
    spill_item_stack: function(stack: any)
    find_entities_filtered: function<E is LuaEntity>(params: any): {E}
end

global interface CreateEntityParams
    name: string
    position: MapPosition
    player: LuaPlayer
    force: LuaForce
    target: LuaEntity
    modules: {BlueprintInsertPlan}
end

global type MapPosition = interface
    x: number
    y: number
end

global record LuaForce

end

global interface BlueprintInsertPlan
    id: ItemIDAndQualityIDPair
    items: ItemInventoryPositions
end

global interface ItemIDAndQualityIDPair
    name: ItemIDAndQualityIDPair
    quality: QualityPrototypeName
end

global interface ItemInventoryPositions
    in_inventory: {InventoryPosition}
    grid_count: integer
end

global interface InventoryPosition
    inventory: any -- TODO: defines.inventory ???
    stack: integer
    count: integer
end

-- global type ItemStackIdentification = SimpleItemStack

-- global type SimpleItemStack = string | ItemStackDefinition

global record LuaItemStack

end

global interface ItemCountWithQuality
    name: string
    count: integer
    quality: QualityPrototypeName
end

-- global type ItemStackDefinition = interface
--     name: string
--     count: integer
--     quality: QualityPrototypeName
-- end
-- TODO: separate the type, but allow assignment
-- global type ItemStackDefinition = ItemCountWithQuality

-- factorio_pairs_override.d.tl

global type QualityPrototypeName = string

global record game
    print: function(message: string)
    create_inventory: function(slots: integer): LuaInventory
    players: {LuaPlayer}
end

global record serpent
    block: function(object: any): string
end

global record prototypes
    item: {string: Prototype}
end

global interface Prototype
    type: string
end

global record script
    on_event: function(event: any, action: function(event: Event))
end

global interface Event
    player_index: integer
    source: LuaEntity
    destination: LuaEntity
end

global record defines
    events: {string: any}
end

global record data
    extend: function(any, any)
    raw: {string: {LuaEntityPrototype}}
end

global record LuaEntityPrototype
    name: string
    additional_pastable_entities: {LuaEntityPrototype | string}
end
