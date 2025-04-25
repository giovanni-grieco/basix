--[[ 
    This script listens for messages on a specified port and prints them to the console.
    
    Usage:
        netdump <port>
    
    Example:
        netdump 12345
]]--

local listen_on = tonumber(arg[1])

if not listen_on then
    print("Usage: netdump <port>")
    return
end

local modem = peripheral.find("modem") or error("No modem found", 1)

local function dump_data(event, side, channel, reply_channel, message)
    if channel == listen_on then
        print("Received on " .. channel .. ": " .. message)
    end
end

modem.open(listen_on)

print("Press any key to terminate.")
print("Listening on port " .. listen_on .. "...")

while true do
    local event, side, channel, reply_channel, message = os.pullEventRaw()
    if event == "modem_message" then
        dump_data(event, side, channel, reply_channel, message)
    elseif event == "terminate" then
        break
    end
    
end

modem.close(listen_on)
print("Closed port " .. listen_on)
print("Exiting netdump.")
-- End of script