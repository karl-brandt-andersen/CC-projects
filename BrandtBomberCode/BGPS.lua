
--Code to go from turtle position, to target position

-- function getOrientation      "compass"
-- move(amount of blocks, direction)       "dig if anything is in the way of the direction"
-- log()


function log()

end

function router(x,y,z)

end

function move(direction, blocks) --auto dig away, check coordinates for amount moved via gps, check if stuck and report via rednet 
    
end

function getGPS()

    local x,y,z = gps.locate(2, false)

    if (x and y and z) then
        print("gps:" .. x .. " " .. y .. " " .. z)
        return x,y,z    
    else
        print("Failed to locate GPS coordinates")
        return nil, nil, nil
    end
    
end

function getOrientation()

    local posMem1 = {x=0, y=0, z=0}
    local posMem2 = {x=0, y=0, z=0}
    local ret = ""

    posMem1.x, posMem1.y, posMem1.z = getGPS()
    print("Test 1 " .. posMem1.x .. " " .. posMem1.y .. " " .. posMem1.z)

    turtle.forward() --change to move
    turtle.forward()
    turtle.forward()

    posMem2.x, posMem2.y, posMem2.z = getGPS()
    print("Test 2 " .. posMem2.x .. " " .. posMem2.y .. " " .. posMem2.z)

    if (posMem1.x > posMem2.x) then
        ret = "x"
    elseif (posMem1.x < posMem2.x) then
        ret = "-x"
    elseif (posMem1.z > posMem2.z) then
        ret = "z"
    elseif (posMem1.z < posMem2.z) then
        ret = "-z"
    else then
        ret = "Error orientation"
    end

    turtle.back()
    turtle.back()
    turtle.back()

    return(ret)
end

local a, b, c = getGPS()

print(a .. " " .. b .. " " .. c)
print(getOrientation())
