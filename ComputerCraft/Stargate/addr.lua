dofile("internal/addresses.lua")
dofile("internal/conf.lua")
 
for i, na in pairs(addresses) do
    print(i, na[1])
end
 
input = read()
n = tonumber(input)
 
if n then
    print(sg.dial(addresses[n][2]))
else
    print("invalid")
end