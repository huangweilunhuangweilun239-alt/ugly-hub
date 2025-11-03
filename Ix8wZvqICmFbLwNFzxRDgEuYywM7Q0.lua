local HttpGetFunction = game.HttpGet
local LoadString = loadstring

local function HttpGet(Url)
    if not Url or type(Url) ~= "string" then
        return ""
    end

    local Success, Response = pcall(HttpGetFunction, game, Url)

    return (Success and type(Response) == "string" and #Response > 0) and Response or ""
end

local Places = {
    [126509999114328] = "https://api.luarmor.net/files/v3/loaders/67321ef983ac3626a0ad87d7aae33ed4.lua"
}

local function Loader()
    local CurrentPlaceId = game.PlaceId
    local ScriptUrl = Places[CurrentPlaceId]

    if not ScriptUrl then 
        return 
    end

    local ScriptContent = HttpGet(ScriptUrl)
    
    if not ScriptContent then 
        return 
    end

    local Chunk = LoadString(ScriptContent)
    
    if not Chunk then
        return
    end
    
    Chunk()
end

Loader()
