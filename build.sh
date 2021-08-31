#!/bin/sh

# Remove old compiled files
rm -r target

# Formatting vars
boldBlue="\e[1;94m"
boldGreen="\e[1;92m"
reset="\e[0m"

# Formatting commands
info() {
    printf "${boldBlue}${1}${reset}"
}

success() {
    printf "${boldGreen}${1}${reset}"
}


info "Compiling MoonScript Sources (src/main/moon -> target/JJHome.lkt)"
time moonc src/main/moon --output-to target
mv target/moon target/JJHome.lkt

info "Copying Lua Sources (src/main/lua -> target/JJHome.lkt)\n"
cp -r src/main/lua/* target/JJHome.lkt
info "Copying Resources (src/main/resources -> target/JJHome.lkt)\n"
cp -r src/main/resources/* target/JJHome.lkt

success "Built target/JJHome.lkt!\n"

echo
info "Copying Unit Tests (src/test -> target/JJHome.lkt)\n"
cp -r src/test/ target/JJHome.lkt
busted -C target/JJHome.lkt test

echo
info "Cleaning up...\n"
rm -r target/JJHome.lkt/test