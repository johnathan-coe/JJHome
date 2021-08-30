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
- `busted` for unit testing

### Build
```bash
> ./build.sh
Compiling MoonScript Sources...
real    0m0.076s
user    0m0.070s
sys     0m0.007s

Copying resources into 'target'...
Built target/JJHome.lkt!

Running unit tests...
●●●●●
5 successes / 0 failures / 0 errors / 0 pending : 0.056971 seconds

Cleaning up...
```
This will place a JJHome.lkt folder in the target/ directory.

## Usage
Upon installation, every player wil have access to the
`/home` and `/sethome` commands.
