---
title: Lab Linux Overview
description: Documentação completa sobre Linux, Docker, WSL e infraestrutura
category: overview
tags: [overview, documentation, linux, docker, wsl, infrastructure]
---

# Lab Linux 🐧

Documentação completa e centralizada sobre **Linux, Docker, WSL e Infraestrutura**. Um repositório com tutoriais, guias práticos e scripts para desenvolvedores e administradores de sistemas.

## 📚 O que você encontra aqui

### Sistemas Operacionais & Linux
- **Comandos essenciais** - Referência completa de comandos Linux
- **Ubuntu** - Guias e configurações específicas
- **Debian** - Instalação e gerenciamento
- **Rocky Linux** - Setup em WSL e bare metal
- **Sistema de Permissões** - Sudo, ACL, fileystem permissions

### Docker & Containerização
- **Setup com WSL2** - Integração Docker com Windows
- **Operação e Boas Práticas** - Comandos, networking, volumes
- **Compose** - Orquestração de múltiplos containers
- **Dicas de Performance** - Otimização de containers

### WSL (Windows Subsystem for Linux)
- **Instalação e Configuração** - Setup inicial
- **Systemd no WSL** - Ativar serviços nativos
- **Otimização** - Performance e integração com Windows
- **Distros customizadas** - Rocky Linux, Ubuntu e outros

### Infraestrutura & DevOps
- **Nginx** - Reverse proxy, load balancing
- **SSH** - Chaves, autenticação, tunneling
- **Rede** - IP estático, DNS, roteamento
- **Monitoramento** - Zabbix, logs
- **Telefonia** - FreePBX, SIP
- **Virtualização** - KVM, QEMU

### Segurança
- **Firewall** - UFW, iptables
- **Acesso** - SSH hardening, key management
- **Permissões** - Princípio do menor privilégio
- **Auditoria** - Logs e monitoramento

### Customização & Produtividade
- **Starship** - Prompt elegante e rápido
- **Shell Scripting** - Automação e scripts
- **Dotfiles** - Configurações portáveis

## 🚀 Início Rápido

### Explorar Documentação
1. Leia [index.md](index.md) para uma visão geral
2. Navegue pelos documentos `.md` na raiz do repositório
3. Use a [visualização no GitHub Pages](#) para melhor leitura

### Usar Configurações
```bash
# Clonar o repositório
git clone https://github.com/araguaci/lab-linux.git
cd lab-linux

# Copiar configurações (ex: starship.toml)
cp starship.toml ~/.config/starship.toml

# Aplicar scripts conforme necessário
# (revise o conteúdo antes de executar)
```

## 📖 Documentos Principais

| Documento | Descrição |
|-----------|-----------|
| [index.md](index.md) | Página inicial e navegação |
| [docker-commands.md](docker-commands.md) | Referência de comandos Docker |
| [docker2wsl.md](docker2wsl.md) | Integração Docker com WSL2 |
| [ubuntu-commands.md](ubuntu-commands.md) | Guia Ubuntu |
| [debian-commands.md](debian-commands.md) | Guia Debian |
| [rockylinux-on-wsl.md](rockylinux-on-wsl.md) | Rocky Linux no WSL |
| [wsl-systemd.md](wsl-systemd.md) | Systemd no WSL |
| [starship.toml](starship.toml) | Configuração de prompt Starship |

## 🛠️ Como usar este repositório

### Para Aprender
- Cada documento `.md` é **autoexplicativo** e inclui exemplos
- Comece pelo tópico que te interessa
- Siga os passos em ordem

### Para Implementar
- **Revise sempre o código/comandos** antes de executar
- Adapte as configurações para seu ambiente
- Teste em máquinas não-críticas primeiro
- Faça backup antes de mudanças importantes

### Para Contribuir
1. Fork o repositório
2. Crie uma branch para sua contribuição
3. Commit com mensagens claras
4. Envie um Pull Request

## 🔧 Stack Técnico

- **Jekyll** - Gerador de site estático
- **Markdown** - Formato de documentação
- **GitHub Pages** - Hosting
- **Kramdown** - Parser Markdown
- **Minimal Theme** - Tema limpo e responsivo

## 📋 Configuração Local

### Visualizar documentação localmente
```bash
# Instalar Jekyll
gem install jekyll bundler

# Instalar dependências
bundle install

# Servir localmente
bundle exec jekyll serve
# Abrir http://localhost:4000
```

## 🌟 Destaques

✅ **Documentação completa** - Guias desde o básico até tópicos avançados  
✅ **Exemplos práticos** - Comandos reais prontos para usar  
✅ **Atualizações regulares** - Conteúdo mantido em dia  
✅ **Fácil de compartilhar** - Links diretos para cada seção  
✅ **Código limpo** - Configurações prontas para copiar  

## 📝 Licença

Este projeto está disponível sob a licença MIT. Veja [LICENSE](LICENSE) para detalhes.

## 💬 Suporte & Contato

- **Issues** - Reporte bugs ou sugira melhorias
- **Discussões** - Compartilhe conhecimento e tire dúvidas
- **GitHub** - [araguaci/lab-linux](https://github.com/araguaci/lab-linux)

---

**Última atualização:** 2024  
**Mantido por:** [Araguaci Carlos de Andrade](https://github.com/araguaci)

Aproveite os recursos e bom aprendizado! 🚀
