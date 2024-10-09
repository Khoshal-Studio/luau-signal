# Intro

Welcome to the `signal` class module. This module is a lightweight implementation of an event/signal object in Lua. It is designed to be simple and easy to use, while also being powerful and flexible. The module is designed to be used in Roblox Studio.

## Table of Contents

1. [Installation](#installation)
    1. [Roblox Studio](#roblox-studio)
        1. [Releases Page](#releases-page)
        2. [Toolbox](#toolbox)
        3. [Build from Source](#build-from-source)
    2. [Rojo](#Rojo)
2. [Usage](#Usage)
    1. [Examples](#Examples)

## Installation

### Roblox Studio

#### Releases Page
Head to the [Releases Page](https://github.com/Khoshal-Studio/luau-signal/releases) on Github and download the signal.rbxm file attached from the latest release. You can then drag this file from your file explorer into the explorer tab in Roblox Studio.

#### Toolbox
On a browser, go the [Marketplace Asset page](https://create.roblox.com/store/asset/107842237168389) for the signal module and add the free asset to your toolbox. In Roblox Studio, you can add the module to your game through the Toolbox menu, where you will find it under the "My Models" section.

#### Build from Source
Alternatively you can build the module yourself by cloning the repository with the command `git clone https://github.com/Khoshal-Studio/luau-signal.git` and then running the command `rojo build --output signal.rbxm`. This requires the Rojo 7.4 CLI.

### Rojo
You can clone the repository and simply copy the `src` directory and place it into your Rojo project. You should rename the folder from "src" to something more suitable such as "signal".

## Usage

Create a new signal with the `.new` method. sThe API is identical to the Roblox `RBXScriptSignal` class, with the addition of the `Immutable` and `Restricted` interfaces, which are stored as properties of the signal object. Refer to the [API Documentation](https://khoshal-studio.github.io/luau-signal/api) for more information.

### Examples

```lua
local signal = require(path.to.signal)

local mySignal = signal.new()

mySignal:Connect(function()
    print("Hello, World!")
end)
```

```lua
local DiedSignal = signal.new()

local Restricted = DiedSignal.Restricted
local Immutable = DiedSignal.Immutable

local NPC = {
    Health = 100,
    Died = Immutable, -- cannot by fired by external code
}

DiedSignal:Connect(function()
    print("NPC has died!")
end)
```


