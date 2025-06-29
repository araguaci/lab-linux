# Como faço para definir um endereço IP estático no Raspberry Pi? - TecnoGuia

By gurinho

Source: [https://tecnoguia.istocks.club/como-faco-para-definir-um-endereco-ip-estatico-no-raspberry-pi/2021-05-22/](https://tecnoguia.istocks.club/como-faco-para-definir-um-endereco-ip-estatico-no-raspberry-pi/2021-05-22/)

Se você estiver usando o Raspberry Pi como servidor doméstico ou frequentemente precisar acessá-lo remotamente de outro dispositivo, é uma boa ideia definir um endereço IP estático para ele. Isso significa que você poderá encontrar o Raspberry Pi no mesmo endereço todas as vezes, em vez de um novo endereço ser definido dinamicamente sempre que for reiniciado.

Isso também é útil para evitar confusão quando você tem vários dispositivos Raspberry Pi conectados à sua rede.

Felizmente, depois de saber como, configurar um endereço IP estático é um processo bastante simples e rápido.

Um endereço de protocolo de Internet (IP) é usado para identificar exclusivamente cada dispositivo em uma rede de computadores, ou a própria rede na Internet – mais sobre isso depois. O endereço IP é normalmente escrito em notação 'ponto decimal': quatro números decimais, cada um variando de 0 a 255, separados por pontos. Um exemplo é __192.168.1.107__ .

Por padrão no Raspberry Pi OS, que é um sistema operacional baseado em Linux, o endereço IP do seu Raspberry Pi é reconfigurado automaticamente cada vez que você reiniciá-lo, então ele pode mudar. Naturalmente, isso não é ideal quando você precisa de um endereço confiável para se conectar ao Raspberry Pi de outro dispositivo, como ao usá-lo como servidor.

## IP privado vs. público

Um endereço IP __público__ é usado para identificar sua rede local na Internet mais ampla. Normalmente, isso muda toda vez que o roteador se conecta à Internet, embora você possa torná-lo estático, dependendo do seu provedor de serviços de Internet.

Você pode [encontrar o endereço IP público em um sistema Linux](https://tecnoguia.istocks.club/get-public-ip-address-in-linux/) , como o Raspberry Pi OS, digitando um comando de Terminal especial ou simplesmente fazendo uma pesquisa na web por 'Qual é meu IP?'. É necessário apenas se você pretende se conectar a um dispositivo de fora de sua rede, o que não abordaremos aqui.

Em vez disso, estamos examinando os endereços IP __privados__ usados ​​para identificar cada dispositivo em sua própria rede local. Embora seja possível reservar um determinado endereço para o seu Raspberry Pi nas configurações do seu roteador sem fio para a mesma finalidade, aqui mostraremos como definir um IP estático do próprio Raspberry Pi.

## 1. Configuração DHCP

O Raspberry Pi OS (anteriormente conhecido como Raspbian) usa DHCP (Protocolo de configuração dinâmica de hosts) para atribuir um endereço IP ao Raspberry Pi automaticamente sempre que ele for reinicializado.

Para alterar esse comportamento para que use o mesmo endereço IP estático todas as vezes, você precisará modificar o arquivo de configuração do daemon do cliente DHCP, __dhcpcd.conf__ .

Antes disso, você precisará de algumas informações sobre sua configuração de rede atual para que possa adicionar os detalhes necessários ao arquivo de configuração. Você precisará das seguintes informações:

• O tipo de conexão de rede. __Pode__ ser __wlan0__ se o Raspberry Pi estiver conectado ao roteador sem fio, ou __eth0__ se estiver conectado por meio de um cabo Ethernet.

• O endereço IP atualmente atribuído ao Raspberry Pi – é mais seguro reutilizá-lo para seu IP estático, para que você possa ter certeza de que o último ainda não foi para outro dispositivo na rede. Caso contrário, certifique-se de que outro dispositivo ainda não esteja usando.

Para encontrar o endereço IP atual do Raspberry Pi, digite o seguinte comando em uma janela do Terminal:

```
 hostname -I
```

• O endereço IP do gateway do seu roteador – aquele usado para contatá-lo da rede local, não seu IP público. Isso varia dependendo do modelo do roteador, mas geralmente começa com 192.168.

Para encontrá-lo, digite o seguinte comando e observe o primeiro endereço IP fornecido:

```
 ip r | grep default
```

![](https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2021/05/raspberrypi-staticip-routerip.jpg)

• O endereço IP DNS (Domain Name System) do seu roteador. Normalmente é o mesmo que seu endereço de gateway, mas pode ser definido com outro valor para usar um DNS alternativo – como 8.8.8.8 para Google ou 1.1.1.1 para Cloudflare.

Para encontrar o endereço IP DNS atual, digite o comando:

```
 sudo nano /etc/resolv.conf
```

![](https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2021/05/raspberrypi-staticip-dnsip.jpg)

Observe o endereço IP após o __servidor de nomes__ – esse é o endereço DNS – e pressione __Ctrl + X__ para fechar o arquivo.

## 2. Adicionar configurações de IP estático

Agora que você encontrou todas as informações de conexão de rede, é hora de editar o arquivo de configuração __dhcpcd.conf__ para adicionar as configurações necessárias para definir um endereço IP estático para o Raspberry Pi:

```
 sudo nano /etc/dhcpcd.conf
```

Se você não editou o arquivo anteriormente, ele conterá principalmente várias linhas de comentário precedidas por um símbolo de hash (#). Na parte inferior, adicione as seguintes linhas, substituindo os nomes em destaque por seus próprios detalhes de rede:

```
 interface NETWORK
 static ip_address= STATIC_IP /24
 static routers= ROUTER_IP
 static domain_name_servers= DNS_IP
```

Substitua os nomes em destaque da seguinte forma:

• __REDE__ – seu tipo de conexão de rede: eth0 (Ethernet) ou wlan0 (sem fio).

• __STATIC\_IP__ – o endereço IP estático que você deseja definir para o Raspberry Pi.

• __ROUTER\_IP__ – o endereço IP do gateway para seu roteador na rede local.

• __DNS\_IP__ – o endereço IP do DNS (normalmente o mesmo que o endereço do gateway do seu roteador).

Aqui está um exemplo de configuração para definir o IP estático para 192.168.1.120 com uma conexão sem fio a um roteador em 192.168.1.254:

```
 interface wlan0
 static ip_address=192.168.1.120/24
 static routers=192.168.1.254
 static domain_name_servers=192.168.1.254
```

![](https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2021/05/raspberrypi-staticip-config.jpg)

Depois de inserir as configurações, pressione __Ctrl + X__ e, em seguida, __Y__ e __ENTER__ para fechar e salvar o arquivo de configuração modificado.

## 3. Reinicie o Raspberry Pi

Com o arquivo de configuração __dhcpcd.conf__ modificado, reinicie o Raspberry Pi para efetuar as alterações e defina o endereço IP estático para ele:

```
 sudo reboot
```

Em vez de usar um endereço atribuído automaticamente pelo DHCP, o Raspberry Pi agora tentará se conectar ao roteador usando o novo endereço IP estático que você definiu no arquivo __dhcpcd.conf__ .

Para verificar se está funcionando corretamente, digite o seguinte comando:

```
 hostname -I
```

Agora você deve ver o endereço IP estático definido no arquivo de configuração __dhcpcd.conf__ .

![](https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2021/05/raspberrypi-staticip-set.jpg)

## Defina um endereço IP estático: sucesso

Parabéns: você configurou um endereço IP estático em seu Raspberry Pi e agora ele deve reter esse endereço automaticamente sempre que inicializar. Agora você pode usar seu Raspberry Pi como NAS, mídia ou servidor de jogos e conectar-se a ele de forma confiável no mesmo endereço todas as vezes.
