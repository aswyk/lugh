require("conf")
require("keyboard")
--states
require("stateMachine")
require("mainMenuState")
require("splashState")
require("exitState")
require("playpenState")

debug = true

state = {dt = 0.0}
co = nil
key_buff = {}

function love.load(arg)
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
    gFSM:update(dt)
end

function love.keypressed(key)
    key_buff[key] = true
end

function love.keyreleased(key)
    key_buff[key] = nil
end

function love.draw(dt)
    gFSM:draw(dt)
end
