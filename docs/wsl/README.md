---
title: WSL & Windows + Linux
description: Guias para Windows Subsystem for Linux 2, distribuições e configuração
category: wsl
tags: [wsl, windows, linux, subsystem, setup]
---

# WSL & Windows + Linux 🪟 + 🐧

Tudo sobre Windows Subsystem for Linux, instalação de distribuições e configuração.

## 📋 Índice de Documentos

### Instalação Base
- **[install-wsl-ubuntu.md](install-wsl-ubuntu.md)** - Instalação do WSL com Ubuntu
- **[manual-wsl2-distributions.md](manual-wsl2-distributions.md)** - Instalação manual de distribuições WSL2
- **[wsl-systemd.md](wsl-systemd.md)** - Ativar systemd no WSL

### Distribuições
- **[ubuntu-2204-wsl.md](ubuntu-2204-wsl.md)** - Ubuntu 22.04 no WSL
- **[rocky-linux-wsl.md](rocky-linux-wsl.md)** - Rocky Linux no WSL
- **[rocky-linux-wsl2.md](rocky-linux-wsl2.md)** - Rocky Linux no WSL2
- **[kali-wsl.md](kali-wsl.md)** - Kali Linux no WSL

### Interface Gráfica
- **[wsl2-gui-setup.md](wsl2-gui-setup.md)** - Setup completo de GUI no WSL2

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
