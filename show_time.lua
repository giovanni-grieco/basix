local first_run = true

local monitor = peripheral.find("monitor")
while true do
    -- Get the current time
    local current_time = os.date("%H:%M:%S")
    -- Clear the screen
    monitor.clear()
    -- Write the current time to the monitor
    monitor.write(current_time)
    -- Wait for 1 second before updating the time
    os.sleep(1)
end