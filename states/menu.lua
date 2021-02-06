--Example of a GameState file

--Table
local state = {}

--New
function state:new()
	return lovelyMoon.new(self)
end

--Load
function state:load()
	
end

--Close
function state:close()
	
end

--Enable
function state:enable()
	love.window.setTitle("LovelyState - Main Menu State")
end

--Disable
function state:disable()
	
end

--Update
function state:update(dt)
	
end

--Draw
function state:draw()
	love.graphics.print("HI, press [G] to go to the Game!", 64, 64)
end

--KeyPressed
function state:keypressed(key, unicode)
	if key == "g" then
	lovelyMoon.switchState("menu", "game")
	end
end

--KeyRelease
function state:keyrelease(key, unicode)
	
end

--MousePressed
function state:mousepressed(x, y, button)
	
end

--MouseReleased
function state:mousereleased(x, y, button)
	
end

return state