local url_prefix = "https://raw.githubusercontent.comgiovanni-grieco/basix/refs/heads/main"

local file_list_url = url_prefix .. "filelist"

print("Downloading file list from"  .. file_list_url)

local file_list = http.get(file_list_url).readAll()

print(file_list)

local file_list_lines = textutils.unserialize(file_list)

for _, file in ipairs(file_list_lines) do
    local file_url = url_prefix .. file
    local file_path = shell.resolve(file)

    print("Downloading" .. file_url ..  "to"  .. file_path)

    local response = http.get(file_url)
    if response then
        local file_data = response.readAll()
        local file_handle = fs.open(file_path, w)
        file_handle.write(file_data)
        file_handle.close()
        print("Downloaded and saved"  .. file_path)
    else
        print("Failed to download"  .. file_url)
    end
end
