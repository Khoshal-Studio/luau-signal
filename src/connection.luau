--!strict

------------------------------------------------------------------------------------------------------------------------

local types = require(script.Parent:WaitForChild("types"))

------------------------------------------------------------------------------------------------------------------------

local methods = {
    Disconnect = function(self: types.internal_connection)
        if not self.connected then return end
    
        if self.signal.handler_list_head == self then
            self.signal.handler_list_head = self.next
        else
            local prev = self.signal.handler_list_head
    
            while prev and prev.next ~= self do
                prev = prev.next
            end
    
            if prev then
                prev.next = self.next
            end
        end
    end
}

------------------------------------------------------------------------------------------------------------------------

local function new(signal: types.internal_signal, fn: (...any?) -> ...any?): types.internal_connection
    if signal == nil then
        error("Signal cannot be nil", 2)
    end

    if fn == nil then
        error("Handler function cannot be nil", 2)
    end

    local self = {
        connected = true,
        signal = signal,
        fn = fn,
        next = nil,
        
        Disconnect = methods.Disconnect
    }

    return self
end


------------------------------------------------------------------------------------------------------------------------

return {
    new = new
}

------------------------------------------------------------------------------------------------------------------------