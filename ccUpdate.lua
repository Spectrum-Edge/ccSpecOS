-- Get github version of startup (write mode w overwrites any existing content)
local function updateFile(fileName, url)
    local handle = http.get(url)
    local content = handle.readAll()
    local file = fs.open(fileName,"w")
    file.write(content)
    file.close()
    handle.close()
end

-- Get github version of update (write mode w overwrites any existing content)
updateFile("startup", "https://raw.githubusercontent.com/Spectrum-Edge/ccSpecOS/main/ccStartup.lua")
updateFile("update", "https://raw.githubusercontent.com/Spectrum-Edge/ccSpecOS/main/ccUpdate.lua")

-- Rai's IRC thing
-- Look mom I'm on Spectrums GitHub repos
updateFile("IRC", "https://protogen.lol/cdn/IRC.lua")
