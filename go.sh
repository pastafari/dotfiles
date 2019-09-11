#! /usr/bin/env bash

function install_homebrew {
    command -v brew >/dev/null 2>&1
}

# Install Homebrew
echo "Installing Homebrew"
install_homebrew

# Install dev essentials defined in dev_essentials/Brewfile
echo "Installing dev essentials"
brew bundle install --file=./dev_essentials/Brewfile
