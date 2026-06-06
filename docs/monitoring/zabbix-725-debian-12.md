---
title: Zabbix 7.2.5 Debian 12
description: Guia completo para instalação do Zabbix 7.2.5 em Debian 12
category: monitoring
tags: [zabbix, monitoring, debian, 12, observability]
---

# Instalação do Zabbix 7.2.5 no Debian 12

By Home Server

Source: [https://homeserver.pt/tutoriais-linux/instalacao-zabbix-7-2-5-debian-12/](https://homeserver.pt/tutoriais-linux/instalacao-zabbix-7-2-5-debian-12/)

Se procura uma solução de monitorização robusta e eficiente, a nova versão __Zabbix 7.2.5__ é a escolha ideal! Siga este guia passo a passo para instalar e configurar o Zabbix no __Debian 12__ sem complicações.

---

### 🔧 __Passo 1: Instalar o Repositório do Zabbix__

Antes de mais nada, adicione o repositório oficial do Zabbix ao seu sistema:

Bash

```
wget https://repo.zabbix.com/zabbix/7.2/release/debian/pool/main/z/zabbix-release/zabbix-release_latest_7.2+debian12_all.deb
dpkg -i zabbix-release_latest_7.2+debian12_all.deb
apt update
```

---

### 🔧 __Passo 2: Instalar o Servidor, Frontend e Agente do Zabbix__

Agora, instale os pacotes necessários para o funcionamento do Zabbix:

Bash

```
apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent
```

---

### 🔧 __Passo 3: Criar e Configurar a Base de Dados__

Certifique-se de que tem um servidor MySQL/MariaDB em execução. Depois, execute os seguintes comandos:

Digite a sua palavra-passe do MySQL e crie a base de dados:

Bash

```
create database zabbix character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'password';
grant all privileges on zabbix.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;
quit;
```

Agora, importe o esquema inicial para o Zabbix:

Bash

```
zcat /usr/share/zabbix/sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix
```

Por segurança, desative a opção `log_bin_trust_function_creators`:

Digite a palavra-passe e execute:

Bash

```
set global log_bin_trust_function_creators = 0;
quit;
```

---

### 🔧 __Passo 4: Configurar a Base de Dados no Servidor Zabbix__

Edite o ficheiro de configuração do servidor Zabbix:

Bash

```
nano /etc/zabbix/zabbix_server.conf
```

Adicione a palavra-passe da base de dados:

Guarde e saia (`CTRL + X`, `Y`, `Enter`).

---

### 🔧 __Passo 5: Configurar o PHP para o Frontend do Zabbix__

Edite o ficheiro de configuração do Nginx:

Bash

```
nano /etc/zabbix/nginx.conf
```

Descomente e ajuste as diretivas `listen` e `server_name`:

Bash

```
listen 8080;
server_name example.com;
```

Guarde e saia.

---

### 🔧 __Passo 6: Iniciar e Ativar os Serviços do Zabbix__

Reinicie os serviços necessários e ative-os na inicialização do sistema:

Bash

```
systemctl restart zabbix-server zabbix-agent nginx php8.2-fpm
systemctl enable zabbix-server zabbix-agent nginx php8.2-fpm
```

---

### 🔧 __Passo 7: Aceder à Interface Web do Zabbix__

Para concluir a instalação, aceda à interface web do Zabbix através do seu navegador. O URL depende das suas configurações, mas normalmente será algo como:

Bash

```
http://example.com:8080/zabbix
```

Agora, é só seguir o assistente de configuração do Zabbix! 🚀🚀🚀

---

### 🌟 __Conclusão__

O __Zabbix 7.2.5__ está agora instalado e pronto para monitorizar toda a sua infraestrutura de TI. Atualize já para obter as mais recentes funcionalidades e melhorias de desempenho!

🔗 __Quer saber mais?__ Consulte a documentação oficial do Zabbix para detalhes avançados e personalização!
