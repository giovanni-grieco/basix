local destination = tonumber(arg[1])

if not destination then
    print("Usage: ping <destination>")
    return
end

local modem = peripheral.find("modem") or error("No modem found", 1)

print("Press CTRL+T to terminate.")
while true do
    modem.transmit(destination, destination, "Echo Request")
    print("Pinged " .. destination)
    os.sleep(1)
end
