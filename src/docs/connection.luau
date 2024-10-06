--[=[
    @class connection
    A connection object that can be used to disconnect the signal handler.
]=]

--[=[
    Disconnects the connection from the signal.

    @method Disconnect
    @within connection
]=]

--[=[
    @prop boolean connected
    @private
    @within connection
    
    Whether the connection is currently connected to the signal.
]=]

--[=[
    @prop signal internal_signal
    @readonly
    @private
    @within connection
    
    The signal that the connection is connected to.
]=]

--[=[
    @prop fn (...any) -> ()
    @readonly
    @private
    @within connection
    
    The handler function for the connection.
]=]

--[=[
    @prop next internal_connection?
    @private
    @within connection
    
    The next connection in the linked list of connections for the signal.
]=]