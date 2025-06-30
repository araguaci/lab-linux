#!/bin/bash

sudo yum update -y

sudo yum install dnf nano git wget -y

# Update system and install essential development tools for Rocky Linux 9
echo "Updating system packages..."
sudo dnf update -y

# Install basic development tools
echo "Installing development essentials..."
sudo dnf groupinstall "Development Tools" -y

# Install specific developer tools
sudo dnf install -y \
    git \
    vim \
    nano \
    gcc \
    gcc-c++ \
    make \
    python3 \
    python3-pip \
    nodejs \
    npm \
    java-11-openjdk-devel \
    curl \
    wget \
    unzip \
    jq \
    sqlite \
    docker \
    docker-compose

# Enable and start Docker service
echo "Configuring Docker..."
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

# Install additional useful Python tools
echo "Installing Python development tools..."
pip3 install --user \
    virtualenv \
    pylint \
    black \
    requests

# Install VS Code (through RPM repository)
echo "Installing Visual Studio Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code -y

sudo dnf -y install \
vim \
wget \
curl \
traceroute \
rsync \
dos2unix \
zip \
unzip \
bash-completion \
bc \
bzip2 \
file \
time \
glibc-langpack-en \
libmodulemd \
libzstd \
passwd \
sudo \
cracklib-dicts \
openssh-clients \
htop \
ansible \
git \
mc \
nmap-ncat \
bind-utils \
connect-proxy \
powerline \
powerline-fonts

# Verify installations
echo "Verifying installed versions..."
git --version
python3 --version
node --version
npm --version
java --version
docker --version
code --version

echo "-----------------------"
echo "Development environment setup complete!"
echo "Recommended next steps:"
echo "1. Log out and back in to apply Docker group changes"
echo "2. Configure git: git config --global user.name 'Your Name'"
echo "3. Configure git: git config --global user.email 'your@email.com'"
echo "-----------------------"
