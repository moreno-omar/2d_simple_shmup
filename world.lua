-- to create world where bullet interacts
-- first with border
-- then with player

-- world without gravity
local world = love.physics.newWorld(0, 0)

-- world:setCallbacks / for collision detection
-- only do for beginContact
-- Four Lua functions can be given as arguments. The value nil removes a function. 

local function beginContact(a, b, collison)
    -- figure out which fixture is which
    local nameA = a:getUserData()
    local nameB = b:getUserData()
    print("Collision detected!")

    local x1, y1, x2, y2 = collison:getPositions()

    -- call collision function for each boss fixture
    if nameA == "boss" then
        nameA:begin_contact(x1, y1)
        print("Collision detected!")
    elseif nameB == "boss" then
        nameB:begin_contact(x2, y2)
    else
        return
    end
end

world:setCallbacks(beginContact, nil, nil, nil)

return world
