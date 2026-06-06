---
title: Monitoring & Observability
description: Ferramentas de monitoramento, observabilidade e diagnóstico de sistemas
layout: default
---

# Monitoring & Observability 📊

Ferramentas e guias para monitoramento, observabilidade e diagnóstico de sistemas.

## 📋 Índice de Documentos

### Monitoramento de Performance
- [processos-devorador-cpu-linux.md](processos-devorador-cpu-linux.html) - Identificar processos que consomem CPU
- [httptap-monitorar-http-https.md](httptap-monitorar-http-https.html) - Monitorar tráfego HTTP/HTTPS

### Plataformas de Monitoramento
- [zabbix-725-debian-12.md](zabbix-725-debian-12.html) - Instalação do Zabbix 7.2.5 em Debian 12

---

## 🚀 Ferramentas Recomendadas

### Monitoramento Local
```
htop        - Monitor de processos interativo
iotop       - Monitor de I/O de disco
glances     - Dashboard de sistema
nethogs     - Monitor de uso de banda por processo
iftop       - Monitor de tráfego em tempo real
```

### Monitoramento Centralizado
```
Zabbix      - Monitoring e alerting
Prometheus  - Time series database
Grafana     - Visualização de dados
ELK Stack   - Logs e busca
```

---

## 🔍 Comandos Úteis

### Diagnosticar CPU

```bash
# Top processes
ps aux --sort=-%cpu | head -10

# CPU por processo
htop

# Ativa threads
ps -eLf | wc -l
```

### Diagnosticar Memória

```bash
# Uso de memória
free -h

# Detalhado
cat /proc/meminfo

# Por processo
ps aux --sort=-%mem | head -10
```

### Diagnosticar Disco

```bash
# Uso geral
df -h

# Detalhado por pasta
ncdu /

# I/O
iotop
```

---

## 📈 Setup Zabbix

```bash
# Instalar servidor
sudo apt install zabbix-server-mysql zabbix-frontend-php

# Acessar interface
# http://localhost/zabbix

# Usuário padrão
# Admin / zabbix
```

---

## 📚 Tópicos Relacionados

- [Linux - Administração de Sistemas](../linux/)
- [Networking - Configuração de Rede](../networking/)
- [Docker - Monitoramento de Containers](../docker/)

---

**Última atualização:** Junho 2026
