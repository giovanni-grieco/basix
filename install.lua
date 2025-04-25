local url_prefix = "https://raw.githubusercontent.com/giovanni-grieco/basix/refs/heads/main/"

local file_list_url = url_prefix .. "filelist"

print("Downloading file list from"  .. file_list_url)

local file_list = http.get(file_list_url).readAll()

local file_list_lines = {}

for line in file_list:gmatch("[^\r\n]+") do
  table.insert(file_list_lines, line)
end

for i, line in ipairs(file_list_lines) do
    local file_url = url_prefix .. line
    local file_name = line:match("([^/]+)$")
    
    print("Downloading " .. file_name .. " from " .. file_url)
    
    local file_data = http.get(file_url).readAll()
    
    if file_data then
        local file = fs.open(file_name, "w")
        file.write(file_data)
        file.close()
        print("Downloaded and saved " .. file_name)
    else
        print("Failed to download " .. file_name)
    end
end

