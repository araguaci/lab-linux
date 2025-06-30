#!/bin/bash

# Function to execute a command and check its status
execute_command() {
    local COMMAND="$1"
    echo "Executing: $COMMAND"
    if eval "$COMMAND"; then
        echo "Success: $COMMAND"
    else
        echo "Error: $COMMAND"
        exit 1
    fi
}

# Update the package list
execute_command "sudo apt-get update"

# Upgrade all installed packages to their latest versions
execute_command "sudo apt-get upgrade -y"

# Perform a distribution upgrade
execute_command "sudo apt-get dist-upgrade -y"

# Remove unnecessary packages
execute_command "sudo apt-get autoremove -y"

# Clean up the local repository of retrieved package files
execute_command "sudo apt-get clean"

execute_command "sudo apt install build-essential g++ make -y"

# Install additional packages
execute_command "sudo apt install screenfetch btop htop nano wget curl git uuid-dev cmake -y"

execute_command "sudo apt install neofetch ncdu -y"

execute_command "curl -sS https://starship.rs/install.sh | sh"

cd ~
echo 'nano .bashrc'
echo 'eval "$(starship init bash)"'
eval "$(starship init bash)"

echo "Update complete!"
exit 0
