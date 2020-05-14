dofile("internal/conf.lua")

function processInput(input)
    if input == "exit.lua" then
        error()
    end
    
    if fs.exists(input) and string.len(input) > 0 and input ~= "startup.lua" and not fs.isDir(input) then   
        dofile(input)
    else
        print("File Not Found")
    end
    os.sleep(1)
end


while true do
    mon.clear()
    mon.setCursorPos(1, 1)
    shell.run("monitor top info")

    term.clear()
    term.setCursorPos(1, 1)
    dofile("info.lua")

    commands = fs.list("")
    print()
    print("Available Commands:")
    for i, k in pairs(commands) do
        if not fs.isDir(k) and k ~= "startup.lua" then
            len = string.len(k)
            print(string.sub(k, 1, len - 4))
        end
    end
    print("exit")
    print()

    parallel.waitForAny(
        function()
            input = read() .. ".lua"
            processInput(input)
        end,
        function()
            while true do
                local event = os.pullEvent()
                if event == "sgStargateStateChange" or event == "sgIrisStateChange" then
                    break
                end
            end
        end
    )
end