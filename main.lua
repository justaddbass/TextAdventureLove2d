debug = true
local utf8 = require("utf8")

log = {}
log_index = 0
command_input = {text="command", type="command"}
search_input = {text="search", type="search"}
selected_input = command_input

function love.load(arg)
    love.keyboard.setKeyRepeat(true)
    --r1 = Room:new("hello")
    --log[log_index] = world.getRoom(0, 0, 0)
end

function love.update(dt)

end

function love.draw(dt)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setLineStyle('smooth')
    love.graphics.setLineWidth(2)
    love.graphics.rectangle('line', 5, 5, 495, 395) --top left ui
    love.graphics.rectangle('line', 5, 405, 495, 190) --bottom left ui
    love.graphics.rectangle('line', 505, 5, 290, 395)  --top right ui
    love.graphics.rectangle('line', 505, 405, 290, 190) --bottom right ui
    love.graphics.rectangle('line', 10, 375, 485, 20) --command input
    love.graphics.rectangle('line', 510, 410, 280, 20) --search input
    love.graphics.print(command_input.text, 15, 380)
    love.graphics.print(search_input.text, 515, 415)
    love.graphics.setColor(255, 255, 255, 80)
    if selected_input.type == "command" then
        love.graphics.rectangle('fill', 10, 375, 485, 20)
    elseif selected_input.type == "search" then
        love.graphics.rectangle('fill', 510, 410, 280, 20)
    end
end

function love.textinput(t)
    selected_input.text = selected_input.text .. t
end

function love.keypressed(key)
    if key == "backspace" then
        local byteoffset = utf8.offset(selected_input.text, -1)

        if byteoffset then
            selected_input.text = string.sub(selected_input.text, 1, byteoffset - 1)
        end
    elseif key == "return" then
        log[log_index] = selected_input.text
        log_index = log_index + 1
        selected_input.text = ""
    end
end

function love.mousepressed(x, y, button)
    if x > 10 and x < 495 and y > 375 and y < 395 then
        selected_input = command_input
    elseif x > 510 and x < 790 and y > 410 and y < 430 then
        selected_input = search_input
    end
end
