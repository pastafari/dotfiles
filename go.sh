#! /usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

function info {
    echo -e "${GREEN}$1${NO_COLOR}"
}

function danger {
    echo -e "${RED}$1${NO_COLOR}"
}

function install_homebrew {
    if ! [ -x "$(command -v brew)" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        info "Homebrew already installed"
    fi
}

function install_dev_essentials {
    brew bundle install --file=./dev_essentials/Brewfile
}

function setup_emacs {
    info "Setting up emacs for you pastafari"
    
    # Change to ~ to clone emacs.d
    pushd ~/ > /dev/null

    # Guard for existing emacs.d
    if [ -d ".emacs.d" ]; then
       danger "~/.emacs.d already exists. Overwrite? [y/n]"

       read overwrite

       [[ "$overwrite" == "n" ]] || info "Ok. Not cloning pastafari/prelude"; return 0
    fi

    info "Cloning and setting up pastafari/prelude with branch pastafari"

    git clone git@github.com:pastafari/prelude.git .emacs.d
    cd .emacs.d
    git checkout pastafari

    # Change back to where we were before
    popd > /dev/null
}

# Install Homebrew
info "Installing Homebrew"
install_homebrew

# Install dev essentials defined in dev_essentials/Brewfile
info "Installing dev essentials"
install_dev_essentials

# Set up Emacs
info "Setting up Emacs"
setup_emacs


info "Done"
