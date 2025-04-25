local http = require("http")
local textutils = require("textutils")

local url_prefix = "https://raw.githubusercontent.com/giovanni-grieco/basix/refs/heads/main/"

local file_list_url = url_prefix .. "filelist"

print("Downloading file list from: " .. file_list_url)

local file_list = http.get(file_list_url).readAll()

print(file_list)

local file_list_lines = textutils.unserialize(file_list)