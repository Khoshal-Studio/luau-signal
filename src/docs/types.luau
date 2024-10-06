--[=[
    @interface connection
    @within connection

    @field Disconnect (self: connection) -> ()

    A connection object that can be used to disconnect the signal handler.
]=]

--[=[
    @interface signal
    @within signal

    @field Connect (self: signal, handler: (...any) -> ()) -> connection
    @field DisconnectAll (self: signal) -> ()
    @field Fire (self: signal, ...any) -> ()
    @field Wait (self: signal) -> ...any
    @field Once (self: signal, handler: (...any) -> ()) -> connection

    @field Restricted restricted_signal
    @field Immutable immutable_signal

    A signal object that can be connected to and fired.
]=]

--[=[
    @interface restricted_signal
    @within restricted_signal

    @field Connect (self: restricted_signal, handler: (...any) -> ()) -> connection
    @field DisconnectAll (self: restricted_signal) -> ()
    @field Wait (self: restricted_signal) -> ...any
    @field Once (self: restricted_signal, handler: (...any) -> ()) -> connection
    @field Immutable immutable_signal

    A signal object that can be connected to but does not have the Fire method.
]=]


--[=[
    @interface immutable_signal
    @within immutable_signal

    @field Connect (self: immutable_signal, handler: (...any) -> ()) -> connection
    @field Wait (self: immutable_signal) -> ...any
    @field Once (self: immutable_signal, handler: (...any) -> ()) -> connection

    A signal object that can be connected to but does not have DisconnectAll or Fire methods.
]=]