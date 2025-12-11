-- This code is not the dns server
-- Look in startup.lua for that
-- This code is for servers that use the dns

shell.run("clear")
print("Server Running!")

rednet.open("top")
while true do
    local id, message = rednet.receive()
    print("Received message: " .. message)
    if message == "status" then
        rednet.send(id, "Online")
    elseif message == "version" then
        rednet.send(id, "1.0.0")
    else
        rednet.send(id, "unknown request")
    end
end
rednet.close("top")