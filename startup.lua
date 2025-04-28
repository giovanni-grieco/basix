-- startup.lua
-- Description: configures PATH and autocompletion for the installed programs
-- BE CAREFUL WHEN EDITING THIS FILE

-- load libraries
local kernel = require("kernel/kernel")

-- Constants
local completion = require "cc.shell.completion"


-- Set the PATH variable
shell.setPath(shell.path() .. ":/bin/")

-- Set aliases


-- Set completions
shell.setCompletionFunction("bin/cat.lua", completion.build(completion.file))


-- Start kernel
kernel.create_process("test1", "kernel/test1", {})
kernel.create_process("test2", "kernel/test2", {})
kernel.run()