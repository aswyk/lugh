mainmenu = {}

local options = {
    [1] = {text = "Start", entry = nil},
    [2] = {text = "Quit", entry = function(s) end}
}

local selection = 1

function mainmenu.selectup()
    selection = selection - 1
    if selection < 1 then
        selection = #options
    end
end

function mainmenu.selectdown()
    selection = selection + 1
    if selection > #options then
        selection = 1
    end
end

function mainmenu.draw(dt)
    local lg = love.graphics

    for i = 1, #options do
        lg.setColor(255, 255, 255, 255)
        if i == selection then
            lg.setColor(255, 0, 0, 255)
        end
        lg.print(options[i].text, 200, 200 + (20*i))
    end
end


function mainmenu.entry(state)
    print("entered mainmenu state")
    state.draw = mainmenu.draw
    local lg = love.graphics

    lg.setBackgroundColor(0, 0, 0)
    while true do
        if keyboard.isPressed("up") then
            mainmenu.selectup()
        elseif keyboard.isPressed("down") then
            mainmenu.selectdown()
        elseif keyboard.isPressed("return") then
            if options[selection].entry ~= nil then
                coroutine.yield()
                return options[selection].entry(state)
            end
        end
        coroutine.yield()
    end
end
