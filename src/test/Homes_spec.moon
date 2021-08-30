require("test.Stubs.globals")
Homes = require("Homes")
Plugin = require("test.Stubs.Plugin")

describe "<Homes>", ->
    before_each ->
      Plugin.reset()

    it "Check that getting a home fails for empty storage", ->
      homes = Homes(Plugin.getStorageObject("homes.json"))
      assert.True(homes\getHomeFor("anon") == nil)

    it "Check that setting a home saves to storage", ->
      storage = Plugin.getStorageObject("homes.json")
      homes = Homes(storage)

      location = {
        serialize: =>
          "anon's location"
      }

      homes\setHomeFor("anon", location)

      assert.True(storage\exists("anon"))
      assert.are.equal("anon's location", storage\getValue("anon"))
      assert.False(storage.unsaved)
