#!/usr/bin/env bash

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Mac App Store CLI
brew install argon/mas/mas

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install ctags
brew install curl
brew install fasd
brew install git
brew install git-extras
brew install git-lfs
brew install hub
brew install imagemagick --with-webp
brew install optipng
brew install p7zip
brew install reattach-to-user-namespace
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install the_silver_searcher
brew install tig
brew install tree
brew install tmux
brew install webkit2png
brew install zopfli

# Install Cask and Applications
brew install caskroom/cask/brew-cask
brew cask install dropbox
brew cask install firefox
brew cask install karabiner
brew cask insatll imagealpha
brew cask insatll imageoptim
brew cask install java
brew cask install licecap
brew cask install macvim
brew cask install seil
brew cask install trim-enabler
brew cask install vagrant
brew cask install virtualbox

# Remove outdated versions from the cellar.
brew cleanup
