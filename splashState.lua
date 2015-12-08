splashState = { }
splashState.__index = splashState

local transition_time = 0

function splashState.create()
	local self = setmetatable({}, splashState)

	self.name = "menu"

	return self
end

function splashState:draw(dt)
	 local lg = love.graphics

    if transition_time < 1 then
        lg.setBackgroundColor(math.ceil(255*transition_time), math.ceil(255*transition_time), math.ceil(255*transition_time))
    elseif transition_time > 1 then
        lg.setColor(0, 0, 0, 255)
        lg.print("Press enter", 200, 200)
    end
end

function splashState:update(dt)
    transition_time = transition_time + state.dt
	if keyboard.isAnyPressed("return", "escape", " ") then
        gFSM:changeState("mainMenu")
    end
end

function splashState:enter(dt)
	print("entered splash state")
    transition_time = 0
end

function splashState:exit(dt)

end

