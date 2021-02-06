--Libraries
lovelyMoon = require("lib.lovelyMoon")
--GameStates
states = {
	
}

function love.load()
	--Add Gamestates Here
	states.menu = lovelyMoon.loadState("states.menu", "menu")
	states.game = lovelyMoon.loadState("states.game", "game")
	
	--Remember to Enable your Gamestates!
	lovelyMoon.enableState("menu")
end

function love.update(dt)
	lovelyMoon.event.update(dt)
end

function love.draw()
	lovelyMoon.event.draw()
end

function love.keypressed(key, scancode, isrepeat)
	lovelyMoon.event.keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key, scancode)
	lovelyMoon.event.keyreleased(key, scancode)
end

function love.mousepressed(x, y, button, istouch, presses)
	lovelyMoon.event.mousepressed(x, y, button, istouch, presses)
end

function love.mousereleased(x, y, button, istouch, presses)
	lovelyMoon.event.mousereleased(x, y, button, istouch, presses)
end

function love.wheelmoved(x, y)
	lovelyMoon.event.wheelmoved(x, y)
end