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
        monitor = false
    end
end

local function SetupModem()
    if peripheral.isPresent(p_modem) then
        -- Wrap modem
        modem = peripheral.wrap(p_modem)
    else
        modem = false
    end
end

local function SetupPeripherals()
    -- Check if running on a pocket computer
    if pocket then
        -- Only set up modem if present
        SetupModem()
        -- Set everything else to false so it doesn't break!!
        monitor = false
    else
        -- Actually set up all peripherals
        SetupMonitor()
        SetupModem()
    end
end

-------- End of peripheral setup --------

-------- Normal functions --------
local function OnCompletionMonitor()
    if monitor then 
        -- Set monitor as term
        term.redirect(monitor)
    end

    -- Display greeting
    monitor.write(greetings[math.random(1,#greetings)])
    term.setCursorPos(1,2)
    if monitor then
        term.write("Monitor connected")
    else
        term.write("Monitor not connected")
    end
    term.setCursorPos(1,3)
    if modem then
        term.write("Modem connected")
    else
        term.write("Modem not connected")
    end
end



-------- Executed on startup ------
SetupPeripherals()
OnCompletionMonitor()