#!/bin/sh

# Remove old compiled files
rm -r target

# Compile moon files in src
moonc src/main/moon --output-to target

# Alter dir structure
# mv target/moon/* target
mv target/moon target/JJHome.lkt

# Copy lua
cp -r src/main/lua/* target/JJHome.lkt

# Copy resources
cp -r src/main/resources/* target/JJHome.lkt