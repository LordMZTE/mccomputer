dofile("internal/conf.lua")
print("close/open")
input = read()
if input == "close" then
    print(sg.closeIris())
elseif input == "open" then
    print(sg.openIris())
else
    print("invalid")
end