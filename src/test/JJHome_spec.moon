require("lukkit_stubs")
JJHome = require("JJHome")
Plugin = require("Stubs.Plugin")

Plugin.reset()
jjHome = JJHome(Plugin)

describe "<JJHome>", ->
    it "Check if /home and /sethome are bound", ->
      hasHome = false
      hasSethome = false

      for params, _ in pairs(Plugin.getCommands())
        hasHome = true if params.name == "home"
        hasSethome = true if params.name == "sethome"

      assert.True(hasHome, "/home command not present!")
      assert.True(hasSethome, "/sethome command not present!")

    it "Try to go home for a user without one", ->
      -- Create event stub
      event = {getSender: -> 
        {
          getName: => "anon",
          teleport: => assert.True(false, "The user should not be teleported!"),
          sendMessage: (msg) => assert.are.equal("Home Not Set!", msg, "Message to the user was incorrect!")
        }
      }

      -- Try go home
      jjHome\home(event)

    it "Set a user's home", ->
      -- Create event stub
      event = {getSender: -> 
        {
          getName: => "anon",
          getLocation: => {
            serialize: =>
              "anon's location"
          }
          sendMessage: (msg) => {
            assert.are.equal("Set Home!", msg, "Unexpected message to user!")
          }
        }
      }

      -- Try to set home
      jjHome\setHome(event)
      
      homes = Plugin.getStorageObject("homes.json")
      assert.True(homes\exists("anon"), "Home not set!")
      assert.are.equal("anon's location", homes\getValue("anon"), "Correct location not saved!")
      assert.False(homes.unsaved, "Changes not persisted to disk!")
