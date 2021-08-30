# JJHome
A home plugin for Minecraft servers using MoonScript and the Lukkit platform.

## Installation
Add the latest version of [Lukkit](https://lukkit.net) and a
JJHome.lkt file that you've built yourself or grabbed from the
[releases page](https://github.com/johnathan-coe/JJHome/releases).

## Building
### Requirements
- `moonc`
- `/bin/sh` (for now)
### Build
```bash
> ./build.sh
Compiling MoonScript...
real    0m0.055s
user    0m0.050s
sys     0m0.006s

Copying resources into 'target'...
Built target/JJHome.lkt!
```
This will place a JJHome.lkt folder in the target/ directory.

## Usage
Upon installation, every player wil have access to the
`/home` and `/sethome` commands.
