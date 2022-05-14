
-- Clears adjacent monitor
if peripheral.isPresent("right") then
    -- Wrap monitor
    monitor = peripheral.wrap("right")
    -- Clear and set cursor position
    monitor.clear()
    monitor.setCursorPos(1,1)
else
    -- No monitor connected
end