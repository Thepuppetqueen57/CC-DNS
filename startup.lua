function splitstring(str)
    local args = {}
    
    for argument in str:gmatch("[^, ]+") do
        table.insert(args, argument)
    end
    
    return args
end

domains = {
    ["dector.arpa"] = 14,
    ["pluppet.arpa"] = 8,
    ["ccclos.arpa"] = 15,
    ["flyingmachine.arpa"] = 5
}

shell.run("clear")
print("ARPA DNS Server Running!")

rednet.open("left")
while true do
    local id, message = rednet.receive()
    -- print(("Computer %d sent message %s"):format(id, message))
    print("Computer " .. id .. " sent a message!")
    local destbody = splitstring(message)
    print("Message: " .. destbody[2]:lower()) 
    print("Destination: " .. destbody[1]:lower())
    
    rednet.send(domains[destbody[1]:lower()] , destbody[2]:lower())
    local resid, response = rednet.receive(nil, 3)
    if not resid then
        print("Response: None")
    else
        print("Response: " .. response)
        rednet.send(id, response)
    end
end
rednet.close("left")
