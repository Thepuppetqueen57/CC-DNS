# CC-DNS
 CC-DNS is a DNS Server made for the CC: Tweaked mod for minecraft.

 The domains dict is a list of registered domains and their computer id's

 Domains can be anything (as long as they dont have spaces).

 They could be: &6ftgdfg

 Or they could be: hi.com

 This is meant to run on an advanced computer in the CC: Tweaked mod.

 The domains that are there are me and my friends domains on the network (startup.lua is an exact mirror of the one in my personal mc world with my friends)

 But you can add, remove, or change any domain you like. Make sure the computer id is valid.

 Also at the moment requests cant have spaces in them (sorry)

 The DNS automatically routes responses back to the client computer.

 I might add documentation on how to send and receive requests/responses at some point idk.

# Making a client
 I made a simple function for sending a request using the DNS server!

 ```lua
function sendrequest(str)
    rednet.open("back")
    rednet.send(dns computer id here, "url here, " .. str)
    local id, message = rednet.receive(nil, 3)
    rednet.close("back")
    if id then
        return message
    else
        return "No Response Found"
    end
end
```

# Making a server
Heres an example of a server:

```lua
shell.run("clear")
print("Server Running!")

rednet.open("top")
while true do
    local id, message = rednet.receive()
    print("Received message: " .. message)
    if message == "status" then
        rednet.send(9, "Online")
    elseif message == "version" then
        rednet.send(9, "1.0.0")
    else
        rednet.send(9, "unknown request")
    end
end
rednet.close("top")
```

As you can see it doesnt put a url to send a response.

The DNS server automatically routes responses back to the client.
