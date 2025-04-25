local first_run = true

local monitor = peripheral.find("monitor")

while true do
    -- Get the current time
    local current_time = os.time()
    -- Clear the screen
    monitor.clear()
    -- Write the current time to the monitor
    monitor.setCursorPos(1,1)
    monitor.write("In-Game time:")
    monitor.setCursorPos(1,2)
    monitor.write(current_time)
    -- Wait for 1 second before updating the time
    os.sleep(1)
end
