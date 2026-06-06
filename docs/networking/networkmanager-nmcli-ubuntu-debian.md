---
title: NetworkManager NMCLI Ubuntu Debian
description: Instalação e uso do NetworkManager (NMCLI) em Ubuntu e Debian
category: networking
tags: [networkmanager, nmcli, ubuntu, debian, networking]
---

# Instale e use o NetworkManager (NMCLI) no Ubuntu/Debian

Source: [https://pt.linux-console.net/?p=22372](https://pt.linux-console.net/?p=22372)

---

Para administradores de sistema, sua rotina diária gira em torno de configuração (provisionamento), manutenção, solução de problemas, monitoramento, segurança e gerenciamento de servidores em data centers. Este guia responde à questão que surge sobre como gerenciar ou administrar interfaces de rede Ubuntu/Debian usando algumas ferramentas padrão.__ Network Manager__ é uma ferramenta projetada para gerenciar redes em uma máquina. Possui muitas ferramentas que são usadas para gerenciar configurações de rede em quase todas as distribuições Linux. Esta ferramenta é a ferramenta de gerenciamento de rede padrão em sistemas Ubuntu. Ele fornece as seguintes ferramentas de gerenciamento de rede:

1.  __Nmtui__ – esta ferramenta é executada em uma janela de terminal Linux. É uma ferramenta de gerenciamento de rede baseada em texto onde alterações podem ser feitas em uma rede inserindo dados e seleções de menu. Ele é usado para executar tarefas básicas de gerenciamento de rede e possui muitos recursos ausentes que estão disponíveis no NMCLI.
2.  __Configuração do Gnome__ – na área de trabalho do Gnome é possível gerenciar a rede usando um aplicativo de rede do Gnome. Ele fornece gerenciamento básico de rede e é fácil de realizar configurações.
3.  __nm-connection-editor__ – esta é uma ferramenta de gerenciamento de rede baseada em gráficos que permite acessar as opções de configuração do NetworkManager
4.  __NMCLI__ - normalmente referido como__ Network Command-Line Interface __é uma ferramenta de rede usada para gerenciar o NetworkManager e também mostrar o status de uma conexão de rede. É útil quando não é possível acessar o ambiente gráfico ou executar uma edição de servidor e fazer alterações na configuração da rede

O Network Manager é preferido devido aos seguintes recursos:

*   Visualização de rede flexível
*   Gerenciamento de rede abrangente
*   Recursos integrados de análise de causa raiz
*   Conteúdo totalmente personalizável
*   Recursos integrados de pesquisa de dispositivos e interfaces
*   Solução de problemas de rede com um único clique
*   Amplos recursos de relatórios
*   Múltiplas opções de integração
*   Descoberta de rede cada vez maior

Ao final deste guia, você deverá ser capaz de instalar e usar o NetworkManager __NMCLI__ no sistema Ubuntu/Debian.

## Pré-requisitos

Para este guia, certifique-se de que seu sistema Ubuntu | Debian esteja atualizado e atualizado conforme abaixo.

```
sudo apt-get update && sudo apt-get upgrade
```

## Passo 1 – Instale o NetworkManager no sistema Ubuntu | Debian

Por padrão, o NetworkManager existe em sistemas Ubuntu|Debian, mas caso você precise instalá-lo, demonstrarei duas maneiras de instalar o NetworkManager em seu sistema Ubuntu|Debian.

1.  Usando APT
2.  Usando Snap

### 1a) Instale o NetworkManager no sistema Ubuntu | Debian usando APT

O NetworkManager está disponível nos repositórios APT padrão dos sistemas Ubuntu | Debian e pode ser instalado conforme abaixo.

```
sudo apt-get install network-manager
```

Inicie e ative o Network Manager conforme abaixo.

```
sudo systemctl start NetworkManager.service 
sudo systemctl enable NetworkManager.service
```

### 1b) Instale o NetworkManager no sistema Ubuntu | Debian usando Snap.

O NetworkManager também está disponível na loja Snap e pode ser instalado no sistema Ubuntu|Debian com o __snap__ instalado e habilitado conforme abaixo.

```
sudo apt install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
```

Em seguida, instale o NetworkManager usando o comando:

```
snap install network-manager
```

Após esta instalação, todos os plugues e slots necessários serão conectados automaticamente. Verifique conforme abaixo.

```
snap connections network-manager
```

Saída de amostra:

```
Interface              Plug                                   Slot                     Notes
dbus                   network-manager:wpa                    -                        -
firewall-control       network-manager:firewall-control       :firewall-control        -
hardware-observe       network-manager:hardware-observe       :hardware-observe        -
login-session-observe  network-manager:login-session-observe  :login-session-observe   -
modem-manager          network-manager:modem-manager          :modem-manager           -
network                network-manager:network                :network                 -
network-manager        -                                      network-manager:service  -
network-manager        network-manager:nmcli                  -                        -
network-observe        network-manager:network-observe        :network-observe         -
network-setup-control  network-manager:network-setup-control  :network-setup-control   -
network-setup-observe  network-manager:network-setup-observe  :network-setup-observe   -
ppp                    network-manager:ppp                    :ppp                     -
```

Assim que a instalação for concluída, o Network Manager será automaticamente iniciado e executado em segundo plano, verifique seu status usando o comando:

```
$ sudo systemctl status NetworkManager.service
● NetworkManager.service - Network Manager
     Loaded: loaded (/lib/systemd/system/NetworkManager.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2021-09-28 14:50:00 EAT; 1min ago
       Docs: man:NetworkManager(8)
   Main PID: 423 (NetworkManager)
      Tasks: 3 (limit: 2404)
     Memory: 13.6M
        CPU: 303ms
     CGroup: /system.slice/NetworkManager.service
             └─423 /usr/sbin/NetworkManager --no-daemon

Sep 28 14:50:16 debian NetworkManager[423]: <info>  [1632829816.7357] manager: NetworkManager state is now CONNECTED_LOCAL
Sep 28 14:50:16 debian NetworkManager[423]: <info>  [1632829816.7434] manager: NetworkManager state is now CONNECTED_SITE
Sep 28 14:50:16 debian NetworkManager[423]: <info>  [1632829816.7468] policy: set 'Wired connection 1' (enp0s3) as default for IPv4 routing and DNS
```

## Passo 2 – Use NetworkManager NMCLI no sistema Ubuntu|Debian.

NMCLI é uma ferramenta utilitária de rede que nos permitirá gerenciar configurações de rede. Existem alguns comandos que podem ser usados para gerenciar uma rede.

### Modificar conexões de rede

Usar o NMCLI para modificar conexões de rede exige que comecemos listando as conexões de rede, use o comando:

```
nmcli connection show
```

Saída de amostra:

```
AME                UUID                                  TYPE      DEVICE 
Wired connection 1  ac98eab7-1ad3-4cf0-93a0-210bfe3bb7e2  ethernet  enp0s3 
```

### Exibir uma conexão ativa

O comando acima mostra todas as conexões, mas se você quiser ver as conexões ativas ou ativas você adicionará o sinalizador `--active `ao comando acima;

```
nmcli connection show --active
```

Saída de amostra:

```
NAME                UUID                                  TYPE      DEVICE 
Wired connection 1  ac98eab7-1ad3-4cf0-93a0-210bfe3bb7e2  ethernet  enp0s3
```

Com o nome do perfil de conexão, você pode visualizar informações adicionais conforme abaixo.

```
nmcli connection show "Wired connection 1"
```

Saída de amostra:

![](https://pt.linux-console.net/common-images/install-and-use-networkmanager-nmcli-on-ubuntu-debian/Install-and-Use-NetworkManager-NMCLI-on-UbuntuDebian-System-6.png)

### Adicionar e modificar conexões de rede usando NMCLI

__Adicionar uma conexão de rede usando NMCLI__

Usando NMCLI, pode-se adicionar novas conexões a um sistema Ubuntu|Debian usando a sintaxe abaixo.

```
sudo nmcli connection add type <network-type> ifname <connection-name>
```

__Modifique uma conexão de rede existente usando NMCLI__

Com o NMCLI, é possível fazer ajustes e configurações em uma conexão de rede existente, como alternar entre configurações estáticas e DHCP usando a sintaxe abaixo.

```
sudo nmcli connection modify <connection-id> <parameter> <value>
```

Agora vamos ver as configurações que podemos __adicionar__ e__modificar__ uma conexão usando NMCLI. Começaremos adicionando um perfil de conexão NetworkManager para nossa conexão. Para mim, é a conexão Ethernet e adicionarei um perfil de conexão com o nome __My-New-Connection__

```
nmcli connection add con-name My-New-Connection ifname enp0s3 type ethernet
```

Exemplo de saída:

```
Connection 'My-New-Connection' (a6b26540-4c06-4a80-a0fa-a2868e4006e5) successfully added.
```

Com o perfil de conexão adicionado, faremos os ajustes abaixo. Lembre-se de definir seu próprio endereço IP, gateway, servidor DNS, etc., usando uma sintaxe semelhante à que forneci.

Para definir o início automático da conexão de rede, use:

```
nmcli connection modify My-New-Connection connection.autoconnect yes
```

1\. Defina um endereço IPv4 estático com uma máscara de sub-rede /24

Por exemplo, modificaremos a conexão existente para um IP\_Address estático e também alteraremos a sub-rede __/24 __sem esta especificação, atribuiremos um IP com a máscara padrão que poderá causar problemas posteriormente.

```
sudo nmcli connection modify My-New-Connection ipv4.address 192.168.100.157/24
```

__2__. __Defina um endereço IPv6 estático com uma máscara de sub-rede /64__

```
nmcli connection modify My-New-Connection ipv6.addresses 2001:db8:1::1/64
```

3\. Defina um gateway padrão IPv4/IPv6

```
##For IPv4
nmcli connection modify My-New-Connection ipv4.gateway 192.168.100.1
##For IPv6
nmcli connection modify My-New-Connection ipv6.gateway 2001:db8:1::fffe
```

__4__. __Definir um servidor DNS IPv4/IPv6__

```
##For IPv4
nmcli connection modify My-New-Connection ipv4.dns "192.168.100.200"
##For IPv6
nmcli connection modify My-New-Connection ipv6.dns "2001:db8:1::ffbb"
```

5\. Defina o método de conexão IPv4 e IPv6 como automático

```
##For IPv4
nmcli connection modify My-New-Connection ipv4.method auto
##For IPv6
nmcli connection modify My-New-Connection ipv6.method auto
```

Para que as alterações feitas tenham efeito, você precisa ativar o perfil.

```
$ nmcli connection up My-New-Connection
connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/2)
```

Agora verifique as conexões ativas.

```
nmcli connection show --active
```

![](https://pt.linux-console.net/common-images/install-and-use-networkmanager-nmcli-on-ubuntu-debian/Install-and-Use-NetworkManager-NMCLI-on-UbuntuDebian-System-2.png)

Verifique o conjunto IP\_Address.

```
hostname -I
192.168.100.120 192.168.100.157 
```

A partir da saída, tenho dois endereços IP, um IP primário e o __IP__ __secundário__ adicionado pelo novo perfil de conexão My-New-Connection. Você pode verificar as informações adicionais usando o comando `ip a `conforme abaixo.

![](https://pt.linux-console.net/common-images/install-and-use-networkmanager-nmcli-on-ubuntu-debian/Install-and-Use-NetworkManager-NMCLI-on-UbuntuDebian-System-1.png)

### Gerenciar dispositivos usando NMCLI

A ferramenta utilitária NMCLI também pode ser usada para gerenciar dispositivos como:

__Exibindo o status do dispositivo__

```
sudo nmcli -p dev status
```

Saída de amostra:

![](https://pt.linux-console.net/common-images/install-and-use-networkmanager-nmcli-on-ubuntu-debian/Install-and-Use-NetworkManager-NMCLI-on-UbuntuDebian-System-1-1.png)

__Modificar uma configuração de dispositivo__

Antes de poder modificar a configuração de um dispositivo, primeiro você precisará obter as informações do dispositivo.

```
sudo nmcli device show
```

Saída de amostra:

![](https://pt.linux-console.net/common-images/install-and-use-networkmanager-nmcli-on-ubuntu-debian/Install-and-Use-NetworkManager-NMCLI-on-UbuntuDebian-System-4.png)

Com as informações do dispositivo, você pode modificar uma configuração do dispositivo usando a sintaxe abaixo.

```
$ sudo nmcli device modify <interface-name> <parameter> <value>
###OR
$ sudo nmcli dev mod <interface-name> <parameter> <value>
```

Lembre-se de que as alterações acima são temporárias e podem ser redefinidas para as configurações padrão usando o comando:

```
sudo nmcli dev reapply interface-name
```

Caso você não consiga usar o gerenciador de dispositivos NMCLI, encontre ajuda usando o comando:

```
sudo nmcli device help
```

![](https://pt.linux-console.net/common-images/install-and-use-networkmanager-nmcli-on-ubuntu-debian/Install-and-Use-NetworkManager-NMCLI-on-UbuntuDebian-System-5.png)

## Conclusão.

É isso! Vimos como instalar e usar o NetworkManager NMCLI no sistema Ubuntu/Debian. Espero que este guia tenha sido significativo para você. Presumo que agora você possa gerenciar sua conexão de rede e dispositivos de rede usando o NetworkManager NMCLI.

Ver mais:

*   Como criar rede interna no Xen | XCP-ng
*   Adicionar endereço IP secundário à interface de rede CentOS/RHEL
*   Configure o servidor DNS escravo BIND no Debian
