--Example of a state file

local lovelyMoon = require("lib.lovelyMoon") -- if lovelyMoon is not a global in your game environment.

--Table
local state = {}

function state:clone()
	-- can be called to clone the current state of your state object, will return the clone object.
	return lovelyMoon.cloneState(self)
end

function state:load()
	-- called during lovelyMoon.loadState() if called as a module, not called when using .loadState() on a pre-existing state.
end

function state:remove()
	-- called during lovelyMoon.removeState() or switchState().
end

function state:enable()
	-- called during lovelyMoon.enableState().
	love.window.setTitle("LovelyState - Main Menu State")
end

function state:disable()
	-- called during lovelyMoon.disableState() or .switchState().
end

function state:update(dt)
	-- called during lovelyMoon.event.update().
end

function state:draw()
	-- called during lovelyMoon.event.draw().
	love.graphics.print("HI, press [G] to go to the Game!", 64, 64)
end

function state:keypressed(key, scancode, isrepeat)
	-- called during lovelyMoon.event.keypressed().
	if key == "g" then
		lovelyMoon.switchState("menu", "game")
	end
end

function state:keyreleased(key, scancode)
	-- called during lovelyMoon.event.keyreleased().
end

function state:mousepressed(x, y, button, istouch, presses)
	-- called during lovelyMoon.event.mousepressed().
end

function state:mousereleased(x, y, button, istouch, presses)
	-- called during lovelyMoon.event.mousereleased().
end

function state:wheelmoved(x, y)
	-- called during lovelyMoon.event.wheelmoved().
end

return state