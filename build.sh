#!/bin/sh

# Remove old compiled files
rm -r target

# Compile moon files into target/moon
moonc src/main/moon --output-to target

# target/moon -> target/JJHome.lkt
mv target/moon target/JJHome.lkt

# Copy lua files
cp -r src/main/lua/* target/JJHome.lkt

# Copy resources (plugin.yml etc.)
cp -r src/main/resources/* target/JJHome.lkt