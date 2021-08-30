Location = javaImport "$.Location"
Gson = newInstance("com.google.gson.Gson", {})
Map = javaImport "java.util.Map"

export fromJSON
fromJSON = (json) ->
    map = Gson\fromJson(json, Map)
    return Location\deserialize(map)
