#!/bin/sh

# Remove old compiled files
rm -r target

# Compile moon files into target/moon
printf "Compiling MoonScript..."
time moonc src/main/moon --output-to target
echo ""

# target/moon -> target/JJHome.lkt
mv target/moon target/JJHome.lkt

echo "Copying resources into 'target'..."
# Copy lua files
cp -r src/main/lua/* target/JJHome.lkt

# Copy resources (plugin.yml etc.)
cp -r src/main/resources/* target/JJHome.lkt

echo "Built target/JJHome.lkt!"