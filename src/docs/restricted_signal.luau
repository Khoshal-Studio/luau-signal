--[=[
    @class restricted_signal
    A restricted signal object that can only be connected to.
]=]

--[=[
    @method Connect
    @param handler (...any) -> ()
    @return connection
    @within restricted_signal

    Connects a handler function to the signal.
]=]
--[=[
    @method DisconnectAll
    @within restricted_signal

    Disconnects all handler functions from the signal.
]=]

--[=[
    @method Wait
    @return ...any
    @within restricted_signal
    @yields

    Waits for the signal to be fired and returns the arguments that were passed to the signal when it was fired.
]=]

--[=[
    @method Once
    @param handler (...any) -> ()
    @return connection
    @within restricted_signal

    Connects a handler function to the signal that will only be called once.
]=]

--[=[
    @prop Immutable immutable_signal
    @within restricted_signal

    An immutable signal object that can only be connected to.
]=]