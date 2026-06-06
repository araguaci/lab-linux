
---
title: WSL Systemd Setup
description: Guia para ativar e configurar systemd no Windows Subsystem for Linux
category: wsl
tags: [wsl, systemd, genie, ubuntu, setup]
---

O erro `E: Unable to locate package systemd-genie` ocorre porque o pacote **`systemd-genie` não está nos repositórios padrão do Ubuntu** — ele é mantido separadamente no GitHub.

Mas se você quiser **ativar o `systemd` no WSL** usando o **Genie**, aqui vai o **passo a passo oficial e atualizado**.

---

## ✅ COMO INSTALAR O `genie` NO WSL (Ubuntu 20.04/22.04)

### 1. **Adicione o repositório oficial do Genie**

```bash
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:arkane-systems/wsl-translinux
sudo apt update
```

> Se `add-apt-repository` não funcionar, você pode fazer manualmente com:
>
> ```bash
> sudo tee /etc/apt/sources.list.d/genie.list <<EOF
> deb http://ppa.launchpad.net/arkane-systems/wsl-translinux/ubuntu focal main
> EOF
> sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78E11C6B
> sudo apt update
> ```

### 2. **Instale o Genie**

```bash
sudo apt install -y systemd-genie
```

---

## ⚠️ CONFIGURAÇÕES NECESSÁRIAS NO WSL

Antes de reiniciar o WSL, você precisa configurar os arquivos de integração:

### Editar `wsl.conf`:

```bash
sudo nano /etc/wsl.conf
```

Adicione:

```ini
[boot]
systemd=true
```

### Reinicie o WSL:

No **PowerShell (fora do WSL)**:

```powershell
wsl --shutdown
```

Depois, reabra o Ubuntu no WSL.

---

## ✅ USO BÁSICO DO GENIE

Uma vez instalado e o WSL reiniciado:

```bash
genie -s
```

> Isso inicia um "bottle" — um shell com suporte ao `systemd`. Agora `systemctl` funcionará.

Exemplo:

```bash
sudo systemctl start mariadb
sudo systemctl status apache2
```

---

## 🔁 ALTERNATIVA: **WSL 2 com systemd nativo**

Se estiver usando **Windows 11**, WSL atualizado **já suporta `systemd` nativamente**, sem precisar do `genie`. Basta ativar isso no seu `/etc/wsl.conf`:

```ini
[boot]
systemd=true
```

E reiniciar com `wsl --shutdown`.

---

## 📌 Recomendo

Se seu objetivo for **só testar o FreePBX no WSL**, usar o `service` já resolve e evita essa complexidade.

Mas se quiser um ambiente mais próximo do Linux real com `systemd`, o `genie` é uma boa alternativa.

Deseja que eu monte um script automático para isso ou quer continuar com o MariaDB usando `service` mesmo?
