{
    whitelist_globals: {
      ["."]: {
        "logger", "plugin", "newInstance" -- Lukkit
        "javaImport" -- main.lua
      },
      ["test/*"]: {
        "describe", "it", "before_each", "setup"
      }
    }
  }