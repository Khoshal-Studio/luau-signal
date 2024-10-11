--!strict
--!native

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
export type immutable_signal = types.immutable_signal

-------------------------------------------------------------------------------------------

local methods = {
    Connect = function(self: internal_signal, handler: (...any) -> ()): connection
        if type(handler) ~= "function" then
            error("Invalid type for handler: expected function, got: " .. typeof(handler))
        end

        return connection.new(self, handler)
    end,

    DisconnectAll = function(self: internal_signal): ()
        self.handler_list_head = nil
    end,

    Fire = function(self: internal_signal, ...): ()
        local item = (self.handler_list_head :: any) :: internal_connection 

        while item do
            if item.connected then
                task.spawn(item.fn, ...)
            end

            item = item.next :: any
        end
    end,

    Wait = function(self: internal_signal, ...): ...any
        local waiting_coroutine = coroutine.running()

        local connection : connection = nil

        connection = self:Connect(function(...)
            connection:Disconnect()
            task.spawn(waiting_coroutine, ...)
        end)

        return coroutine.yield()
    end,

    Once = function(self: internal_signal, handler: (...any) -> ()): connection
        if type(handler) ~= "function" then
            error("Invalid type for handler: expected function, got: " .. typeof(handler))
        end

        local connection : connection = nil

        connection = self:Connect(function(...)
            local internal = connection :: internal_connection
            if internal.connected then
                connection:Disconnect()
            end

            handler(...)
        end)

        return connection
    end
}

-------------------------------------------------------------------------------------------

local function new(): signal
    local self: internal_signal = nil

    --[[----------------------------------------------------------------------]]--

    local Connect = methods.Connect
    local DisconnectAll = methods.DisconnectAll
    local Fire = methods.Fire
    local Wait = methods.Wait
    local Once = methods.Once

    --[[----------------------------------------------------------------------]]--

    local Immutable = {
        Connect = Connect,
        Wait = Wait,
        Once = Once
    }

    --[[----------------------------------------------------------------------]]--

    local Restricted = {
        DisconnectAll = DisconnectAll,
        Connect = Connect,
        Wait = Wait,
        Once = Once,

        Immutable = Immutable
    }

    --[[----------------------------------------------------------------------]]--

    self = {
        handler_list_head = nil,

        Connect = Connect,
        DisconnectAll = DisconnectAll,
        Fire = Fire,
        Wait = Wait,
        Once = Once,

        
        Restricted = Restricted,
        Immutable = Immutable,
    } :: any

    --[[----------------------------------------------------------------------]]--

    return self
end 

-------------------------------------------------------------------------------------------

return {
    new = new
}

-------------------------------------------------------------------------------------------
