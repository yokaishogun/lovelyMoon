--Example of a state file

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
	love.window.setTitle("LovelyState - Game State")
end

--Disable
function state:disable()
	
end

--Update
function state:update(dt)
	
end

--Draw
function state:draw()
	love.graphics.print("It's that easy to switch states!\nPress [M] to return to the main menu.", 64, 64)
end

--KeyPressed
function state:keypressed(key, unicode)
	if key == "m" then
		lovelyMoon.switchState("game", "menu")
	end
end

--KeyReleased
function state:keyreleased(key, unicode)
	
end

--MousePressed
function state:mousepressed(x, y, button)
	
end

--MouseReleased
function state:mousereleased(x, y, button)
	
end

return state