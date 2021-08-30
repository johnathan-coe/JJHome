Loc = javaImport "$.Location"
Gson = newInstance("com.google.gson.Gson", {})
Map = javaImport "java.util.Map"

Location =
    fromJSON: (json) ->
        map = Gson\fromJson(json, Map)
        return Loc\deserialize(map)

return Location