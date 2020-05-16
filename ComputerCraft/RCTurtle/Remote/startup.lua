rednet.open("back")

turtleID = 25

term.clear()
term.setCursorPos(1, 1)

print("WASD Space Shift = Move")
print("Q = Drop")
print("C = Collect")
print("B/Z/H = Break/Up/Down")
print("P/U/J = Place/Up/Down")
print("1-9 = Select Slot")
print("F = Refuel")
print("I = Show Inventory")

function send(msg)
    msg = string.dump(msg)
    rednet.send(turtleID, msg, "rcturtle")
end

while true do
    parallel.waitForAny(
        function()
            local id, msg = rednet.receive("rcremote")
            print(msg)
        end,
        function()
            local event, key = os.pullEvent("key")
            
            if key == keys.w then
                send(function()
                        sendRemote(turtle.forward())
                    end)
            elseif key == keys.f then
                send(function()
                    sendRemote("Refueling")
                    for i = 1, 16 do
                        sendRemote(i)
                        turtle.select(i)
                        turtle.refuel()
                    end
                    sendRemote("Refueled")
                end)
            elseif key == keys.a then
                send(function()
                    sendRemote(turtle.turnLeft())
                end)
            elseif key == keys.d then
                send(function()
                    sendRemote(turtle.turnRight())
                end)
            elseif key == keys.s then
                send(function()
                    sendRemote(turtle.back())
                end)
            elseif key == keys.space then
                send(function()
                    sendRemote(turtle.up())
                end)
            elseif key == keys.leftShift then
                send(function()
                    sendRemote(turtle.down())
                end)
            elseif key == keys.b then
                send(function()
                    sendRemote(turtle.dig())
                end)
            elseif key == keys.p then
                send(function()
                    sendRemote(turtle.place())
                end)
            elseif key == keys.z then
                send(function()
                    sendRemote(turtle.digUp())
                end)
            elseif key == keys.h then
                send(function()
                    sendRemote(turtle.digDown())
                end)
            elseif key == keys.u then
                send(function()
                    sendRemote(turtle.placeUp())
                end)
            elseif key == keys.j then
                send(function()
                    sendRemote(turtle.placeDown())
                end)
            elseif key == keys.q then
                send(function()
                    sendRemote(turtle.drop())
                end)
            elseif key == keys.c then
                send(function()
                    sendRemote(turtle.suck())
                end)
            elseif key == keys.i then
                send(function()
                    for i = 1, 16 do
                        turtle.select(i)
                        local item = turtle.getItemDetail()
                        if item ~= nil then
                            sendRemote(i .. ": " .. item.name .. " " .. item.count)
                        end
                    end
                end)
            end
        end,
        function()
            local event, char = os.pullEvent("char")
            if tonumber(char) then
                send(function()
                    local id, val = rednet.receive()
                    turtle.select(val)
                    sendRemote(val)
                end)
                rednet.send(turtleID, tonumber(char))
            end
        end    
     )
end