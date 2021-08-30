assert = require("luassert")
Storage = require("Stubs.Storage")

-- Static variables
storageObjects = {}
commands = {}

class Plugin
    addCommand: (params, func) ->
        -- TODO: Check that func accepts a single arg
        assert.False(params.name == nil, "No name for command!")
        assert.False(func == nil, "Command callback was nil!")
        commands[params] = func

    getStorageObject: (file) ->
        assert.False(string.len(file) == 0, "Storage object filename was empty!")
        
        if storageObjects[file] == nil
            storageObjects[file] = Storage(file)

        return storageObjects[file]

    -- Methods below this are for testing purposes

    -- Get all registered commands
    getCommands: ->
        return commands

    -- Reset state
    reset: ->
        commands = {}
        storageObjects = {}

return Plugin