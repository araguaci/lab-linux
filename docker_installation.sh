#!/bin/bash

set -e

update_system() {
    sudo apt-get update
    sudo apt-get upgrade -y
}

install_dependencies() {
    sudo apt-get install -y ca-certificates curl
}

add_docker_gpg_key() {
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
}

add_docker_repo() {
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
}

install_docker() {
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

start_docker() {
    sudo systemctl enable docker
    sudo systemctl start docker
}

verify_docker() {
    echo "Docker has been installed successfully!"
    sudo docker --version
}

main() {
    update_system
    install_dependencies
    add_docker_gpg_key
    add_docker_repo
    install_docker
    start_docker
    verify_docker
}

main
exit 0