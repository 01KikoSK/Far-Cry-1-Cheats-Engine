-- Far Cry Cheat Menu Script

-- Set the game process
local gameProcess = "FarCry.exe"

-- Set the cheat menu hotkey
local hotkey = "F1"

-- Set the cheat menu title
local menuTitle = "Far Cry Cheat Menu"

-- Create the cheat menu
local menu = createMenu(menuTitle)

-- Add cheats to the menu
local function addCheat(name, address, value, description)
    local cheat = createCheat(name, address, value, description)
    addMenuItem(menu, cheat)
end

-- Health cheats
addCheat("Infinite Health", "FarCry.exe+00123456", "100", "Get infinite health")
addCheat("Full Health", "FarCry.exe+00123456", "100", "Refill health to full")

-- Ammo cheats
addCheat("Infinite Ammo", "FarCry.exe+00123457", "9999", "Get infinite ammo")
addCheat("No Reload", "FarCry.exe+00123458", "0", "Disable reload")

-- Other cheats
addCheat("God Mode", "FarCry.exe+00123459", "1", "Enable god mode")
addCheat("No Clip", "FarCry.exe+0012345A", "1", "Enable no clip")

-- Show the cheat menu
showMenu(menu, hotkey)

-- Function to handle cheat activation
local function onCheatActivated(cheat)
    local address = cheat.getAddress()
    local value = cheat.getValue()
    writeMemory(address, value, "float")
    print("Cheat activated: ".. cheat.getName())
end

-- Add event listener for cheat activation
addEventListener("onCheatActivated", onCheatActivated)