playpenState = { }
playpenState.__index = playpenState

local animDt = 0
local animIdx = 1
local taxiAnim = nil
local tX = 100;
local tY = 100;

function playpenState.create()
	local self = setmetatable({}, playpenState)

	self.name = "playpen"

	return self
end

function playpenState:draw(dt)
	local lg = love.graphics

	lg.print("Playpen State", 20, 20)

	love.graphics.draw(taxiImg, taxiAnim[animIdx], tX, tY)
end

function playpenState:update(dt)

	animDt = animDt + 1

	if animDt > 5 then
		animDt = 0
		animIdx = animIdx + 1
	end

	if animIdx > 3 then
		animIdx = 1
	end

	if keyboard.isHeld("up") then
		tY = tY - 1;
	end
	if keyboard.isHeld("down") then
		tY = tY + 1;
	end
	if keyboard.isHeld("left") then
		tX = tX - 1;
	end
	if keyboard.isHeld("right") then
		tX = tX + 1;
	end
	if keyboard.isPressed("q") then
        gFSM:changeState("mainMenu")
	end
end

function playpenState:enter(dt)
	print("entered playpen state")
	state.draw = mainmenu.draw
  local lg = love.graphics
	lg.setBackgroundColor(30, 30, 30)

	taxiImg = love.graphics.newImage('Assets/Textures/taxi.png')

	local tileW, tileH = 128,128
	local tilesetW, tilesetH = taxiImg:getWidth(), taxiImg:getHeight()

 	local taxiQ1 = love.graphics.newQuad(0-10,  0, tileW, tileH, tilesetW, tilesetH)
 	local taxiQ2 = love.graphics.newQuad(128-10, 0, tileW, tileH, tilesetW, tilesetH)
 	local taxiQ3 = love.graphics.newQuad(256, 0, tileW, tileH, tilesetW, tilesetH)

	taxiAnim = { taxiQ1, taxiQ2, taxiQ3 }

end

function playpenState:exit(dt)

end
