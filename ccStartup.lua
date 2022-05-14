---@diagnostic disable: unused-function

-- Peripheral setup
local monitor = nil
local p_monitor = "right"
local modem = nil
local p_modem = "back"

-- Constants
local greetings = {
    "Hi Spectrum!!",
    "Hello Spectrum!",
    "Beep boop!"
}

-------- Peripheral setup --------
-- Setup monitor initially
local function SetupMonitor()
    if peripheral.isPresent(p_monitor) then
        -- Wrap monitor
        monitor = peripheral.wrap(p_monitor)

        -- Set monitor color scheme

        -- Clear and set cursor position
        monitor.clear()
        monitor.setCursorPos(1,1)
    else
        term.write("There is no connected monitor")
    end
end

local function SetupModem()
    if peripheral.isPresent(p_modem) then
        -- Wrap modem
        modem = peripheral.wrap(p_modem)
    else
        term.write("There is no connected modem")
    end
end

local function SetupPeripherals()
    -- Check if running on a pocket computer
    if pocket then
        -- Only set up modem if present
        SetupModem()
    else
        -- Actually set up all peripherals
        SetupMonitor()
        SetupModem()
    end
end

-------- End of peripheral setup --------

local function OnCompletionMonitor()
    if monitor then 
        -- Display greeting
        monitor.write(math.random(greetings[1,#greetings]))
        monitor.setCursorPos(1,2)
        monitor.write("There is a monitor connected")
        monitor.setCursorPos(1,3)
        monitor.write("Modem connected: "..peripheral.isPresent(p_modem))
    else
        -- Display greeting
        term.write(math.random(greetings[1,#greetings]))
        term.setCursorPos(1,2)
        term.write("There is no monitor connected")
        term.setCursorPos(1,3)
        term.write("Modem connected: "..peripheral.isPresent(p_modem))
    end
end



-- Executed on startup
SetupPeripherals()
OnCompletionMonitor()