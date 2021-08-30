require "Location"

export class Homes
    new: (storageObject) =>
        @storageObject = storageObject

    getHomeFor: (name) =>
        if @storageObject\exists(name)
            return fromJSON(@storageObject\getValue(name))
        else
            return nil

    setHomeFor: (name, location) =>
        -- Serialize Location to Map
        map = location\serialize() 
        
        -- Save to disk
        success = @storageObject\setValue(name, map)
        @storageObject\save()

        return success
