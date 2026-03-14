-- to create world where bullet interacts
-- first with border
-- then with player

-- world without gravity
local world = love.physics.newWorld(0, 0)

-- world:setCallbacks / for collision detection
-- only do for beginContact
-- Four Lua functions can be given as arguments. The value nil removes a function. 

function beginContact(a, b, coll)
    print("Collision detected!")
end

world:setCallbacks(beginContact, nil, nil, nil)

return world
