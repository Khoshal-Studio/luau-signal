-------------------------------------------------------------------------------------------

--[=[
    @type connection {
        Disconnect: (self: connection) -> ()
    }
    @within signal
    A connection object that can be used to disconnect the signal handler.
]=]
export type connection = {
    Disconnect: (self: connection) -> ()
}

--[=[
    @type signal {
        Connect: (self: signal, handler: (...any) -> ()) -> connection,
        DisconnectAll: (self: signal) -> (),
        Fire: (self: signal, ...any) -> (),
        Wait: (self: signal) -> ...any,
        Once: (self: signal, handler: (...any) -> ()) -> connection,
    }
    @within signal
    A signal object that can be connected to and fired.
]=]
export type signal = {
    Connect: (self: signal, handler: (...any) -> ()) -> connection,
    DisconnectAll: (self: signal) -> (),
    Fire: (self: signal, ...any) -> (),
    Wait: (self: signal) -> ...any,
    Once: (self: signal, handler: (...any) -> ()) -> connection,
}

--[=[
    @type fire_fn {
        (...any) -> ()
    }
    @within signal
    A function that fires the signal with the given arguments.
]=]
export type fire_fn = (...any) -> ()

--[=[
    @type restricted_signal {
        Connect: (self: restricted_signal, handler: (...any) -> ()) -> connection,
        DisconnectAll: (self: restricted_signal) -> (),
        Wait: (self: restricted_signal) -> ...any,
        Once: (self: restricted_signal, handler: (...any) -> ()) -> connection,
    }
    @within signal
    A restricted signal object that can be connected to and fired.
]=]
export type restricted_signal = {
    Connect: (self: restricted_signal, handler: (...any) -> ()) -> connection,
    DisconnectAll: (self: restricted_signal) -> (),
    Wait: (self: restricted_signal) -> ...any,
    Once: (self: restricted_signal, handler: (...any) -> ()) -> connection,
}

-------------------------------------------------------------------------------------------

return nil

-------------------------------------------------------------------------------------------