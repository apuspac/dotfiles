#!/bin/bash

set -e

echo "📦 Installing packages..."

sudo apt update
sudo apt install -y \
  git \
  curl \
  file \
  build-essential \
  procps \
  zsh


if ! command -v brew &> /dev/null; then
  echo "🍺 Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# rust
curl https://sh.rustup.rs -sSf | sh


