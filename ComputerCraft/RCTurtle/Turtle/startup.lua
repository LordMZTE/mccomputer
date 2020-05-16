rednet.open("left")

remoteID = 24

function _G.sendRemote(msg)
    rednet.send(remoteID, msg, "rcremote")
end

term.clear()
term.setCursorPos(1, 1)
print(os.getComputerID())
while true do
    id, message, protocol = rednet.receive("rcturtle")
    local f, err = loadstring(message)
    print(message)
    if err then
        print("invalid command", message)
        sendRemote(false)
    else
        f()
    end
end