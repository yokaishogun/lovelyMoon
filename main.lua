--Libraries
require("stateManager")
require("lovelyMoon")

--GameStates
require("states/gameState")
require("states/menuState")

function love.load()
	--Add Gamestates Here
	addState(MenuState, "menu")
	addState(GameState, "game")
	
	--Remember to Enable your Gamestates!
	enableState("menu")
end

function love.update(dt)
	lovelyMoon.update(dt)
end

function love.draw()
	lovelyMoon.draw()
end

function love.keypressed(key, unicode)
	lovelyMoon.keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	lovelyMoon.keyreleased(key, unicode)
end

function love.mousepressed(x, y, button)
	lovelyMoon.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	lovelyMoon.mousereleased(x, y, button)
end