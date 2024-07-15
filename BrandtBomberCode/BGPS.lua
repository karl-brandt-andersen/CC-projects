
local target = {x=-40, y=200, z=-105}  --target




--Code to go from turtle position, to target position

-- function getOrientation      "compass"
-- move(amount of blocks, direction)       "dig if anything is in the way of the direction"
-- log()

print(getGPS())
print(getOrientation())

function log()

end

function router(x,y,z)

end

function move(direction, blocks) --auto dig away, check coordinates for amount moved via gps, check if stuck and report via rednet 
    
end

function getGPS()

    local pos = {x=0, y=0, z=0} --turtle position

    pos = gps.locate(2, false)

    if (pos) then
        return(pos)    
    else
        print("Failed to locate GPS coordinates")
        return
    end
    
end

function getOrientation()

    local posMem1 = {x=0, y=0, z=0}
    local posMem2 = {x=0, y=0, z=0}
    local ret = "no GPS"

    posMem1 = getGPS()

    turtle.forward()

    posMem2 = getGPS()
    
    if (posMem1.x > posMem2.x) then
        ret = "x"
    elseif (posMem1.x < posMem2.x) then
        ret = "-x"
    elseif (posMem1.z > posMem2.z) then
        ret = "z"
    elseif (posMem1.z < posMem2.z) then
        ret = "-z"
    end

    turtle.back()

    return(ret)
end

