--[[ 
    This script is a simple implementation of the Unix `cat` command in Lua for ComputerCraft.
    It reads a file and prints its content to the console.
    
    Usage:
        cat <file>
    
    Example:
        cat myfile.txt
]]--

local file_path = arg[1]
if not file_path then
    print("Usage: cat <file>")
    return
end
local file = fs.open(file_path, "r")
if not file then
    print("File not found: " .. file_path)
    return
end
local content = file.readAll()
file.close()

if content then
    print(content)
else
    print("Error reading file: " .. file_path)
end