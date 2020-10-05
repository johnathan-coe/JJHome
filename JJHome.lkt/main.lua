-- External Dependencies
local decode = require("Lukky.gson").decode
local s =      require("Lukky.command_wrappers").senderName
local Location = import("$.Location")
local homes = plugin.getStorageObject("homes.json")

-- Commands
plugin.addCommand({description="Go Home", name="home"}, s(function(event, sender, name)
    if not homes:exists(name) then return sender:sendMessage("Home Not Set!") end
    local home = homes:getValue(name)           -- Get JsonObject from storage
    local map = decode(home, "java.util.Map")   -- Decode json as Map
    sender:teleport(Location:deserialize(map))  -- Deserialize to Location and move player
end))

plugin.addCommand({description="Set Home", name="sethome"}, s(function(event, sender, name)
    local map = sender:getLocation():serialize() -- Serialize Location to Map
    local success = homes:setValue(name, map)    -- Save under player name
    sender:sendMessage(success and "Set Home!" or "Failed to Set Home!")
    homes:save()
end))

plugin.addCommand({description="", name="homefor"}, s(function(event, sender, name)
    local name = event.getArgs()[1]
    if not homes:exists(name) then return sender:sendMessage("Home Not Set!") end
    local home = homes:getValue(name)           -- Get JsonObject from storage
    local map = decode(home, "java.util.Map")   -- Decode json as Map
    print(map)
end))

-- Meta
plugin.onEnable(function() logger.info("Home Plugin Enabled!") end)
plugin.onDisable(function() homes:save() end)
