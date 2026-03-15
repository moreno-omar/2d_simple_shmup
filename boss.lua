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

-- fix into place. Set mass so it can be moved by player input, but not by bullet or border
boss.fixture = love.physics.newFixture(boss.body, boss.shape, 1)

-- boss.body:setLinearDamping(0)

--[[

Disregard for now.

-- keep boss in border
boss.begin_contact = function (self, cx, cy)
    local x, y = cx, cy

    -- simple collision response, move boss back within border
    if x < 20 then
        self.body:setPosition(20, y)
    elseif x > 380 then
        self.body:setPosition(380, y)
    elseif y < 20 then
        self.body:setPosition(x, 20)
    elseif y > 460 then
        self.body:setPosition(x, 460)
    end

end
--]]

return boss
