---
title: Security & Access Control
description: Documentação sobre segurança, permissões e controle de acesso em Linux
category: security
tags: [security, permissions, sudo, access-control, hardening]
---

# Security & Access Control 🔐

Guias sobre segurança, permissões, controle de acesso e hardening em Linux.

## 📋 Índice de Documentos

### Controle de Acesso
- **[sudo-privilegios-linux.md](sudo-privilegios-linux.md)** - Configuração segura de privilégios sudo

---

## 🔐 Princípios de Segurança

### Princípio do Menor Privilégio
- Dar apenas as permissões necessárias
- Usar contas específicas por função
- Revogar acesso não utilizado regularmente

### Separação de Responsabilidades
- Diferentes usuários para diferentes tarefas
- Logs de auditoria ativados
- Reviewed periodicamente

---

## 🛡️ Checklist de Segurança

### Sistema
- [ ] Firewall habilitado e configurado
- [ ] SSH com chave pública (sem senha)
- [ ] Fail2ban ou similar instalado
- [ ] Atualizações automáticas ativadas
- [ ] SELinux/AppArmor configurado (opcional)

### Usuários
- [ ] Senhas fortes (min 12 caracteres)
- [ ] Sem login como root direto
- [ ] Sudo configurado com restrições
- [ ] Limpar sudoers regularmente
- [ ] 2FA para SSH (opcional)

### Acesso
- [ ] SSH em porta não-padrão (opcional)
- [ ] Rate limiting ativado
- [ ] IP whitelist quando possível
- [ ] VPN para admin remoto
- [ ] Logs centralizados

---

## 🔧 Configurações Importantes

### SSH Hardening

```bash
# /etc/ssh/sshd_config

# Disable root login
PermitRootLogin no

# Disable password auth
PasswordAuthentication no
PubkeyAuthentication yes

# Change default port
Port 2222

# Limit login attempts
MaxAuthTries 3

# X11 forwarding
X11Forwarding no
```

### Sudo Configuration

```bash
# /etc/sudoers (edit with visudo)

# User can run specific command without password
user ALL=(ALL) NOPASSWD: /usr/bin/systemctl

# Group can run all commands
%admin ALL=(ALL) ALL

# Require password for sudo
Defaults use_pty

# Log sudo usage
Defaults log_output
```

---

## 📚 Tópicos Relacionados

- [Linux - Administração de Sistemas](../linux/)
- [Networking - Configuração de Rede](../networking/)

---

## 🚨 Incidentes

### Se Comprometido

1. Desconectar da rede imediatamente
2. Gerar novo SSH key
3. Trocar todas as senhas
4. Revisar logs (auth.log, audit.log)
5. Restaurar de backup limpo
6. Analisar a vulnerabilidade

### Monitoramento

```bash
# Monitor login attempts
tail -f /var/log/auth.log | grep "Failed password"

# Monitor sudo usage
sudo journalctl -u sudo -n 20

# Monitor file changes
auditctl -w /etc/passwd -p wa
```

---

## 🎯 Best Practices

- [ ] Revisar permissões sudo mensalmente
- [ ] Atualizar sistema regularmente
- [ ] Manter backups seguros
- [ ] Testar restore de backups
- [ ] Documentar mudanças de segurança
- [ ] Treinar equipe em segurança

---

**Última atualização:** Junho 2026
