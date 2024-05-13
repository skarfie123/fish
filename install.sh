#!/bin/bash

set -eu

echo "Installing fish config"

cp -r conf.d ~/.config/fish
if [ -d "~/.config/fish/functions" ]; then
    rm ~/.config/fish/functions
fi
cp -r functions ~/.config/fish
cp ./config.fish ~/.config/fish/config.fish