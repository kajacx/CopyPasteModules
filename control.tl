local copy_modules_into = require("functions/copy_modules_into")

--- EVENTS ---

script.on_event({ defines.events.on_entity_settings_pasted },
  function(event: Event)
    local player = game.players[event.player_index]

    -- check if functionality is enabled
    if not player or not player.mod_settings["kajacx_copy-paste-modules_enable"].value then
      return -- do nothing
    end

    local source_inventory = event.source and event.source.get_module_inventory()
    local target = event.destination
    if not source_inventory or not target then
      return
    end

    local create_request = player.mod_settings["kajacx_copy-paste-modules_enable-request"].value;
    copy_modules_into(source_inventory, target, player, true, create_request as boolean)
  end
)
