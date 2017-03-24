#!/usr/bin/env bash

# Install command-line tools using Homesudo pkgin -y.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Upgrade any already-installed formulae.
sudo pkgin -y update
sudo pkgin -y full-upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(sudo pkgin -y --prefix coreutils)/libexec/gnubin` to `$PATH`.
sudo pkgin -y install coreutils
sudo ln -s /opt/pkg/bin/gsha256sum /opt/pkg/bin/sha256sum

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
sudo pkgin -y install bash
sudo pkgin -y install bash-completion

# Install `wget` with IRI support.
sudo pkgin -y install wget

# Install more recent versions of some OS X tools.
sudo pkgin -y install vim

# Install other useful binaries.
sudo pkgin -y install curl
sudo pkgin -y install git
sudo pkgin -y install imagemagick
sudo pkgin -y install nodejs
sudo pkgin -y install optipng
sudo pkgin -y install p7zip
sudo pkgin -y install speedtest-cli
sudo pkgin -y install the_silver_searcher
sudo pkgin -y install tig
sudo pkgin -y install tree
sudo pkgin -y install tmux
sudo pkgin -y install zopfli

# Remove outdated versions from the cellar.
sudo pkgin -y autoremove
