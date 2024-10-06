--!strict

------------------------------------------------------------------------------------------------------------------------

local types = require(script.Parent:WaitForChild("types"))

------------------------------------------------------------------------------------------------------------------------

local function new(signal : types.internal_signal, fn : (...any?) -> ...any?) : types.internal_connection
    local function disconnect(self : types.internal_connection)
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

    local self = {
        connected = true,
        signal = signal,
        fn = fn,
        next = nil,
        
        Disconnect = disconnect
    }

    return self
end


------------------------------------------------------------------------------------------------------------------------

return new

------------------------------------------------------------------------------------------------------------------------