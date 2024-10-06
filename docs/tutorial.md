---
sidebar_position: 1
---

# Tutorial

This tutorial will guide you through the usage of the `signal` module, which provides a robust mechanism for event handling in Luau. The module includes several classes: `signal`, `restricted_signal`, `immutable_signal`, and `connection`.

## Table of Contents
1. [Introduction](#introduction)
2. [Setting Up](#setting-up)
3. [Using Signals](#using-signals)
    - [Connecting to a Signal](#connecting-to-a-signal)
    - [Firing a Signal](#firing-a-signal)
    - [Waiting for a Signal](#waiting-for-a-signal)
    - [Connecting Once](#connecting-once)
4. [Restricted and Immutable Signals](#restricted-and-immutable-signals)
5. [Managing Connections](#managing-connections)
6. [Conclusion](#conclusion)

## Introduction

The `signal` module provides a way to create and manage events. It allows you to connect handler functions to signals, fire signals, and manage connections.

## Setting Up

First, ensure you have the `signal` module available in your project. You can include it in your script as follows:

```lua
local signal = require(path.to.signal)
```

## Using Signals

### Creating a Signal

The signal module returns a void function (no arguments) that can be quickly called to create a new signal class.

```lua
local mySignal = signal()
```

### Connecting to a Signal

To connect a handler function to a signal, use the `Connect` method. This method returns a `connection` object that can be used to disconnect the handler later.

```lua
local mySignal = signal()

local connection = mySignal:Connect(function(...)
    print("Signal fired with arguments:", ...)
end)
```

### Firing a Signal

To fire a signal and call all connected handlers, use the `Fire` method.

```lua
mySignal:Fire("Hello", "World")
```

### Waiting for a Signal

You can wait for a signal to be fired using the `Wait` method. This method yields until the signal is fired and then returns the arguments passed to the signal.

```lua
local arg1, arg2 = mySignal:Wait()
print("Signal waited for and received:", arg1, arg2)
```

### Connecting Once

To connect a handler that will only be called once, use the `Once` method.

```lua
mySignal:Once(function(...)
    print("This will only be printed once:", ...)
end)
```

## Restricted and Immutable Signals

### Restricted Signals

A `restricted_signal` can be connected to and waited on, but it cannot be fired directly. This is useful for creating signals that should only be fired by specific parts of your code.

```lua
local restrictedSignal = Signal.Restricted.new()

restrictedSignal:Connect(function(...)
    print("Restricted signal fired with arguments:", ...)
end)
```

### Immutable Signals

An `immutable_signal` can be connected to and waited on, but it cannot be fired or disconnected. This is useful for creating signals that should remain constant throughout the lifetime of your application.

```lua
local immutableSignal = Signal.Immutable.new()

immutableSignal:Connect(function(...)
    print("Immutable signal fired with arguments:", ...)
end)
```

## Managing Connections

The `connection` object returned by the `Connect` and `Once` methods can be used to disconnect the handler from the signal.

```lua
connection:Disconnect()
```

To disconnect all handlers from a signal, use the `DisconnectAll` method.

```lua
mySignal:DisconnectAll()
```

## Conclusion

The `signal` module provides a powerful and flexible way to handle events in Luau. By understanding how to use signals, restricted signals, immutable signals, and connections, you can create robust and maintainable event-driven code.
