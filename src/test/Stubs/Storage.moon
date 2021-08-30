class Storage
    new: (filename) =>
        @filename = filename
        @values = {}
        @unsaved = false

    exists: (key) =>
        @values[key] != nil

    getValue: (key) =>
        @values[key]

    setValue: (key, value) =>
        @values[key] = value
        @unsaved = true

    save: =>
        @unsaved = false

return Storage