---
title: Encontrar Endereço IP de Container Docker
description: Guia prático para descobrir e inspecionar o IP de containers Docker
category: docker
tags: [docker, networking, container, ip, troubleshooting]
---

# Como Encontrar Facilmente o Endereço IP de um Container Docker

By Home Server

Source: [https://homeserver.pt/tutoriais-linux/como-encontrar-ip-container-docker/](https://homeserver.pt/tutoriais-linux/como-encontrar-ip-container-docker/)

Quando trabalha com containers Docker, saber o endereço IP de um container específico pode ser crucial para a solução de problemas, configurações de rede ou até mesmo para conectar-se a serviços que estão a correr dentro do container. Neste guia simples, vamos mostrar-lhe como descobrir o endereço IP de um container Docker de forma rápida e eficiente com comandos fáceis de seguir.

---

#### __Por Que Pode Precisar do Endereço IP de um Docker Container?__

Existem várias razões para precisar do endereço IP de um container Docker:

*   __Conectar-se a Serviços:__ Aceder a serviços em funcionamento dentro do container a partir do seu host ou de outros containers.
*   __Configurações de Rede:__ Configurar redes ou resolver problemas relacionados com a conectividade.
*   __Depuração:__ Investigar problemas de conectividade ou monitorizar o tráfego de rede.

⚠️ __Atenção:__ Ao expor endereços IP de containers, tenha sempre em mente as questões de segurança. Certifique-se de usar as devidas medidas para proteger a sua rede e os seus dados.

---

### __Passos Simples para Encontrar o Endereço IP de um Container Docker__

Siga estes passos fáceis para encontrar rapidamente o endereço IP de um container Docker:

---

### __Passo 1: Liste os Containers Docker em Execução__

O primeiro passo é listar todos os containers em execução para encontrar o ID ou nome do container que deseja inspecionar. Utilize o seguinte comando:

Este comando irá mostrar-lhe todos os containers em funcionamento no seu sistema.

---

### __Passo 2: Inspecione o Container__

Agora, use o comando `docker inspect` seguido do ID ou nome do container para obter informações detalhadas sobre o container. Substitua `container_id` pelo ID ou nome do seu container:

Bash

```
docker inspect container_id
```

O comando irá gerar uma vasta quantidade de informações em formato JSON. O que procuramos está na secção __NetworkSettings__.

---

### __Passo 3: Extraia o Endereço IP__

Dentro da saída gerada, localize o endereço IP sob __NetworkSettings -> IPAddress__. Para facilitar, pode utilizar o comando `grep` para filtrar e encontrar o endereço IP diretamente:

Bash

```
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_id
```

Este comando vai extrair e exibir diretamente o endereço IP do container especificado, de forma clara e sem complicações.

---

### __Conclusão: Encontrar o Endereço IP de um Docker Container Nunca Foi Tão Fácil!__

Encontrar o endereço IP de um container Docker é um processo simples que pode ser realizado com apenas alguns comandos. Ao seguir este guia, conseguirá rapidamente aceder à informação necessária para se conectar e gerir os seus containers Docker de forma eficiente.

🔒 __Lembre-se sempre de lidar com endereços IP de forma segura para proteger a sua rede e os seus dados!__
