local MovingPlatform = {}
local part = nil
local maxPos = Vector3.new(5, 2, 0)
local minPos = Vector3.new(5, -2, 0)
local initPos = Vector3.new(5, 0, 0)
local speed = 0.05
local nextPosition = nil
local intervalVector = nil
local timer = nil

local function Move()
  local dist = Vector3.Distance(part.WorldPosition, nextPosition)
  
  if dist < 0.5 then
    local isMinPos = nextPosition == minPos
    nextPosition = isMinPos and maxPos or minPos
    local dir = nextPosition - part.WorldPosition
    intervalVector = dir.Normalized * speed
  else
    part.WorldPosition = part.WorldPosition + intervalVector
  end
  
end  

function MovingPlatform:Start(map)
  part = map.Root:FindFirstChild("MovingPlatform", true)
  part.WorldPosition = initPos
  
  nextPosition = minPos
  local dir = nextPosition - part.WorldPosition
  intervalVector = dir.Normalized * speed
  
  timer = Timer.new(1, Move)
  timer.Loop = true
  timer:Start()

end

return MovingPlatform