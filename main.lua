-- purpose: create simple play area
-- to do later:
--      move resolution to conf.lua

-- loading world
local world = require('world')
local bullet = require('bullet')
local input_movement = require('input')
local boss = require('boss')
local border = require('border')

-- use percentage of resolution for position of others
-- allowing variables to be accessed by functions in file
-- not global. won't get problems with other files with same variable names

local width = 360
local length = 480
local offset = 20
local boss_pos_x = (width + offset) / 2
local boss_pos_y = (length + offset) / 8
local y = 0

-- Initialize the physics body to the starting position
boss.body:setPosition(boss_pos_x, boss_pos_y)

-- get center point of circle bullet
local bullet_x, bullet_y = bullet.body:getWorldCenter()

function love.draw()
    --[[ include offset, since 0,0 is top left of screen
    -- dimensions are 360x480
    love.graphics.rectangle("line", 20, 20, 360, 480)
    --]]
    love.graphics.line(border.body:getWorldPoints(border.shape:getPoints()))


    -- Draw the boss using the physics body coordinates
    -- We subtract 2.5 to center the 5x5 rectangle on the body's X/Y coordinates
    love.graphics.rectangle("fill", boss.body:getX() - 2.5, boss.body:getY() - 2.5, 5, 5)

    --[[ bullet going straight down
    love.graphics.circle("fill", boss_pos_x, (boss_pos_y + y), 5, 5)
    --]]

    -- radiating pattern?
    -- love.graphics.circle("line", boss_pos_x, boss_pos_y, (5 + y), 5)

    --[[ simple 4 point expansion
    love.graphics.points(
        {
            { (boss_pos_x + 1) + y, boss_pos_y },
            { (boss_pos_x - 1) - y, boss_pos_y },
            { (boss_pos_x),         (boss_pos_y + 1) + y },
            { (boss_pos_x),         (boss_pos_y - 1) - y }
        }
    )
    -- ]]


    love.graphics.circle('fill', bullet_x, (bullet_y + y), 10)
end

function love.update(dt)
    -- to update world
    world:update(dt)


    -- necessary for bullets and movement
    -- for easy use, just use default dt
    -- goal: 60 fps

    -- see current dt
    -- print(dt)

    -- move down only, which is adding to total
    -- needs to be multiplied by rate since dt is small
    y = y + (dt * 100)
    local rate = dt * 5000

    -- love.graphics.circle("fill", boss_pos_x, (boss_pos_y - 5), 50, 5)

    -- move boss with input
    if love.keyboard.isDown('up') then
        -- boss_pos_y = boss_pos_y + (input_movement.up * rate)
        boss.body:setLinearVelocity(0, (input_movement.up * rate))
    elseif love.keyboard.isDown('down') then
        boss.body:setLinearVelocity(0, input_movement.down * rate)
    elseif love.keyboard.isDown('left') then
        boss.body:setLinearVelocity(input_movement.left * rate, 0)
    elseif love.keyboard.isDown('right') then
        boss.body:setLinearVelocity(input_movement.right * rate, 0)
    else
        -- Stop movement when no keys are pressed
        boss.body:setLinearVelocity(0, 0)
    end
end
