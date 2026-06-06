───────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ ncdu \ duff \ ripgrep \ mosh \ lshw \ mtr \ fd-find \ fzf \ ranger \ zoxide \ eza \ glances \
   2   │ iotop \ coreutils \ pcp \ procps \ progress \ dnsutils \ tcpdump \ wireshark-common \ tshark \
   3   │ termshark \ lsof \ ipcalc \ magic-wormhole \ systemd \ rsync \ moreutils \ unp \ jq \ taskwarrior \
   4   │ asciinema \ fabric
───────┴──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

````Debian
install_tools_debian.sh
````

````Ubuntu
install_tools_ubuntu.sh
````

---

### 🔍 **Gerenciamento de Arquivos e Disco**

* **`ncdu`**: Visualizador de uso de disco em modo texto (mais interativo que `du`).
* **`duff`**: Encontra arquivos duplicados rapidamente.
* **`fd-find`** (`fd`): Substituto moderno e mais rápido do `find`.
* **`ranger`**: Gerenciador de arquivos em modo texto, com visual estilo árvore.
* **`eza`** (`exa`): Substituto moderno do `ls` com mais informações e melhor visual.
* **`unp`**: Descompacta automaticamente arquivos `.zip`, `.tar`, `.rar`, etc., sem precisar lembrar a ferramenta certa.

---

### 🧠 **Busca e Filtros**

* **`ripgrep`** (`rg`): Busca por texto em arquivos (muito mais rápido que `grep` tradicional).
* **`fzf`**: Fuzzy Finder – busca interativa por nomes de arquivos, comandos, histórico, etc.
* **`jq`**: Processa e manipula JSON no terminal (como `sed/awk`, mas para JSON).

---

### 📡 **Rede**

* **`mosh`**: SSH melhorado com reconexão automática e suporte a alta latência.
* **`mtr`**: Ferramenta de diagnóstico de rede combinando `traceroute` e `ping`.
* **`tcpdump`**: Captura pacotes de rede via linha de comando.
* **`wireshark-common`**: Componentes comuns para Wireshark (analisador gráfico de rede).
* **`tshark`**: Versão em linha de comando do Wireshark.
* **`termshark`**: Interface TUI para `tshark`, tipo um Wireshark no terminal.
* **`dnsutils`**: Inclui ferramentas como `dig` para consultas DNS.
* **`ipcalc`**: Calcula sub-redes e endereços IP (útil para redes).
* **`magic-wormhole`**: Transfere arquivos e mensagens entre computadores de forma segura e fácil (peer-to-peer, criptografado).

---

### 🔎 **Monitoramento e Diagnóstico**

* **`lshw`**: Lista detalhes de hardware da máquina.
* **`glances`**: Monitor de sistema em tempo real (CPU, RAM, rede, disco).
* **`iotop`**: Mostra uso de I/O por processo (leitura/escrita em disco).
* **`pcp`**: Performance Co-Pilot – coleta e analisa métricas de desempenho.
* **`procps`**: Conjunto de ferramentas como `top`, `ps`, `vmstat` (para gerenciamento de processos).
* **`progress`**: Exibe progresso de comandos como `cp`, `mv`, `dd`, etc.
* **`lsof`**: Lista arquivos abertos por processos.
* **`systemd`**: Sistema de inicialização e gerenciamento de serviços no Linux (base de várias distros modernas).

---

### 🔧 **Utilitários Essenciais**

* **`coreutils`**: Conjunto de ferramentas básicas como `ls`, `cat`, `mv`, `rm`, etc.
* **`moreutils`**: Complementa `coreutils` com comandos como `sponge`, `vidir`, `ts`, etc.
* **`rsync`**: Sincroniza arquivos local ou remotamente (muito eficiente e usado para backups).
* **`taskwarrior`**: Gerenciador de tarefas no terminal (tipo GTD, altamente configurável).
* **`asciinema`**: Grava sessões do terminal como texto, ideal para tutoriais e demonstrações.
* **`fabric`**: Ferramenta Python para automatizar deploys e comandos remotos via SSH (muito usada por devops e sysadmins).

---
