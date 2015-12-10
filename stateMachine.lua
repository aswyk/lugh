require("mainMenuState")

StateMachine = { }
StateMachine.__index = StateMachine

function StateMachine.create()
	local self = setmetatable({}, StateMachine)

	self.states = {}
	self.activeState = nil
	self.lastActiveState = nil
	self.changedState = nil
	
	self.running = true

	return self
end

function StateMachine:addState(name, state)
	self.states[name] = state
	state.fsm = self
	--self.states[name] = mainMenuState.create()
end

function StateMachine:setActiveState(name)
	self.activeState = self.states[name]
	self.lastActiveState = self.states[name]
	self.changedState = self.states[name]
end

function StateMachine:changeState(name)
	self.changedState = self.states[name]
end

function StateMachine:update(dt)

	if self.activeState == self.changedState then

		if self.activeState.update and type(self.activeState.update) == "function" then
			self.activeState.update(dt)
		end

	else
		if self.activeState.exit and type(self.activeState.exit) == "function" then
			self.activeState.exit(dt)
		end

		if self.changedState.enter and type(self.activeState.enter) == "function" then
			self.changedState.enter(dt)
		end

		self.lastActiveState = self.activeState
		self.activeState = self.changedState
	end
end

function StateMachine:draw(dt)
	if self.activeState.draw and type(self.activeState.draw) == "function" then
		self.activeState:draw(dt)
	end
end
