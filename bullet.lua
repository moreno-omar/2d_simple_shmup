local world = require('world')

-- create 1 bullet
-- then loop to create other

local bullet = {}

-- bullet for interact with all, for now
-- assuming initial position, (0,0) shouldn't matter if moved later
bullet.body = love.physics.newBody(world, 0, 0, dynamic)

-- bullet is polygon with 1 vertex
bullet.shape = love.physics.PolygonShape(0, 0)

-- fix into place
bullet.fixture = love.physics.newFixture(bullet.body, bullet.shape)


return bullet
