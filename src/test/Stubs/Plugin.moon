-- Static variable
commands = {}

class Plugin
    addCommand: (params, func) ->
        commands[func] = params

    getStorageObject: () ->
        nil

    --
    -- For testing
    -- 

    -- Get all registered commands
    getCommands: () ->
        return commands

    -- Reset state
    reset: () ->
        commands = {}

return Plugin