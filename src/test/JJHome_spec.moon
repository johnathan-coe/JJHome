require("lukkit_stubs")
JJHome = require("JJHome")
Plugin = require("Stubs.Plugin")

describe "JJHome", ->
    it "Check if Commands are Bound", ->
      Plugin.reset()

      -- Create a new JJHome object
      JJHome(Plugin)
      
      hasHome = false
      hasSethome = false

      -- Ensure that sethome and home are bound
      for _, params in pairs(Plugin.getCommands())
        hasHome = true if params.name == "home"
        hasSethome = true if params.name == "sethome"

      assert.True(hasHome)
      assert.True(hasSethome)
