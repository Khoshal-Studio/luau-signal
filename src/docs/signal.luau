--[=[
    @class signal
    A signal object that can be connected to and fired.
]=]

--[=[
    @prop handler_list_head string
    @within signal
    @private
    The head of the handler linked list for the signal.
]=]

--[=[
    @method Connect
    @param handler (...any) -> ()
    @return connection
    @within signal

    Connects a handler function to the signal.
]=]

--[=[
    @method DisconnectAll
    @within signal

    Disconnects all handler functions from the signal.
]=]

--[=[
    @method Fire
    @param ... any
    @within signal

    Fires the signal with the given arguments.
]=]

    --[=[
    @method Wait
    @return ...any
    @within signal
    @yields

    Waits for the signal to be fired and returns the arguments that were passed to the signal when it was fired.
]=]

--[=[
    @method Once
    @param handler (...any) -> ()
    @return connection
    @within signal

    Connects a handler function to the signal that will only be called once.
]=]

--[=[
    @prop Restricted restricted_signal
    @within signal

    A restricted signal object that can only be connected to.
]=]

--[=[
    @prop Immutable immutable_signal
    @within signal

    An immutable signal object that can only be connected to.
]=]
