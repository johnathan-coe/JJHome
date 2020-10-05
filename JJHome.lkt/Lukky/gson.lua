local gson =  {}
gson.Gson = newInstance("com.google.gson.Gson", {})

-- Decode json to a java object given the name of its class
function gson.decode(obj, className)
    return gson.Gson:fromJson(obj, import(className))
end

return gson