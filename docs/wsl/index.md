---
title: WSL & Windows + Linux
description: Guias para Windows Subsystem for Linux 2, distribuições e configuração
layout: default
---

# WSL & Windows + Linux 🪟 + 🐧

Tudo sobre Windows Subsystem for Linux, instalação de distribuições e configuração.

## 📋 Índice de Documentos

### Instalação Base
- [Instalação do WSL com Ubuntu](install-wsl-ubuntu.html)
- [Instalação Manual de Distribuições WSL2](manual-wsl2-distributions.html)
- [Ativar Systemd no WSL](wsl-systemd.html)

### Distribuições
- [Ubuntu 22.04 no WSL](ubuntu-2204-wsl.html)
- [Rocky Linux no WSL](rocky-linux-wsl.html)
- [Rocky Linux no WSL2](rocky-linux-wsl2.html)
- [Kali Linux no WSL](kali-wsl.html)

### Interface Gráfica
- [Setup Completo de GUI no WSL2](wsl2-gui-setup.html)

---

## 🚀 Quick Start

### Instalação Rápida do WSL

```powershell
# Habilitar WSL
wsl --install

# Listar distribuições disponíveis
wsl --list --online

# Instalar distribuição específica
wsl --install -d Ubuntu-22.04

# Usar distribuição
wsl -d Ubuntu-22.04
```

### Verificar Versão

```bash
wsl --version
```

---

## 📋 Checklist de Configuração

- [ ] WSL 2 instalado
- [ ] Distribuição Linux escolhida
- [ ] Systemd ativado (opcional)
- [ ] GUI configurada (opcional)
- [ ] Docker integrado (opcional)

---

## 📚 Tópicos Relacionados

- [Docker - Docker com WSL](../docker/)
- [Linux - Comandos e Ferramentas](../linux/)
- [Networking - Configuração de Rede](../networking/)

---

**Última atualização:** Junho 2026
