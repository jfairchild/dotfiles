-- Hi!
-- Save this as ~/.hydra/init.lua and choose Reload Config from the menu

hydra.alert("HYDRA AWAKE 23.466")

--
-- Geometry is hard
--
-- (0,y+h) (x+w,y+h)
--   +---------+
--   |         |
--   |         |
--   +---------+
-- (x,y)   (x+w,0)
--

-- Just a DRY helper for the following window geometry functions
function winframe()
  local win, frame = nil
  win = window.focusedwindow()
  if win ~= nil then
    frame = win:screen():frame()
  else
    hydra.alert("Can't find focused window")
  end
  return win, frame
end

-- Window resizing and repositioning functions

function full()
  local win, newframe = winframe()
  if win ~= nil then win:setframe(newframe) end
end

function lefthalf()
  local win, newframe = winframe()
  newframe.w = newframe.w / 2
  if win ~= nil then win:setframe(newframe) end
end

function bottomhalf()
  local win, newframe = winframe()
  newframe.h = newframe.h / 2
  newframe.y = newframe.h
  if win ~= nil then win:setframe(newframe) end
end

function tophalf()
  local win, newframe = winframe()
  newframe.h = newframe.h / 2
  if win ~= nil then win:setframe(newframe) end
end

function righthalf()
  local win, newframe = winframe()
  newframe.w = newframe.w / 2
  newframe.x = newframe.w
  if win ~= nil then win:setframe(newframe) end
end

function topleft()
  local win, newframe = winframe()
  newframe.h = newframe.h / 2
  newframe.w = newframe.w / 2
  if win ~= nil then win:setframe(newframe) end
end

function topright()
  local win, newframe = winframe()
  newframe.h = newframe.h / 2
  newframe.w = newframe.w / 2
  newframe.x = newframe.w
  if win ~= nil then win:setframe(newframe) end
end

function bottomright()
  local win, newframe = winframe()
  newframe.h = newframe.h / 2
  newframe.w = newframe.w / 2
  newframe.x = newframe.w
  newframe.y = newframe.h
  if win ~= nil then win:setframe(newframe) end
end

function bottomleft()
  local win, newframe = winframe()
  newframe.h = newframe.h / 2
  newframe.w = newframe.w / 2
  newframe.y = newframe.h
  if win ~= nil then win:setframe(newframe) end
end

-- Window focus functions
-- TODO: These don't work the way I'm used to in Slate
function focus_north()
  local win = window.focusedwindow()
  win:focuswindow_north()
end

function focus_south()
  local win = window.focusedwindow()
  win:focuswindow_south()
end

function focus_east()
  local win = window.focusedwindow()
  win:focuswindow_east()
end

function focus_west()
  local win = window.focusedwindow()
  win:focuswindow_west()
end


-- Key bindings
-- Special key names: https://sdegutis.github.io/hydra/hotkey.html

local hyper = {"ctrl", "shift", "alt", "cmd"}

hotkey.bind(hyper, "1", full)
hotkey.bind(hyper, "h", lefthalf)
hotkey.bind(hyper, "j", bottomhalf)
hotkey.bind(hyper, "k", tophalf)
hotkey.bind(hyper, "l", righthalf)
hotkey.bind(hyper, "[", topleft)
hotkey.bind(hyper, "]", topright)
hotkey.bind(hyper, "'", bottomright)
hotkey.bind(hyper, ";", bottomleft)
hotkey.bind(hyper, "UP", focus_north)
hotkey.bind(hyper, "DOWN", focus_south)
hotkey.bind(hyper, "RIGHT", focus_east)
hotkey.bind(hyper, "LEFT", focus_left)

-- make sure Hydra launches at login
autolaunch.set(true)

-- show a helpful menu
menu.show(function()
    local updatetitles = {[true] = "Install Update", [false] = "Check for Update..."}
    local updatefns = {[true] = updates.install, [false] = checkforupdates}
    local hasupdate = (updates.newversion ~= nil)

    return {
      {title = "Reload Config", fn = hydra.reload},
      {title = "-"},
      {title = "About", fn = hydra.showabout},
      {title = updatetitles[hasupdate], fn = updatefns[hasupdate]},
      {title = "Quit Hydra", fn = os.exit},
    }
end)
