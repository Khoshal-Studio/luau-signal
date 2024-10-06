--!strict

-------------------------------------------------------------------------------------------

local connection = require(script:WaitForChild("connection"))
local types = require(script:WaitForChild("types"))

-------------------------------------------------------------------------------------------

export type connection = types.connection
export type signal = types.signal
type internal_signal = types.internal_signal
type internal_connection = types.internal_connection
export type fire<T> = types.fire<T>
export type restricted_signal = types.restricted_signal

-------------------------------------------------------------------------------------------

local function new() : signal
    local self : internal_signal = nil

    --[[----------------------------------------------------------------------]]--

    local function connect(self : internal_signal, handler: (...any) -> ()) : connection
        local connection = connection(self, handler)

        if self.handler_list_head then
            connection.next = self.handler_list_head
            self.handler_list_head = connection
        else
            self.handler_list_head = connection
        end

        return connection
    end

    
    local function disconnect_all(self : internal_signal) : ()
        self.handler_list_head = nil
    end

    local function fire(self : internal_signal, ...) : ()
        local item = (self.handler_list_head :: any) :: internal_connection 

        while item do
            if item.connected then
                task.spawn(item.fn, ...)
            end

            item = item.next :: any
        end
    end

    local function wait(self : internal_signal, ...) : ...any
        local waiting_coroutine = coroutine.running()

        local connection : connection = nil
        connection = self:Connect(function(...)
            connection:Disconnect()
            task.spawn(waiting_coroutine, ...)
        end)

        return coroutine.yield()
    end

    local function once(self : internal_signal, fn: (...any) -> ())
        local connection : connection = nil
        connection = self:Connect(function(...)
            local internal = connection :: internal_connection
            if internal.connected then
                connection:Disconnect()
            end

            fn(...)
        end)

        return connection
    end
    
    --[[----------------------------------------------------------------------]]--

    local immutable_signal = {
        Connect = function(...)
            return connect(...)
        end,
        Wait = function(...)
            return wait(...)
        end,
        Once = function(...)
            return once(...)
        end,
    }

    --[[----------------------------------------------------------------------]]--

    local restricted = {
        Connect = function(...)
            return connect(...)
        end,
        DisconnectAll = function(...)
            return disconnect_all(...)
        end,
        Wait = function(...)
            return wait(...)
        end,
        Once = function(...)
            return once(...)
        end
    }

    --[[----------------------------------------------------------------------]]--

    self = {
        handler_list_head = nil,

        Connect = connect,
        DisconnectAll = disconnect_all,
        Fire = fire,
        Wait = wait,
        Once = once,

        
        Restricted = restricted,
        Immutable = immutable_signal,
    } :: any

    --[[----------------------------------------------------------------------]]--

    return self
end 

-------------------------------------------------------------------------------------------

return new

-------------------------------------------------------------------------------------------
