# Httptap – Monitoriza Todas as Ligações HTTP e HTTPS de Qualquer Aplicação Linux – HomeServer.pt – Informática e Tecnologia

By Home Server

Source: [https://homeserver.pt/tutoriais-linux/httptap-monitorizacao-http-https-linux/](https://homeserver.pt/tutoriais-linux/httptap-monitorizacao-http-https-linux/)

Uma ferramenta impressionante que permite monitorizar as ligações de rede de uma aplicação em Linux.

Como um administrador de sistemas atento, pode querer monitorizar o tráfego web de serviços específicos. Eis porquê:

Deteção de Telemetria: Algumas ferramentas com dados sensíveis dos utilizadores ligam-se à internet sem permissão. Bons exemplos incluem carteiras offline ou aplicações de anotações. Depuração de aplicações quando algo corre mal. Uso excessivo de tráfego: Conexões 4G ou 5G geralmente têm limites, e mantê-las sob controlo poupa na fatura. A situação complica-se em servidores devido à popularidade dos containers, sobretudo Docker ou LXC.

Como identificar o tráfego de uma aplicação neste verdadeiro dilúvio de dados?

O Httpat, da Monastic Academy, é uma solução excelente para esse efeito. Funciona sem necessidade de acesso root, sendo apenas necessário acesso de escrita a /dev/net/tun para trabalhar com o dispositivo virtual TUN utilizado na interceção do tráfego.

### Instalação do Httpat

A aplicação é escrita em Go e o binário pode ser facilmente descarregado da página de lançamentos do GitHub com os seguintes três comandos:

Bash

```
wget -c https://github.com/monasticacademy/httptap/releases/latest/download/httptap_linux_$(uname -m).tar.gz
tar xf httptap_linux_$(uname -m).tar.gz
sudo mv httptap /usr/bin && rm -rf httptap_linux_$(uname -m).tar.gz
```

Também pode ser instalado via Go:

Bash

```
go install github.com/monasticacademy/httptap@latest
```

Outra alternativa é verificar se a distribuição Linux utilizada possui o pacote httptap nos repositórios oficiais. O projeto Repology é uma excelente ferramenta para verificar quais distribuições oferecem o Httptap.

No Ubuntu 24.04 e versões superiores, é necessário desativar as seguintes restrições do AppArmor:

Bash

```
sudo sysctl -w kernel.apparmor_restrict_unprivileged_unconfined=0
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
```

### Exemplos práticos para casos comuns

Para um arranque rápido, vamos carregar o website “homeserver.pt” utilizando curl:

Bash

```
httptap -- curl -s -o /dev/null https://homeserver.pt
```

Parece ótimo! O Httpat indica que o curl utilizou 141714 bytes para um pedido GET com código 200, o que significa que está tudo certo. Utilizamos `-s -o /dev/null` para evitar qualquer saída do curl e observar apenas a ação do Httptap.

Bash

```
---> GET https://homeserver.pt/
<--- 200 https://homeserver.pt/ (141714 bytes)
```

Agora, vamos testar o site google.com, que usa redirecionamentos:

```
httptap -- python -c "import requests; requests.get('https://google.com')"
```

Bash

```
---> GET https://google.com/
<--- 301 https://google.com/ (220 bytes)
decodificando conteúdo gzip
---> GET https://www.google.com/
<--- 200 https://www.google.com/ (20721 bytes)
```

Funciona perfeitamente e notifica sobre redirecionamentos 301 e conteúdo arquivado. Excelente!

Vamos imaginar que temos algumas instâncias na Google Cloud, geridas pela ferramenta CLI `gcloud`. Que endpoints HTTP são utilizados por este comando? Vamos ver:

Bash

```
httptap -- gcloud compute instances list
```

Bash

```
---> POST https://oauth2.googleapis.com/token
<--- 200 https://oauth2.googleapis.com/token (997 bytes)
---> GET https://compute.googleapis.com/compute/v1/projects/maple-public-website/aggregated/instances?alt=json&includeAllScopes=True&maxResults=500&returnPartialSuccess=True
<--- 200 https://compute.googleapis.com/compute/v1/projects/maple-public-website/aggregated/instances?alt=json&includeAllScopes=True&maxResults=500&returnPartialSuccess=True (19921 bytes)
```

A resposta é clara: `compute.googleapis.com`.

Agora, suponhamos que utilizamos o Dropbox e a ferramenta `rclone` para gerir os ficheiros na cloud. Qual é o endpoint API utilizado pelo Dropbox?

Bash

```
httptap -- rclone lsf dropbox:
```

Bash

```
decodificando conteúdo gzip
---> POST https://api.dropboxapi.com/2/files/list_folder
<--- 200 https://api.dropboxapi.com/2/files/list_folder (2119 bytes)
```

A resposta é direta: `api.dropboxapi.com`.

### HAR – Trabalhar de Forma Mais Confortável

Para facilitar a análise de pedidos e respostas HTTP, o Httptap suporta o formato HAR:

Bash

```
httptap --dump-har out.har -- curl -Lso /dev/null https://homeserver.pt
```

Existem várias aplicações para visualizar ficheiros HAR. O Google HAR Analyzer é uma ótima opção.

### Funcionalidades Avançadas

O Httptap oferece opções adicionais muito úteis:

*   `--no-new-user-namespace` – Executa como root sem utilizar namespaces de utilizador.
*   `--subnet` e `--gateway` – Define a sub-rede e gateway visível para o subprocesso.
*   `--dump-tcp` – Captura todos os pacotes TCP.
*   `--http` – Lista de portas TCP para interceção de tráfego HTTPS (padrão: 80).
*   `--https` – Lista de portas TCP para interceção de tráfego HTTP (padrão: 443).

O Httptap isola o processo numa namespace de rede e monta um sistema de ficheiros sobreposto em `/etc/resolv.conf` para garantir que o DNS correto é utilizado. Além disso, injeta uma Autoridade Certificadora para permitir a descodificação de tráfego HTTPS, utilizando um dispositivo TUN, de forma semelhante ao OpenVPN.

### Modificação de Pedidos e Respostas

Atualmente, não há uma interface ou opção de linha de comando para modificar o tráfego diretamente, mas isso pode ser feito com uma simples modificação no código-fonte. São necessárias competências básicas em programação Go.

### Conclusão

Se procura uma ferramenta poderosa para monitorizar ligações HTTP e HTTPS, o Httptap é a solução ideal! E para quem quer explorar mais, eis algumas ferramentas complementares:

*   __Wireshark__ – Essencial para quem deseja visualizar o tráfego nas interfaces de rede.
*   __OpenSnitch__ – Um firewall interativo inspirado no Little Snitch do macOS.
*   __Douane__ – Firewall pessoal que protege a privacidade do utilizador, permitindo o controlo das ligações de cada aplicação.
*   __AdNauseam__ – Ferramenta que clica automaticamente em anúncios para confundir os sistemas de rastreamento.

Espero que desfrute do Httptap tanto quanto eu! 😄
