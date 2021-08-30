#!/bin/sh

# Remove old compiled files
rm -r target

boldBlue="\e[1;94m"
boldGreen="\e[1;92m"
reset="\e[0m"

# Compile moon files into target/moon
printf "${boldBlue}Compiling MoonScript Sources...${reset}"
time moonc src/main/moon --output-to target
echo

# target/moon -> target/JJHome.lkt
mv target/moon target/JJHome.lkt

printf "${boldBlue}Copying resources into 'target'...${reset}\n"
# Copy lua files
cp -r src/main/lua/* target/JJHome.lkt

# Copy resources (plugin.yml etc.)
cp -r src/main/resources/* target/JJHome.lkt

printf "${boldGreen}Built target/JJHome.lkt!${reset}\n"

echo
printf "${boldBlue}Running unit tests...${reset}\n"

cp -r src/test/ target/JJHome.lkt
busted -C target/JJHome.lkt test

echo
printf "${boldBlue}Cleaning up...${reset}\n"
rm -r target/JJHome.lkt/test