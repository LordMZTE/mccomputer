dofile("internal/conf.lua")
dofile("internal/addresses.lua")
 
if prnt.getPaperLevel() <= 0 or prnt.getInkLevel() <= 0 then
    print("Insufficient Paper/Dye")
    return
end
 
prnt.newPage()
prnt.write("This Gate: " .. sg.localAddress())
prnt.setCursorPos(1, 3)
for k, v in pairs(addresses) do
    x, z = prnt.getCursorPos()
    xl, zl = prnt.getPageSize()
    if zl <= z then
        prnt.endPage()
        prnt.newPage()
    else
        prnt.write("--" .. v[1] .. "--")
        prnt.setCursorPos(x, z + 1)
        prnt.write(v[2])
        prnt.setCursorPos(x, z + 2)
    end
end
prnt.endPage()