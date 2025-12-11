-- This function sends a request to the dns server and the dns server forwards that request to the target computer.
function sendrequest(dns_id, url, str)
    rednet.open("back")
    rednet.send(dns_id, url .. ", " .. str)
    local id, message = rednet.receive(nil, 3)
    rednet.close("back")
    if id then
        return message
    else
        return "No Response Found"
    end
end