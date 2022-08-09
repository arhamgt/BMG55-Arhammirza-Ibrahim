print('script_server:hello world')

local movingPlatform = require "script_server.movingPlatform"
local map = World:GetStaticMap("Map001")

local timer = Timer.new(160, function()
    movingPlatform:Start(map)
    
end)

timer:Start()



