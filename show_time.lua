while true do
    -- Get the current time
    local current_time = os.date("%H:%M:%S")
    -- Clear the screen
    os.execute("clear") -- Use "cls" for Windows
    -- Print the current time
    print("Current Time: " .. current_time)
    -- Wait for 1 second before updating the time
    os.sleep(1)
end