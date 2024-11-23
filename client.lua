-- client.lua

local menuOpen = false

-- Function to toggle the menu
function toggleMenu()
    menuOpen = not menuOpen
    SetNuiFocus(menuOpen, menuOpen)
    SendNUIMessage({action = menuOpen and 'openMenu' or 'closeMenu'})
end

-- Register the /crosshair command
RegisterCommand('crosshair', function()
    toggleMenu()
end, false)

-- Close menu when the player presses ESC
RegisterNUICallback('closeMenu', function(data, cb)
    toggleMenu()
    cb('ok')
end)

-- This part will handle any other messages from the NUI
RegisterNUICallback('selectCrosshair', function(data, cb)
    cb('ok')
end)

RegisterNUICallback('clearCrosshair', function(data, cb)
    -- Implement any additional functionality if needed
    -- For example, clear the crosshair selection on the server or local storage
    cb('ok')
end)
