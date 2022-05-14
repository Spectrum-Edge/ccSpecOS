
-- Peripheral setup
local p_monitor = "right"

-- Constants
local greetings = {
    "Hi Spectrum!!",
    "Hello Spectrum!",
    "Beep boop!"
}

-- Setup monitor initially
local function SetupMonitor()
    if peripheral.isPresent(p_monitor) then
        -- Wrap monitor
        local monitor = peripheral.wrap(p_monitor)

        -- Set monitor color scheme

        -- Clear and set cursor position
        monitor.clear()
        monitor.setCursorPos(1,1)
        
        -- Display greeting
        print(math.random(1,#greetings))
    end
end

SetupMonitor()