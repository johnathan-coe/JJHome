Location = require "Location"

-- Manages home locations for users
class Homes
    -- New instance bound to a Lukkit storage object
    new: (storageObject) =>
        @storageObject = storageObject

    -- Get the home Location for the user given their name
    getHomeFor: (name) =>
        if @storageObject\exists(name)
            return Location.fromJSON(@storageObject\getValue(name))
        else
            return nil

    -- Set the home Location for the user given their name
    setHomeFor: (name, location) =>
        -- Serialize Location to Map
        map = location\serialize() 
        
        -- Save to disk
        success = @storageObject\setValue(name, map)
        @storageObject\save()

        return success

return Homes