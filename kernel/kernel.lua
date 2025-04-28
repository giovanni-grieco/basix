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
    ipc_queues = {},
    signals = {},
    sleeping_processes = {},
    default_environment = {}
}

-- Function to create a new process

function kernel.create_process(name, entry_point, args, env)
    local process = {
        pid = kernel.next_pid,
        name = name,
        entry_point = entry_point, --name of the lua code to run
        args = args,
        env = env or kernel.default_environment,
        state = PROCESS_NEW,
        ipc_queue = {},
        signal_handlers = {},
        routine = coroutine.create(require(entry_point)),
    }
    kernel.processes[kernel.next_pid] = process
    kernel.next_pid = kernel.next_pid + 1
    return process
end

function kernel.destroy_process(pid)
    local process = kernel.processes[pid]
    if process then
        process.state = PROCESS_TERMINATED
        kernel.processes[pid] = nil
    end
end

function kernel.schedule()
    for _, process in pairs(kernel.processes) do
        if process.state == PROCESS_NEW then
            debug.sethook(process.routine,
                function()
                    print("kernel yield")
                    coroutine.yield()
                end,
                'l',
                1000
        )
            process.state = PROCESS_READY
        end


        if process.state == PROCESS_READY then
            process.state = PROCESS_RUNNING
            
            -- Resume the coroutine
            local success, result = coroutine.resume(process.routine, process.args)
            print("kernel resume")
            if not success then
                print("Process error: " .. tostring(result))
                process.state = PROCESS_TERMINATED
            elseif coroutine.status(process.routine) == "dead" then
                process.state = PROCESS_TERMINATED
            else
                -- Coroutine yielded and can be resumed later
                process.state = PROCESS_READY
            end
        end
    end
end

function kernel.run()
    while true do
        --kernel.schedule()
        -- ADDITIONAL Stuff
    end
end

return kernel