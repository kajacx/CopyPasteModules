global record LuaPlayer 
    get_main_inventory: function(): LuaInventory
    create_local_flying_text: function(text: any)
end

global record LuaInventory
    is {LuaItemStack}
    get_contents: function(): {ItemCountWithQuiality}
    remove: function(items: ItemStackDefinition): integer
    insert: function(items: ItemStackDefinition): integer
end

global record LuaEntity
    get_module_inventory: function(): LuaInventory
end

-- global type ItemStackIdentification = SimpleItemStack

-- global type SimpleItemStack = ItemStackPrototypeName | ItemStackDefinition

global record LuaItemStack

end

global interface ItemCountWithQuiality
    name: ItemStackPrototypeName
    count: integer
    quality: QualityPrototypeName
end

-- global type ItemStackDefinition = record
--     name: ItemStackPrototypeName
--     count: integer
--     quality: QualityPrototypeName
-- end
-- TODO: separate the type, but allow assignment
global type ItemStackDefinition = ItemCountWithQuiality

global type ItemStackPrototypeName = string

global type QualityPrototypeName = string


global record game
    print: function(message: string)
    create_inventory: function(slots: integer): LuaInventory
end
