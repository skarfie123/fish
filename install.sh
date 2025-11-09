#!/bin/bash

set -eu

echo "Installing fish config"

cp -r conf.d ~/.config/fish
cp ./config.fish ~/.config/fish/config.fish