local cellSize = 16
local points = {} -- Stores clicked grid coordinates: { {x = 1, y = 2}, ... }

function love.load()
    love.window.setTitle("Grid Coordinate Editor")
end

function love.mousepressed(x, y, button)
    if button == 1 then -- Left click adds or toggles a point
        local gx = math.floor(x / cellSize)
        local gy = math.floor(y / cellSize)

        -- Check if point already exists (toggle behavior)
        local exists = false
        for i, pt in ipairs(points) do
            if pt.x == gx and pt.y == gy then
                table.remove(points, i)
                exists = true
                break
            end
        end

        if not exists then
            table.insert(points, { x = gx, y = gy })
            print(string.format("Added point: {x = %d, y = %d}", gx, gy))
        end
    elseif button == 2 then -- Right click prints full table to console
        print("--- Stored Coordinates ---")
        for i, pt in ipairs(points) do
            print(string.format("[%d] = { x = %d, y = %d }", i, pt.x, pt.y))
        end
    end
end

function love.draw()
    local width, height = love.graphics.getDimensions()

    -- 1. Draw Grid Lines
    love.graphics.setColor(0.2, 0.2, 0.2)
    for x = 0, width, cellSize do
        love.graphics.line(x, 0, x, height)
    end
    for y = 0, height, cellSize do
        love.graphics.line(0, y, width, y)
    end

    -- 2. Draw Hover Cursor
    local mx, my = love.mouse.getPosition()
    local hoverX = math.floor(mx / cellSize) * cellSize
    local hoverY = math.floor(my / cellSize) * cellSize
    love.graphics.setColor(0.3, 0.5, 0.8, 0.4)
    love.graphics.rectangle("fill", hoverX, hoverY, cellSize, cellSize)

    -- 3. Draw Saved Points
    love.graphics.setColor(1, 0.3, 0.3, 0.8)
    for _, pt in ipairs(points) do
        love.graphics.rectangle("fill", pt.x * cellSize, pt.y * cellSize, cellSize, cellSize)
    end

    -- 4. Overlay Info
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Left-click: Toggle cell | Right-click: Print coordinates table", 10, 10)
    love.graphics.print(string.format("Hover Grid: (%d, %d)", math.floor(mx / cellSize), math.floor(my / cellSize)), 10, 30)
end
