---
title: VoIP & PBX Systems
description: Documentação sobre sistemas de telefonia IP, Asterisk, FreePBX e Issabel
category: voip
tags: [voip, asterisk, freepbx, issabel, pbx, telephony]
---

# VoIP & PBX Systems ☎️

Guias completos para sistemas de telefonia IP e PBX open-source.

## 📋 Índice de Documentos

### Plataformas
- **[issabel-debian-12-asterisk.md](issabel-debian-12-asterisk.md)** - Issabel com Asterisk 20 em Debian 12

### Aplicações para Raspberry Pi
- **[freepbx-raspberry-pi.md](../raspberry-pi/freepbx-raspberry-pi.md)** - FreePBX no Raspberry Pi
- **[asterisk-raspberry-pi.md](../raspberry-pi/asterisk-raspberry-pi.md)** - Asterisk no Raspberry Pi

---

## 📋 Plataformas Disponíveis

### Asterisk
- **Tipo:** Core PBX software
- **Licença:** GPL
- **Complexidade:** Média-Alta
- **Uso:** Produção, setups customizados

### FreePBX
- **Tipo:** Distribuição baseada em Asterisk
- **Licença:** AGPL
- **Complexidade:** Baixa-Média
- **Uso:** SMB, setup rápido

### Issabel
- **Tipo:** Fork de FreePBX (abandonado)
- **Licença:** GPL
- **Complexidade:** Baixa-Média
- **Uso:** Alternativa a FreePBX

---

## 🚀 Comparação Rápida

| Feature | Asterisk | FreePBX | Issabel |
|---------|----------|---------|---------|
| Curva Aprendizado | Alta | Média | Média |
| WebUI | ✗ | ✓ | ✓ |
| Suporte Comercial | ✓ | ✓ | ✗ |
| Customização | Muito | Sim | Sim |
| Performance | Excelente | Bom | Bom |

---

## 🔧 Componentes Básicos

### Asterisk
```
┌─ Dialplan (routing de chamadas)
├─ Extensões (ramal do usuário)
├─ Trunks (conexão com carriers)
├─ IVR (menu de voz)
├─ Voicemail (caixa postal)
└─ Features (estacionamento, gravação, etc)
```

### Endpoints
```
SIP - Protocol mais comum
IAX2 - Proprietário Asterisk
H.323 - Legado
DAHDI - Digital phones
```

---

## 📞 Casos de Uso

- **Contact Center** - IVR + gravação
- **Empresa** - Ramais + trunks
- **ITSP** - Carrier de VoIP
- **Remoto** - Softphone + nuvem

---

## 🔐 Segurança

- Usar TLS para SIP
- Firewall com regras SIP
- Fail2ban para ataques
- Atualizar regularmente
- Limitar acesso administrativo

---

## 📚 Tópicos Relacionados

- [Linux - Administração de Sistemas](../linux/)
- [Networking - Configuração de Rede](../networking/)
- [Raspberry Pi - VoIP no Raspberry](../raspberry-pi/)

---

## 🔗 Links Úteis

- [Asterisk Official](https://www.asterisk.org/)
- [FreePBX](https://www.freepbx.org/)
- [Issabel](https://issabel.org/)

---

**Última atualização:** Junho 2026
