--!strict

-------------------------------------------------------------------------------------------

--[=[
    @class signal
]=]
local signal = {}
signal.__index = signal

-------------------------------------------------------------------------------------------

local _types : nil = require(script:WaitForChild("signal_types"))

export type connection = _types.connection
export type signal = _types.signal
export type fire_fn = _types.fire_fn
export type restricted_signal = _types.restricted_signal

-------------------------------------------------------------------------------------------

--[=[
    Creates a connection object that can be used to disconnect the signal handler.

    @within signal
    @param signal : signal — The signal object.
    @param fn : `(...any) -> ()` — The signal handler function.
    @return connection : connection — The connection object.
]=]
local function create_connection(signal: signal, fn: (...any) -> ()) : connection
    local connection : any = {} :: any
    connection._connected = true
    connection._signal = signal
    connection._fn = fn
    connection._next = nil

    function connection:Disconnect(): ...any
        if not self._connected then return end
        self._connected = false
        if self._signal._handlerListHead == self then
            self._signal._handlerListHead = self._next
        else
            local prev : any = self._signal._handlerListHead
            while prev and prev._next ~= self do
                prev = prev._next
            end
            if prev then
                prev._next = self._next
            end
        end
    end

    return connection :: connection
end

-------------------------------------------------------------------------------------------

--[=[
    Creates a new signal object.

    @function signal.new
    @within signal
    @return signal : `signal` — The signal object.
]=]
function signal.new() : signal
    local self : any = setmetatable({}, signal) :: any
    self._handlerListHead = nil
    return self :: signal
end 

--[=[
    Connects a handler function to the signal.

    @within signal
    @method Connect
    @param self : signal — The signal object.
    @param fn : `(...any) -> ()` — The signal handler function.
    @return connection : `connection` — The connection object.
]=]
function signal.Connect(self : any, fn: (...any) -> ()): connection
    local connection : any = create_connection(self, fn) :: any
    if self._handlerListHead then
        connection._next = self._handlerListHead
        self._handlerListHead = connection
    else
        self._handlerListHead = connection
    end
    return connection :: connection
end

--[=[
    Disconnects all handler functions from the signal.

    @function signal.DisconnectAll
    @within signal
    @param self : `signal` — The signal object.
]=]
function signal:DisconnectAll()
    self._handlerListHead = nil
end

--[=[
    Fires the signal with the given arguments.

    @function signal.Fire
    @within signal
    @param self : `signal` — The signal object.
    @param ... : `any` — The arguments to pass to the signal handlers.
]=]
function signal:Fire(...: any)
    local item = self._handlerListHead
    while item do
        if item._connected then
            task.spawn(item._fn, ...)
        end
        item = item._next
    end
end

--[=[
    Yields the current thread until the signal is fired.

    @function signal.Wait
    @within signal
    @param self : `signal` — The signal object.
    @return ... : `any` — The arguments passed to the signal handlers.
    @yields
]=]
function signal:Wait()
    local waitingCoroutine = coroutine.running()
    local connection
    connection = self:Connect(function(...)
        connection:Disconnect()
        task.spawn(waitingCoroutine, ...)
    end)
    return coroutine.yield()
end

--[=[
    Connects a handler function to the signal that will only be called once.

    @function signal.Once
    @within signal
    @param self : `signal` — The signal object.
    @param fn : `(...any) -> ()` — The signal handler function.
    @return connection : `connection` — The connection object.
]=]
function signal:Once(fn: (...any) -> ())
    local connection
    connection = self:Connect(function(...)
        if connection._connected then
            connection:Disconnect()
        end
        fn(...)
    end)
    return connection
end

-------------------------------------------------------------------------------------------

--[=[
    @class restricted_signal
]=]
local restricted_signal = {}
restricted_signal.__index = restricted_signal

--[=[
    Creates a new restricted signal object.

    @function restricted_signal.new
    @within restricted_signal
    @return restricted_signal : `restricted_signal` — The restricted signal object.
    @return fire_fn : `fire_fn` — The fire function.
]=]
function restricted_signal.new(): (restricted_signal, fire_fn)
    local self = setmetatable({}, restricted_signal) :: any
    self._handlerListHead = nil

    local function Fire(...: any)
        local item = self._handlerListHead
        while item do
            if item._connected then
                task.spawn(item._fn, ...)
            end
            item = item._next
        end
    end

    return self :: restricted_signal, Fire
end

--[=[
    Connects a handler function to the restricted signal.

    @function restricted_signal.Connect
    @within restricted_signal
    @param self : `restricted_signal` — The restricted signal object.
    @param fn : `(...any) -> ()` — The signal handler function.
    @return connection : `connection` — The connection object.
]=]
function restricted_signal.Connect(self : any, fn: (...any) -> ()): connection
    local connection = create_connection(self, fn) :: any
    if self._handlerListHead then
        connection._next = self._handlerListHead
        self._handlerListHead = connection
    else
        self._handlerListHead = connection
    end
    return connection :: connection
end

--[=[
    Disconnects all handler functions from the restricted signal.

    @function restricted_signal.DisconnectAll
    @within restricted_signal
    @param self : `restricted_signal` — The restricted signal object.
]=]
function restricted_signal:DisconnectAll()
    self._handlerListHead = nil
end

--[=[
    Yields the current thread until the restricted signal is fired.

    @function restricted_signal.Wait
    @within restricted_signal
    @param self : `restricted_signal` — The restricted signal object.
    @return ... : `any` — The arguments passed to the signal handlers.
    @yields
]=]
function restricted_signal:Wait()
    local waitingCoroutine = coroutine.running()
    local connection
    connection = self:Connect(function(...)
        connection:Disconnect()
        task.spawn(waitingCoroutine, ...)
    end)
    return coroutine.yield()
end

--[=[
    Connects a handler function to the restricted signal that will only be called once.

    @function restricted_signal.Once
    @within restricted_signal
    @param self : `restricted_signal` — The restricted signal object.
    @param fn : `(...any) -> ()` — The signal handler function.
    @return connection : `connection` — The connection object.
]=] 
function restricted_signal:Once(fn: (...any) -> ())
    local connection
    connection = self:Connect(function(...)
        if connection._connected then
            connection:Disconnect()
        end
        fn(...)
    end)
    return connection
end

-------------------------------------------------------------------------------------------

return {
    signal = signal,
    restricted_signal = restricted_signal
}

-------------------------------------------------------------------------------------------
