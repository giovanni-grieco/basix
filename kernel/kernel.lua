--[[
  Kernel module for Basix:
  1. Process management (creation, termination, ecc.)
  2. Scheduler (priority round robin with time slice)
  3. IPC (message passing)
  4. Syscall API (fork, exec, kill, wait, ecc.)
  5. System event handling (timer, ecc.)
]]

local PROCESS_NEW = 0
local PROCESS_READY = 1
local PROCESS_RUNNING = 2
local PROCESS_WAITING = 3
local PROCESS_TERMINATED = 4
local PROCESS_ZOMBIE = 5

local kernel = {
    processes = {},
    next_pid = 1,
    current_process = nil,
    ipc_queues = {},
    signals = {},
    sleeping_processes = {},
    default_environment = {}
}






return kernel