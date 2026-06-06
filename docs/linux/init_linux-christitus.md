---
title: Init Linux ChrisTitus
description: Script de inicialização Linux baseado em ChrisTitus Tech
category: linux
tags: [linux, setup, script, initialization, shell]
---

#!/bin/bash

# amd64
# wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.17.2/fastfetch-linux-amd64.deb

# aarch64
# wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.17.2/fastfetch-linux-aarch64.deb

sudo apt install git curl wget -y

curl -fsSL https://christitus.com/linux | sh
