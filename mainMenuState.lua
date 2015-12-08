mainMenuState = { }
mainMenuState.__index = mainMenuState

local options = {
    [1] = {text = "Start", entry = nil},
    [2] = {text = "Playpen", entry = "playpen"},
    [3] = {text = "Settings", entry = nil},
    [4] = {text = "Quit", entry = "exit"}
}

local selection = 1

local function selectup()
    selection = selection - 1
    if selection < 1 then
        selection = #options
    end
end

local function selectdown()
    selection = selection + 1
    if selection > #options then
        selection = 1
    end
end

function mainMenuState.create()
	local self = setmetatable({}, mainMenuState)

	self.name = "menu"

	return self
end

function mainMenuState:draw(dt)
	local lg = love.graphics

    for i = 1, #options do
        lg.setColor(255, 255, 255, 255)
        if i == selection then
            lg.setColor(255, 0, 0, 255)
        end
        lg.print(options[i].text, 200, 200 + (20*i))
    end
end

function mainMenuState:update(dt)
	if keyboard.isPressed("up") then
		selectup()
	elseif keyboard.isPressed("down") then
		selectdown()
	elseif keyboard.isPressed("return") then
		if options[selection].entry ~= nil then
            gFSM:changeState(options[selection].entry)
		end
	end
end

function mainMenuState:enter(dt)
	print("entered mainmenu state")
    state.draw = mainmenu.draw
    local lg = love.graphics

    lg.setBackgroundColor(0, 0, 0)
end

function mainMenuState:exit(dt)

end
