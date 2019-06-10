#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Upgrade any already-installed formulae.
brew update
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
sudo ln -s /opt/pkg/bin/gsha256sum /opt/pkg/bin/sha256sum

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install more recent versions of system tools
brew install curl
brew install git
brew install vim
brew install wget

# Install emacs packages
brew install emacs
brew install ispell

# Install other useful binaries.
brew install nodejs
brew install p7zip
brew install rlwrap
brew install speedtest-cli
brew install the_silver_searcher
brew install tig
brew install tree
brew install tmux
brew install jq
brew install bash-git-prompt

# Install image libraries
brew install imagemagick
brew install optipng
brew install zopfli

# Remove outdated versions from the cellar.
# brew autoremove
