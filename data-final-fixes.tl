--- Inspired by the "Copy & Paste Modules" 0.15 mod (https://mods.factorio.com/mod/copy-and-paste-modules) ---
local mypairs = require("helpers/mypairs")

-- Make these entities copy pastable
local to_make_copiable = { "furnace", "lab", "beacon" }
for _,name in mypairs(to_make_copiable) do
	local rawEntities = data.raw[name] -- get all entities of this type

	local entities = {} -- save names of those entities
	for _, entity in mypairs(rawEntities) do
		table.insert(entities, entity.name)
	end

	for _, entity in mypairs(rawEntities) do -- and make them all be able to copy and paste into each other
		entity.additional_pastable_entities = entities
	end
end
