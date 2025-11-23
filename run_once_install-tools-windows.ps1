#!/bin/bash

set -e

echo "📦 Installing tools with homebrew..."
# common tools
brew install \
    bat \
    cmake \
    fd \
    ffmpeg \
    fzf \
    gh \
    ghq \
    jq \
    neovim \
    uv \
    rbenv \
    pipx \
    pnpm \
    ripgrep \
    tree \
    tmux 


echo "✅ Packages installed"
