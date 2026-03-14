local world = require('world')

-- create 1 bullet
-- then loop to create other

local boss = {}

-- bullet for interact with all, for now
-- assuming initial position, (0,0) shouldn't matter if moved later
boss.body = love.physics.newBody(world, 0, 0, 'dynamic')

-- boss is a circle with centerpoint coordinatinates (x,y) and radius
-- easier to do circle than newPolygonShape and adding all those points
boss.shape = love.physics.newCircleShape(0, 0, 10)

-- fix into place
boss.fixture = love.physics.newFixture(boss.body, boss.shape)




return boss
