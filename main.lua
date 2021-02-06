--Libraries
lovelyMoon = require("lib.lovelyMoon")
--GameStates
states = {
	
}

function love.load()
	--Add Gamestates Here
	states.menu = lovelyMoon.addState("states.menu", "menu")
	states.game = lovelyMoon.addState("states.game", "game")
	
	--Remember to Enable your Gamestates!
	lovelyMoon.enableState("menu")
end

function love.update(dt)
	lovelyMoon.events.update(dt)
end

function love.draw()
	lovelyMoon.events.draw()
end

function love.keypressed(key, unicode)
	lovelyMoon.events.keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	lovelyMoon.events.keyreleased(key, unicode)
end

function love.mousepressed(x, y, button)
	lovelyMoon.events.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	lovelyMoon.events.mousereleased(x, y, button)
end