splash = {}

transition_time = 0

function splash.draw(dt)
    local lg = love.graphics

    if transition_time < 1 then
        lg.setBackgroundColor(math.ceil(255*transition_time), math.ceil(255*transition_time), math.ceil(255*transition_time))
    elseif transition_time > 1 then
        lg.setColor(0, 0, 0, 255)
        lg.print("Press enter", 200, 200)
    end
end

function splash.entry(state)
    print("entered splash state")
    local kb = love.keyboard
    transition_time = 0
    state.draw = splash.draw
    while true do
        transition_time = transition_time + state.dt
        if kb.isDown("return", "escape", " ") then
            --yield before state transition to allow for clearing of old state
            coroutine.yield()
            return mainmenu.entry(state)
        end
        coroutine.yield()
    end
end

