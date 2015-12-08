exitState = { }
exitState.__index = exitState

function exitState.create()
	local self = setmetatable({}, exitState)

	self.name = "exit"

	return self
end

function exitState:draw(dt)
end

function exitState:update(dt)
end

function exitState:enter(dt)
	print "calling exit state"
	love.event.quit()
end

function exitState:exit(dt)

end

