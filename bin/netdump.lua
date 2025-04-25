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

while true do
    local event, side, channel, reply_channel, message = os.pullEvent("modem_message")
    dump_data(event, side, channel, reply_channel, message)
end