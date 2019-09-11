#! /usr/bin/env bash

function install_homebrew {
    command -v brew >/dev/null 2>&1
}

function install_dev_essentials {
    brew bundle install --file=./dev_essentials/Brewfile
}

function setup_emacs {
    # Change to ~ to clone emacs.d
    pushd ~/

    git clone git@github.com:pastafari/prelude.git .emacs.d
    cd .emacs.d
    git checkout pastafari

    # Change back to where we were before
    popd
}

# Install Homebrew
echo "Installing Homebrew"
install_homebrew

# Install dev essentials defined in dev_essentials/Brewfile
echo "Installing dev essentials"
install_dev_essentials

# Set up Emacs
echo "Setting up Emacs"
setup_emacs

