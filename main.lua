require("keyboard")
--states
require("splash")
require("mainmenu")

--andre
require("stateMachine")
require("mainMenuState")
require("splashState")
require("exitState")
require("playpenState")

debug = true

state = {dt = 0.0}
co = nil

key_buff = {}

function love.conf(t)
    t.title = "lUGH"
    t.version = "0.9.2"
    t.window.width = 800
    t.window.height = 600
    t.console = true
end

function love.load(arg)
    --co = coroutine.create(splash.entry)
    --coroutine.resume(co, state)

    --Andre
    gFSM = StateMachine.create()
    local lSplash = splashState.create()
    local lMainMenu = mainMenuState.create()
    local lExit = exitState.create()

    local lPlaypen = playpenState.create()

    gFSM:addState("splash", lSplash)
    gFSM:addState("mainMenu", lMainMenu)
    gFSM:addState("exit", lExit)
    gFSM:addState("playpen", lPlaypen)

    gFSM:setActiveState("splash")
end

function love.update(dt)
    state.dt = dt
    keyboard.update(key_buff)
    key_buff = {}
    --[[if not coroutine.resume(co) then
        if state.error ~= nil then
            --TODO: Display error and wait
        end
        love.event.quit()
    end]]

    --Andre
    gFSM:update(dt)
end

function love.keypressed(key)
    key_buff[key] = true
end

function love.keyreleased(key)
    key_buff[key] = nil
end

function love.draw(dt)
    --state.draw(dt)
     --Andre
    gFSM:draw(dt)
end
