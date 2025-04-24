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
    -- Set the text color to white
    monitor.setTextColor(colors.white)
    -- Set the background color to black
    monitor.setBackgroundColor(colors.black)
    -- Set the text scale to 2
    monitor.setTextScale(2)
    -- Set the cursor position to the center of the screen
    local width, height = monitor.getSize()
    local x = math.floor((width - #current_time) / 2)
    local y = math.floor(height / 2)
    monitor.setCursorPos(x, y)
    -- Write the current time to the monitor
    monitor.write(current_time)
    -- Set the text color to green
    monitor.setTextColor(colors.green)
    -- Set the background color to black
    monitor.setBackgroundColor(colors.black)
    -- Set the text scale to 1
    monitor.setTextScale(1)
    -- Set the cursor position to the bottom of the screen
    monitor.setCursorPos(1, height)
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