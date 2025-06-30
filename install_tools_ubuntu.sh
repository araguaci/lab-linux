#!/bin/bash

# Script to install specified tools on Ubuntu

# Exit on error
set -e

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install tools available via apt
echo "Installing tools via apt..."
sudo apt install -y \
  ncdu \
  duff \
  ripgrep \
  mosh \
  lshw \
  mtr \
  fd-find \
  fzf \
  ranger \
  zoxide \
  eza \
  glances \
  iotop \
  coreutils \
  pcp \
  procps \
  progress \
  dnsutils \
  tcpdump \
  wireshark-common \
  tshark \
  termshark \
  lsof \
  ipcalc \
  magic-wormhole \
  systemd \
  rsync \
  moreutils \
  unp \
  jq \
  taskwarrior \
  asciinema \
  fabric

# Install dog via cargo if not already installed
if ! command -v dog &> /dev/null; then
  echo "Installing Rust and cargo for dog..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source $HOME/.cargo/env
  echo "Installing dog..."
  cargo install dog
fi

# Install procs via cargo if not already installed
if ! command -v procs &> /dev/null; then
  echo "Installing procs..."
  cargo install procs
fi

# Install lazydocker
if ! command -v lazydocker &> /dev/null; then
  echo "Installing lazydocker..."
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
fi

echo "Installation completed!"