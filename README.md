# JJHome
A home plugin for Minecraft servers using MoonScript and the Lukkit platform.

## Installation
Add the latest version of [Lukkit](https://lukkit.net) and a
JJHome.lkt file that you've built yourself or grabbed from the
[releases page](https://github.com/johnathan-coe/JJHome/releases).

## Building
### Requirements
- `moonc`
- `/bin/sh` to run the build script
- `busted` and `muck` from LuaRocks for unit tesing

### Build
```bash
> ./build.sh
Compiling MoonScript Sources (src/main/moon -> target/JJHome.lkt)
real    0m0.058s
user    0m0.046s
sys     0m0.011s
Copying Lua Sources (src/main/lua -> target/JJHome.lkt)
Copying Resources (src/main/resources -> target/JJHome.lkt)
Built target/JJHome.lkt!

Copying Unit Tests (src/test -> target/JJHome.lkt)
●●●●●
5 successes / 0 failures / 0 errors / 0 pending : 0.036223 seconds

Cleaning up...
```
This will place a JJHome.lkt folder in the target/ directory.

## Usage
Upon installation, every player wil have access to the
`/home` and `/sethome` commands.
