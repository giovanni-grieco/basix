local first_run = true
while true do
    -- Get the current time
    local current_time = os.date("%H:%M:%S")
    -- Clear the screen
    if first_run then
        -- Clear the screen only on the first run
        first_run = false
    else 
        print("\27[2J\27[H")
    end
    -- Print the current time
    print("Current Time: " .. current_time)
    -- Wait for 1 second before updating the time
    os.sleep(1)
end