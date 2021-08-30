Homes = require "Homes"

class JJHome
    new: (p) =>
        -- Get homes from storage
        @homes = Homes(p.getStorageObject("homes.json"))

        -- Bind to plugin
        p.addCommand({name: "home", description: "Go Home", runAsync: false}, self\home)
        p.addCommand({name: "sethome", description: "Set Home", runAsync: true}, self\setHome)               

        -- Notify user
        logger.info("Setup JJHome!")

    home: (e) =>
        sender = e.getSender()
        location = @homes\getHomeFor(sender\getName())

        if location == nil
            sender\sendMessage("Home Not Set!")
        else
            sender\teleport(location)

    setHome: (e) =>
        sender = e.getSender()
        success = @homes\setHomeFor(sender\getName(), sender\getLocation())
        sender\sendMessage(if success then "Set Home!" else "Failed to Set Home!")

-- Create a new JJHome object, injecting plugin
JJHome(plugin)