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

# Plugin name
name="JJHome"

info "Compiling MoonScript Sources (src/main/moon -> target/${name}.lkt)"
time moonc src/main/moon --output-to target
mv target/moon target/${name}.lkt

info "Copying Lua Sources (src/main/lua -> target/${name}.lkt)\n"
cp -r src/main/lua/* target/${name}.lkt
info "Copying Resources (src/main/resources -> target/${name}.lkt)\n"
cp -r src/main/resources/* target/${name}.lkt

success "Built target/${name}.lkt!\n"

echo
info "Copying Unit Tests (src/test -> target/${name}.lkt)\n"
cp -r src/test/ target/${name}.lkt
busted -C target/${name}.lkt test

echo
info "Cleaning up...\n"
rm -r target/${name}.lkt/test