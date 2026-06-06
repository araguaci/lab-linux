---
title: Docker & Containers
description: Documentação completa sobre Docker e containerização
layout: default
permalink: /docs/docker/
---

# Docker & Containers 🐳

Tudo o que você precisa saber sobre Docker, containers e orquestração.

## 📋 Índice de Documentos

### Comandos e Operações
- [docker-commands.md](docker-commands.html) - Referência completa de comandos Docker
- [docker2wsl.md](docker2wsl.html) - Exportar containers Docker para WSL
- [docker-build-export-wsl2-import.commands.md](docker-build-export-wsl2-import.commands.html) - Script de build, export e import

### Networking
- [encontrar-endereco-ip-container-docker.md](encontrar-endereco-ip-container-docker.html) - Como descobrir IP de containers

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

## 🔧 Configurações Comuns

### Rodar container com volume
```bash
docker run -it -v /caminho/local:/caminho/container ubuntu bash
```

### Rodar container em background
```bash
docker run -d --name meu-app -p 8080:80 nginx
```

### Parar e remover containers
```bash
docker stop $(docker ps -q)
docker rm $(docker ps -aq)
```

---

## 📚 Tópicos Relacionados

- [WSL - Docker com WSL](../wsl/)
- [Linux - Instalação de Docker](../linux/)
- [Networking - Redes de Containers](../networking/)

---

## 🌟 Destaques

✅ **Containerização fácil** - Da instalação à produção  
✅ **Integração com WSL2** - Docker nativo no Windows  
✅ **Exemplos práticos** - Comandos prontos para usar  

---

**Última atualização:** Junho 2026
