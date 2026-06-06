---
title: Docker & Containers
description: Documentação completa sobre Docker e containerização
category: docker
tags: [docker, containers, devops, virtualization]
---

# Docker & Containers 🐳

Tudo o que você precisa saber sobre Docker, containers e orquestração.

## 📋 Índice de Documentos

### Comandos e Operações
- **[docker-commands.md](docker-commands.md)** - Referência completa de comandos Docker
- **[docker2wsl.md](docker2wsl.md)** - Exportar containers Docker para WSL
- **[docker-build-export-wsl2-import.commands.md](docker-build-export-wsl2-import.commands.md)** - Script de build, export e import

### Networking
- **[encontrar-endereco-ip-container-docker.md](encontrar-endereco-ip-container-docker.md)** - Como descobrir IP de containers

---

## 🚀 Quick Start

### Comandos mais usados

```bash
# Ver containers em execução
docker ps

# Criar e rodar container
docker run -it ubuntu bash

# Parar container
docker stop <container-id>

# Ver logs
docker logs <container-id>

# Executar comando em container rodando
docker exec -it <container-id> bash
```

---

## 📚 Tópicos Relacionados

- [WSL - Docker com WSL](../wsl/)
- [Linux - Instalação de Docker](../linux/)
- [Networking - Docker Networking](../networking/)

---

**Última atualização:** Junho 2026
