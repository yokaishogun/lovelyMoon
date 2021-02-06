Reference:
	lovelyMoon.event.update(dt)
	lovelyMoon.event.draw()
	lovelyMoon.event.keypressed(key, scancode, isrepeat)
	lovelyMoon.event.keyreleased(key, scancode)
	lovelyMoon.event.mousepressed(x, y, button, istouch, presses)
	lovelyMoon.event.mousereleased(x, y, button, istouch, presses)
	lovelyMoon.event.wheelmoved(x, y)

	lovelyMoon.clone(state)				-- deepcopy a state and return it; call from: function state:clone()
	lovelyMoon.loadState(file, id)	-- return state; file argument is used for require. Can pass a state object as the first argument, :load() will not be called if passing a state object.
	lovelyMoon.isStateEnabled(id)	-- return bool
	lovelyMoon.getState(id)				-- return state object
	lovelyMoon.enableState(id)		-- enables function of state, resuming all function calls, and calls state:enable().
	lovelyMoon.disableState(id)		-- disables function of state, pausing all function calls, and calls state:disable().
	lovelyMoon.switchState(currentID, nextID) -- calls :disable() on currentID and :enable() on nextID.
	lovelyMoon.toggleState(id)		-- toggles the current state, calling :enable() if disabled or :disable() if enabled.
	lovelyMoon.removeState(id)		-- removes state from lovelyMoon, returns removed state.

Usage:
1. Add "lovelyMoon.lua" to your game directory (e.g. "/lib/lovelyMoon.lua").
2. In main.lua, require the lovelyMoon module, and create a table to store your states:

	lovelyMoon = require("lib.lovelyMoon")
	states = {}


2. Inside love.load(), add states and enable first one: 

	function love.load()
		states.menu = lovelyMoon.loadState("states.menu", "menu") -- Argument 1 is file path for require, or a pre-existing state object.
		states.game = lovelyMoon.loadState("states.game", "game") -- Argument 2 is the ID to assign to this state.
		states.checkpoint = states.game:clone() -- can be passed to loadState later, :load() is not called if you pass a state object.
		
		lovelyMoon.enableState("menu")
	end
	

3. Add lovelyMoon event functions to the standard LOVE callback events:

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
		lovelyMoon.event.mousepressed(x, y, button)
	end

	function love.mousereleased(x, y, button, istouch, presses)
		lovelyMoon.event.mousereleased(x, y, button)
	end

	function love.wheelmoved(x, y)
		lovelyMoon.event.wheelmoved(x, y)
	end


4. Create the state module (e.g. "/states/menu.lua"):

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
	end

	function state:disable()
		-- called during lovelyMoon.disableState() or .switchState().
	end

	function state:update(dt)
		-- called during lovelyMoon.event.update().
	end

	function state:draw()
		-- called during lovelyMoon.event.draw().
	end

	function state:keypressed(key, scancode, isrepeat)
		-- called during lovelyMoon.event.keypressed().
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
	

5. That's all! Add your awesome code to your states' functions.