#!/bin/bash

set -e

echo "📦 Installing tools with homebrew..."
brew install \
    fzf \
    jq \
    bat \
    ghq

echo "✅ Packages installed"
