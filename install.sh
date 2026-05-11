#!/bin/bash

DOTFILES_REPO=https://github.com/mattyforth/dotfiles.git
DOTFILES_REPO_ORIGIN_NAME=git@github.com:mattyforth/dotfiles.git
DOTFILES_PATH=~/.config

if ! xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
else
  echo "Xcode Command Line Tools already installed."
fi

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo "Installing oh my zsh"
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
else 
  echo "Oh my zsh already installed"
fi

# Clone our dotfiles Brewfile locally and install our dependencies.
cd ~
git clone -o $DOTFILES_REPO_ORIGIN_NAME $DOTFILES_REPO $DOTFILES_PATH

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing homebrew dependencies"
brew update
brew upgrade
brew bundle install --file=$DOTFILES_PATH/Brewfile
brew cleanup --prune=all

source ~/.config/zsh/zshrc

echo "Installing global composer packages"
composer global install 

echo "Installing NVM lts node version"
nvm install --lts

echo "Installing valet"
valet install

# Set zsh as our default shell.
echo $(which zsh) | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)
exec $SHELL

# Setup 1password ssh agent so we have access to our keys.
eval $(op signin)

eval $(op inject -i $DOTFILES_PATH/git/config.tpl -o $DOTFILES_PATH/git/config)

rm ~/.zshrc
ln -s ~/.zshrc $DOTFILES_PATH/zsh/zshrc

# Setup macos defaults - NOTE: This will close terminal, so maybe we should run it last.
./macos.sh
