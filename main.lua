-- purpose: create simple play area
-- to do later:
--      move resolution to conf.lua

-- loading world
local world = require('world')

-- use percentage of resolution for position of others
-- allowing variables to be accessed by functions in file
-- not global. won't get problems with other files with same variable names

local width = 360
local length = 480
local offset = 20
local boss_pos_x = (width + offset) / 2
local boss_pos_y = (length + offset) / 8
local y = 0

function love.draw()
    -- include offset, since 0,0 is top left of screen
    -- dimensions are 360x480
    love.graphics.rectangle("line", 20, 20, 360, 480)

    --[[ use percentage of resolution for position of others
    width = 360
    length = 480
    offset = 20
    boss__pos_x = (width + offset) / 2
    boss_pos_y = (length + offset) / 2
    --]]

    -- position first 2 after mode, size after those
    -- consider this boss, move to update later
    love.graphics.rectangle("fill", boss_pos_x, boss_pos_y, 5, 5)

    --[[ bullet going straight down
    love.graphics.circle("fill", boss_pos_x, (boss_pos_y + y), 5, 5)
    --]]

    -- radiating pattern?
    -- love.graphics.circle("line", boss_pos_x, boss_pos_y, (5 + y), 5)

    -- simple 4 point expansion
    love.graphics.points(
        {
            { (boss_pos_x + 1) + y, boss_pos_y },
            { (boss_pos_x - 1) - y, boss_pos_y },
            { (boss_pos_x),         (boss_pos_y + 1) + y },
            { (boss_pos_x),         (boss_pos_y - 1) - y }
        }
    )
end

function love.update(dt)
    -- necessary for bullets and movement
    -- for easy use, just use default dt
    -- goal: 60 fps

    -- see current dt
    -- print(dt)

    -- move down only, which is adding to total
    -- needs to be multiplied by rate since dt is small
    y = y + (dt * 100)

    -- love.graphics.circle("fill", boss_pos_x, (boss_pos_y - 5), 50, 5)
end
