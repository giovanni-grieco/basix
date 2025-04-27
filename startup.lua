-- startup.lua
-- Description: configures PATH and autocompletion for the installed programs
-- BE CAREFUL WHEN EDITING THIS FILE

-- load libraries


-- Constants
local completion = require "cc.shell.completion"


-- Set the PATH variable
shell.setPath(shell.path() .. ":/bin/")

-- Set aliases


-- Set completions
shell.setCompletionFunction("bin/cat.lua", completion.build(completion.file))

