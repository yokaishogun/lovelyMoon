--[[--------------------------------------------------------------------------------
Copyright 2013-2021 Davidobot
Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the
Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the
following conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]--------------------------------------------------------------------------------

-- Additional credit goes to bVictor7364 and Anase Skyrider for their contributions.
-- https://love2d.org/forums/viewtopic.php?f=5&t=38702

local lovelyMoon = {event = {}, version = 3}
local _slotState = {states = {}}

------------------------------------------------------------------------------------

function lovelyMoon.event.update(dt)
	for index, state in pairs(_slotState.states) do
		if state and state._enabled and state.update then
			state:update(dt)
		end
	end
end

function lovelyMoon.event.draw()
	for index, state in pairs(_slotState.states) do
		if state and state._enabled and state.draw then
			state:draw()
		end
	end
end

function lovelyMoon.event.keypressed(key, scancode, isrepeat)
	for index, state in pairs(_slotState.states) do
		if state and state._enabled and state.keypressed then
			state:keypressed(key, scancode, isrepeat)
		end
	end
end

function lovelyMoon.event.keyreleased(key, scancode)
	for index, state in pairs(_slotState.states) do
		if state and state._enabled and state.keyreleased then
			state:keyreleased(key, scancode)
		end
	end
end

function lovelyMoon.event.mousepressed(x, y, button, istouch, presses)
	for index, state in pairs(_slotState.states) do
		if state and state._enabled and state.mousepressed then
			state:mousepressed(x,y,button,istouch, presses)
		end
	end
end

function lovelyMoon.event.mousereleased(x, y, button, istouch, presses)
	for index, state in pairs(_slotState.states) do
		if state and state._enabled and state.mousereleased then
			state:mousereleased(x,y,button,istouch,presses)
		end
	end
end

function lovelyMoon.event.wheelmoved(x, y)
	for index, state in pairs(_slotState.states) do
		if state and state._enabled and state.wheelmoved then
			state:wheelmoved(x,y)
		end
	end
end

--[[--------------------------------------------------------------------------------
-- LOVE comes with more callback events than this. Use the above as a template,
-- changing function names and parameters as needed, to add more events to your
-- game. Just be sure to call to lovelyMoon in those callbacks and include those
-- events in your states. Callbacks can be found at: https://love2d.org/wiki/love
--]]--------------------------------------------------------------------------------

------------------------------------------------------------------------------------

local function deepcopy(orig)
	-- coded lifted from http://lua-users.org/wiki/CopyTable
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function lovelyMoon.cloneState(state)
	local clone = deepcopy(state)
	return clone
end

function lovelyMoon.loadState(req, id)
	local state
	if type(req) == "table" then
		state = req
		if id then
			state._id = id
		end
	else
		state = require(req)
		state._enabled = false
		state._id = id
		state:load()
	end
	table.insert(_slotState.states, state)
	return state
end

function lovelyMoon.isStateEnabled(id)
	for index, state in pairs (_slotState.states) do
		if state._id == id then
			return state._enabled
		end	
	end
end

function lovelyMoon.getState(id)
	for index, state in pairs (_slotState.states) do
		if state._id == id then
			return state
		end
	end
end

function lovelyMoon.enableState(id)
	for index, state in pairs (_slotState.states) do
		if state._id == id then
			state:enable()
			state._enabled = true
		end
	end
end

function lovelyMoon.disableState(id)
	for index, state in pairs (_slotState.states) do
		if state._id == id then
			state:disable()
			state._enabled = false
		end
	end
end

function lovelyMoon.switchState(currentID, nextID)
	lovelyMoon.disableState(currentID)
	lovelyMoon.enableState(nextID)
end

function lovelyMoon.toggleState(id)
	for index, state in pairs (_slotState.states) do
		if state._id == id then
			state._enabled = not state._enabled
			if state._enabled then
				state:enable()
			else
				state:disable()
			end
		end
	end
end

function lovelyMoon.removeState(id)
	for index, state in pairs (_slotState.states) do
		if state._id == id then
			state:remove()
			table.remove(_slotState.states, index)
		end
	end
end

------------------------------------------------------------------------------------

return lovelyMoon