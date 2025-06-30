#!/bin/bash

set -e

stop_docker() {
    echo "Stopping Docker services..."
    sudo systemctl stop docker
    sudo systemctl disable docker
}

remove_docker_packages() {
    echo "Removing Docker packages..."
    sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo apt-get autoremove -y
}

remove_docker_files() {
    echo "Removing Docker files and directories..."
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/containerd
    sudo rm -rf /etc/docker
    sudo rm -rf /etc/apt/keyrings/docker.asc
    sudo rm -rf /etc/apt/sources.list.d/docker.list
}

main() {
    stop_docker
    remove_docker_packages
    remove_docker_files
    echo "Docker has been cleaned up successfully!"
}

main
exit 0