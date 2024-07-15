--[[
Brandt Bomber Code (BBC)
For fixing headaches and non destroyed building
]]--

local location = {x=-40, y=200, z=-105}

-- Initialize pos with zeros
local pos = {x=0, y=0, z=0}

-- Get the GPS location
local x,y,z = gps.locate(2, false)

if (x and y and z) then
    pos.x = x
    pos.y = y
    pos.z = z
    print("Turtle coordinates: x=" .. pos.x .. ", y=" .. pos.y .. ", z=" .. pos.z)
else
    print("Failed to locate GPS coordinates")
    return
end



-- Move turtle along the x-axis
if pos.x > location.x then
    for i = pos.x, location.x, -1 do
        turtle.forward()
        print(pos.x .. " " .. location.x)
    end
else
    for i = pos.x, location.x, 1 do
        turtle.back()
        print(pos.x .. " " .. location.x)
    end
end

-- Move turtle along the y-axis
if pos.y > location.y then
    for i = pos.y, location.y, -1 do
        turtle.down()
        print(pos.y .. " " .. location.y)
    end
else
    for i = pos.y, location.y, 1 do
        turtle.up()
        print(pos.y .. " " .. location.y)
    end
end

-- Turn the turtle to move along the z-axis
turtle.turnRight()

-- Move turtle along the z-axis
if pos.z > location.z then
    for i = pos.z, location.z, -1 do
        turtle.forward()
        print(pos.z .. " " .. location.z)
    end
else
    for i = pos.z, location.z, 1 do
        turtle.back()
        print(pos.z .. " " .. location.z)
    end
end
