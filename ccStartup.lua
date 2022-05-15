---@diagnostic disable: unused-function

-- Peripheral setup
local monitor = false
local p_monitor = "right"
local modem = false
local p_modem = "back"

-- Constants
local greetings = {
    "Hi Spectrum!!",
    "Hello Spectrum!",
    "Beep boop!",
    "Now with an update function!",
    "Devious",
    "G'day"
}

-- This is kind of important
local function newLine()
    local x,y = term.getCursorPos()
    term.setCursorPos(1,y+1)
end

-------- Peripheral setup --------
-- Setup monitor initially
local function SetupMonitor()
    if peripheral.isPresent(p_monitor) then
        -- Wrap monitor
        monitor = peripheral.wrap(p_monitor)

        -- Set monitor color scheme

        -- Resizing?
        monitor.setTextScale()

        -- Clear and set cursor position
        monitor.clear()
        monitor.setCursorPos(1,1)
    else
        -- No monitor connected
    end
end

local function SetupModem()
    if peripheral.isPresent(p_modem) then
        -- Wrap modem
        modem = peripheral.wrap(p_modem)
    else
        -- No modem connected
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

-------- Normal functions --------
local function OnCompletionMonitor()
    if monitor then 
        -- Set monitor as term
        term.redirect(monitor)
    end

    -- Display greeting
    term.write(greetings[math.random(1,#greetings)])
    newLine()
    newLine()
    if monitor then
        term.write("Monitor connected")
    else
        term.write("Monitor not connected")
    end
    newLine()
    if modem then
        term.write("Modem connected")
    else
        term.write("Modem not connected")
    end
    newLine()
end

-------- Executed on startup ------
-- Set up term
term.clear()
term.setCursorPos(1,1)

-- Do other stuff
SetupPeripherals()
OnCompletionMonitor()