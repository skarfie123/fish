#!/bin/bash

set -eu

echo "Installing fish config"

cp -r conf.d ~/.config/fish
cp -r functions ~/.config/fish
cp ./config.fish ~/.config/fish/config.fish