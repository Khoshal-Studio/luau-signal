--!strict

-------------------------------------------------------------------------------------------

export type connection = {
    Disconnect: (self: any) -> ()
}

export type internal_connection = connection & {
    connected: boolean,
    signal: internal_signal,
    fn: (...any) -> (),
    next: internal_connection?
}

-------------------------------------------------------------------------------------------

export type connect<T> = (self: T, handler: (...any) -> ()) -> connection
export type disconnect_all<T> = (self: T) -> ()
export type fire<T> = (self: T, ...any) -> ()
export type wait<T> = (self: T) -> ...any
export type once<T> = (self: T, handler: (...any) -> ()) -> connection

-------------------------------------------------------------------------------------------

export type signal = {
    Connect: connect<signal>,
    DisconnectAll: disconnect_all<signal>,
    Fire: fire<signal>,
    Wait: wait<signal>,
    Once: once<signal>,

    Restricted: restricted_signal,
    Immutable: immutable_signal
}

export type internal_signal = signal & { 
    handler_list_head: internal_connection?,
}

export type restricted_signal = {
    Connect: connect<restricted_signal>,
    DisconnectAll: disconnect_all<restricted_signal>,
    Wait: wait<restricted_signal>,
    Once: once<restricted_signal>,
    Immutable: immutable_signal
}

export type immutable_signal = {
    Connect: connect<immutable_signal>,
    Wait: wait<immutable_signal>,
    Once: once<immutable_signal>,
}

-------------------------------------------------------------------------------------------

return nil

-------------------------------------------------------------------------------------------