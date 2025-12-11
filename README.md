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

# Making a client
 I made a simple function for sending a request using the DNS server!

 It is in client.lua
```

# Making a server
An example of making a server is in server.lua

As you can see it doesnt put a url to send a response.

The DNS server automatically routes responses back to the client.
