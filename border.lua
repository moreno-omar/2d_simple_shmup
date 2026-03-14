local world = require("world")

-- create 1 bullet
-- then loop to create other

local border = {}

-- bullet for interact with all, for now
-- assuming initial position, (0,0) shouldn't matter if moved later
border.body = love.physics.newBody(world, 0, 0, "static")


-- Define the corners of a 600x400 box relative to the body's center
-- The coordinates are: (Top-Left, Top-Right, Bottom-Right, Bottom-Left)
local x1, y1 = 20, 20
local x2, y2 = 380, 20
local x3, y3 = 380, 460
local x4, y4 = 20, 460

-- Create the ChainShape and "loop" it (connects last point to first)
border.shape = love.physics.newChainShape(true, x1, y1, x2, y2, x3, y3, x4, y4)

-- Attach the shape to the body with a "Fixture"
border.fixture = love.physics.newFixture(border.body, border.shape)

return border
