#!/usr/bin/env bash

set -e

# System Utilities
sudo yarn global add ghcal
sudo yarn global add cli-github
sudo yarn global add nativefier
sudo yarn global add diff-so-fancy
sudo yarn global add speed-test
sudo yarn global add vtop


# Front-end
sudo yarn global add a11y
sudo yarn global add browser-sync
sudo yarn global add gulp
sudo yarn global add perfbudget
sudo yarn global add psi


# Package Management
sudo yarn global add bower
sudo yarn global add pakmanager
sudo yarn global add wipe-modules


# CSS
sudo yarn global add autoprefixer
sudo yarn global add postcss-cli


# Javascript
sudo yarn global add browserify
sudo yarn global add harp


# React
sudo yarn global add babel
# https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bframeworks/react
# Auto-completion and documentation
sudo yarn global add tern
# Syntax Checking
sudo yarn global add eslint
sudo yarn global add babel-eslint
sudo yarn global add eslint-plugin-react
# Auto-code formatting
sudo yarn global add js-beautify


# Image Optimization
sudo yarn global add imageoptim-cli
sudo yarn global add svgo


# Syntax Check
sudo yarn global add jsonlint


# Regression Testing
sudo yarn global add slimerjs


# Web Extensions
sudo yarn global add web-ext
