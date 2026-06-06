---
title: Networking & Infrastructure
description: Configuração de rede, reverse proxy, servidores e infraestrutura
layout: default
permalink: /docs/networking/
---

# Networking & Infrastructure 🌐

Documentação sobre configuração de rede, servidores e infraestrutura.

## 📋 Índice de Documentos

### Proxy e Web Servers
- [nginx-redirecionamentos-www.md](nginx-redirecionamentos-www.html) - Configurar redirecionamentos WWW no Nginx
- [Proxmox-onboarding-after-the-Installation.md](Proxmox-onboarding-after-the-Installation.html) - Setup de Proxmox

### Gerenciamento de Rede
- [networkmanager-nmcli-ubuntu-debian.md](networkmanager-nmcli-ubuntu-debian.html) - NetworkManager em Ubuntu/Debian
- [networkmanager-rhel-centos-8.md](networkmanager-rhel-centos-8.html) - NetworkManager em RHEL/CentOS

---

## 🔧 Configurações Comuns

### Nginx - Redirecionamento WWW

```nginx
# Redirecionar www para non-www
server {
    server_name www.example.com;
    return 301 https://example.com$request_uri;
}

server {
    server_name example.com;
    # ... configuração principal
}
```

### NetworkManager - Configurar Interface

```bash
# Listar conexões
nmcli con show

# Criar conexão estática
nmcli con add con-name "Static" ifname eth0 type ethernet ipv4.method manual ipv4.addresses 192.168.1.100/24 ipv4.gateway 192.168.1.1

# Ativar conexão
nmcli con up "Static"
```

---

## 📚 Tópicos Relacionados

- [Docker - Networking Docker](../docker/)
- [Linux - Administração de Sistemas](../linux/)
- [Monitoring - Monitoramento de Rede](../monitoring/)
- [Raspberry Pi - Configuração de Rede](../raspberry-pi/)

---

## 🔐 Boas Práticas

- Sempre usar HTTPS com certificados válidos
- Manter firewall ativo e bem configurado
- Usar reverse proxy para segurança
- Monitorar tráfego regularmente
- Fazer backup de configurações

---

**Última atualização:** Junho 2026
