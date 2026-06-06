# Estrutura do Projeto Lab Linux

## 📋 Visão Geral

O projeto foi reorganizado em uma estrutura modular e temática para melhor manutenção e navegação:

```
lab-linux/
├── docs/                      # Documentação organizada por tema
├── configs/                   # Arquivos de configuração
├── scripts/                   # Scripts de automação
├── README.md                  # Índice principal
├── STRUCTURE.md               # Este arquivo
└── .git/                      # Histórico Git
```

---

## 📚 `/docs/` - Documentação

Cada subpasta contém documentação relacionada a um tópico específico:

### `overview/`
- **Propósito:** Documentação geral do projeto
- **Conteúdo:** README principal, índice geral, páginas de boas-vindas
- **Exemplos:** `README.md`, `index.md`

### `linux/`
- **Propósito:** Documentação sobre Linux e administração de sistemas
- **Conteúdo:** Comandos essenciais, instalação de ferramentas, setup inicial
- **Exemplos:** `debian-commands.md`, `ubuntu-commands.md`, `install_tools.md`

### `docker/`
- **Propósito:** Tudo sobre Docker e containerização
- **Conteúdo:** Comandos Docker, export/import, integração com WSL, networking
- **Exemplos:** `docker-commands.md`, `docker2wsl.md`

### `wsl/`
- **Propósito:** Windows Subsystem for Linux
- **Conteúdo:** Instalação de distros, GUI no WSL, systemd, customização
- **Exemplos:** `Import-Rocky-Linux-to-WSL-or-WSL2.md`, `The-complete-WSL2-GUI-setup.md`

### `raspberry-pi/`
- **Propósito:** Documentação específica para Raspberry Pi
- **Conteúdo:** IP estático, acesso remoto, desktop, imagem do sistema
- **Exemplos:** `Install-the-Raspberry-PI-Imager.md`, `Install-the-XFCE-desktop.md`

### `networking/`
- **Propósito:** Configuração de rede e infraestrutura
- **Conteúdo:** Nginx, NetworkManager, repositórios, servidores, Proxmox
- **Exemplos:** `Descubra-Como-Configurar-Redirecionamentos-WWW-no-NGINX.md`

### `monitoring/`
- **Propósito:** Ferramentas de monitoramento e diagnóstico
- **Conteúdo:** Análise de CPU, tráfego HTTP, observabilidade, Zabbix
- **Exemplos:** `Instalacao-do-Zabbix-725-no-Debian-12.md`

### `voip/`
- **Propósito:** Sistemas de telefonia IP e PBX
- **Conteúdo:** Asterisk, FreePBX, Issabel, aplicações de VoIP
- **Exemplos:** `INSTALACION-DE-ISSABEL-EN-DEBIAN-12-CON-ASTERISK-20.md`

### `security/`
- **Propósito:** Segurança e permissões no Linux
- **Conteúdo:** Configuração de sudo, privilégios, controle de acesso
- **Exemplos:** `Como-Configurar-Corretamente-os-Privilegios-de-Sudo.md`

### `references/`
- **Propósito:** Referências externas e links importantes
- **Conteúdo:** Links, repositórios, documentação externa
- **Exemplos:** `packages.microsoft.com.md`, `ftphalifaxRWTH-AachenDE.md`

---

## ⚙️ `/configs/` - Configurações

Arquivos de configuração do projeto:

- **`_config.yml`** - Configuração do Jekyll (tema, plugins, coleções)
- **`starship.toml`** - Configuração do prompt Starship
- **`starship-ChrisTitusTech.toml`** - Variante do tema Starship

---

## 🔧 `/scripts/` - Scripts

Scripts de automação e utilitários:

### Bash Scripts (`.sh`)
- `initial_linux_setup.sh` - Setup inicial de Linux
- `docker_installation.sh` - Instalação do Docker
- `docker_cleanup.sh` - Limpeza de Docker
- `install_*.sh` - Instalação de ferramentas
- `disk_usage.sh` - Análise de uso de disco

### PowerShell Scripts (`.ps1`)
- `install-ubuntu-wsl.ps1` - Instalação de Ubuntu no WSL
- `freepbx15-asterisk17-wsl-cmd-debian10-buster.ps1` - Setup de PBX

---

## 🎯 Como Adicionar Nova Documentação

1. **Identifique a categoria** que melhor se encaixa
2. **Crie/edite o arquivo `.md`** dentro da pasta apropriada
3. **Use nomes descritivos** em lowercase com hífens:
   - ✅ `como-configurar-docker.md`
   - ❌ `como_configurar_docker.md`
   - ❌ `ComoConfigurarDocker.md`
4. **Adicione front-matter Jekyll:**
   ```yaml
   ---
   title: Seu Título
   description: Breve descrição
   category: docker
   tags: [tag1, tag2]
   ---
   ```

---

## 🔗 Navegação entre Documentos

Use caminhos relativos para linkar documentos:

```markdown
[Veja Docker](../docker/docker-commands.md)
[Voltar ao Overview](../overview/README.md)
```

---

## 📊 Jekyll & Deploy

- **Configuração:** `configs/_config.yml`
- **Build local:** `jekyll build`
- **Servidor local:** `jekyll serve`
- **Deploy:** GitHub Pages (automático)

---

## 📝 Nomenclatura de Arquivos

Padrão recomendado:

```
categoria/nome-do-arquivo-descritivo.md
```

Exemplos bons:
- `docker/docker-volumes-advanced.md`
- `linux/systemd-service-creation.md`
- `wsl/gui-setup-x11.md`
- `networking/nginx-reverse-proxy.md`

Evitar:
- ❌ `doc1.md`
- ❌ `article_20240606.md`
- ❌ `CamelCaseName.md`

---

## 🚀 Próximos Passos

1. Melhorar nomes de arquivos (remover espaços, normalizar)
2. Adicionar índice interativo em cada categoria
3. Implementar CI/CD com validação de links
4. Melhorar SEO com front-matter estruturado
5. Criar sidebar de navegação no tema Jekyll

---

**Última atualização:** Junho 2026
