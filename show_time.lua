local first_run = true

local monitor = peripheral.find("monitor")
while true do
    -- Get the current time
    local current_time = os.date("%H:%M:%S")
    -- Clear the screen
    if first_run then
        monitor.clear()
        first_run = false
    else
        monitor.clearLine(1)
    end
    -- Write the current time to the monitor
    monitor.write(current_time)
    -- Write the message to the monitor
    print("Press any key to exit...")
    -- Check for key presses
    local event, key = os.pullEvent("key")
    if key then
        -- Clear the screen and exit the loop
        monitor.clear()
        break
    end
    -- Wait for 1 second before updating the time
    os.sleep(1)
end