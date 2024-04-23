#!/bin/bash

set -eu

echo "Installing fish config"

cp -r conf.d ~/.config/fish
cp -r functions ~/.config/fish
cp ./config.fish ~/.config/fish/config.fish
cp ./fish_variables ~/.config/fish/fish_variables