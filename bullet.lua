local world = require('world')

-- create 1 bullet
-- then loop to create other

local bullet = {}

-- bullet for interact with all, for now
-- assuming initial position, (0,0) shouldn't matter if moved later
bullet.body = love.physics.newBody(world, 0, 0, 'dynamic')

-- bullet is a circle with centerpoint coordinatinates (x,y) and radius
bullet.shape = love.physics.newCircleShape(0, 0, 1)

-- fix into place
bullet.fixture = love.physics.newFixture(bullet.body, bullet.shape)



return bullet
