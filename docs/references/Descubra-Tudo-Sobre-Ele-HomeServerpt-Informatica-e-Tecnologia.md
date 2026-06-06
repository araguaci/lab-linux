# Descubra Tudo Sobre Ele! – HomeServer.pt – Informática e Tecnologia

By Home Server

Source: [https://homeserver.pt/tutoriais-linux/o-poderoso-comando-whereis-descubra-tudo-sobre-ele/](https://homeserver.pt/tutoriais-linux/o-poderoso-comando-whereis-descubra-tudo-sobre-ele/)

Se é um verdadeiro apaixonado por Linux ou um profissional da área, precisa conhecer o comando __whereis__! Este comando é uma ferramenta essencial que permite localizar rapidamente arquivos binários, código-fonte e páginas de manual associadas a qualquer comando do sistema.

Ao contrário de comandos como __find__, que percorrem todo o sistema de ficheiros, o __whereis__ foca-se apenas em diretórios pré-definidos, tornando-o incrivelmente rápido e eficiente! Ideal para administradores de sistemas e programadores que querem obter informações sem necessidade de privilégios de root.

---

## Como Utilizar o Comando Whereis Como um Especialista

Dominar a sintaxe de qualquer comando é essencial para aproveitá-lo ao máximo. Aqui está a estrutura do __whereis__:

```
whereis [OPÇÕES] NOME_DO_FICHEIRO...
```

*   __OPÇÕES__: Flags que ajustam o comportamento da pesquisa.
*   __NOME\_DO\_FICHEIRO__: Nome do comando ou ficheiro que deseja localizar.

Agora, vejamos as opções disponíveis e como podem ser usadas para otimizar sua pesquisa!

| Flag   | Descrição                                                                              |
| ------ | -------------------------------------------------------------------------------------- |
| __-b__ | Localiza apenas ficheiros binários (executáveis).                                      |
| __-s__ | Pesquisa apenas por ficheiros de código-fonte.                                         |
| __-m__ | Encontra apenas páginas de manual.                                                     |
| __-u__ | Identifica ficheiros incompletos (faltando binário, fonte ou manual).                  |
| __-B__ | Especifica diretórios personalizados para busca de binários (obrigatório usar com -f). |
| __-S__ | Define diretórios específicos para procura de código-fonte (usar com -f).              |
| __-M__ | Define diretórios para pesquisa de manuais (usar com -f).                              |
| __-f__ | Finaliza a lista de diretórios personalizados e inicia a busca pelos ficheiros.        |
| __-l__ | Mostra os diretórios padrão onde a pesquisa ocorre.                                    |

Agora, vamos ver alguns exemplos práticos que vão transformar a maneira como utiliza o __whereis__!

---

## 1. Localizar Todos os Ficheiros Relacionados a um Comando

Quer saber onde estão __todos__ os ficheiros associados a um comando? Basta executar:

Por exemplo, para encontrar todos os ficheiros ligados ao __bash__:

__Resultado:__

Bash

```
/usr/bin/bash       # Caminho para o ficheiro binário
/usr/share/man/man1/bash.1.gz  # Caminho para a página de manual
```

---

## 2. Encontrar Apenas os Ficheiros Binários (Executáveis)

Se pretende localizar __apenas__ o ficheiro binário (executável), utilize a opção __-b__:

Exemplo para o comando __ls__:

---

## 3. Localizar Apenas Páginas de Manual

Para encontrar a localização da documentação de um comando, utilize a opção __-m__:

Exemplo com __grep__:

__Resultado:__

Bash

```
/usr/share/man/man1/grep.1.gz  # Página de manual acessível com "man grep"
/usr/share/info/grep.info.gz  # Informação extra acessível com "info grep"
```

---

## 4. Procurar Apenas por Ficheiros de Código-Fonte

Se quiser encontrar os ficheiros de código-fonte associados a um comando, utilize __-s__:

Por exemplo, para procurar os ficheiros de código-fonte do __gcc__:

Se o sistema não tiver pacotes instalados a partir do código-fonte, o resultado será vazio.

---

## 5. Definir Diretórios Personalizados para Pesquisa

Caso precise procurar um comando num diretório específico, utilize __-B__, __-S__ ou __-M__.

Exemplo para procurar o comando __cp__ apenas dentro da pasta __/bin__:

Bash

```
whereis -b -B /bin -f cp
```

Explicação:

*   __-b__ → Pesquisa apenas ficheiros binários.
*   __-B /bin__ → Define o diretório __/bin__ como único local de busca.
*   __-f cp__ → Define “cp” como o comando a ser localizado.

---

## 6. Identificar Comandos com Ficheiros Incompletos

Se deseja verificar quais comandos estão sem alguns dos ficheiros essenciais (binário, fonte ou manual), utilize a opção __-u__:

Bash

```
cd /bin
whereis -u -m *
```

Este comando identifica comandos que estão no diretório __/bin__ e que não possuem páginas de manual disponíveis.

---

## Conclusão

Com este guia completo e otimizado, agora já sabe como utilizar o comando __whereis__ para localizar qualquer ficheiro de maneira rápida e eficiente! Seja um verdadeiro especialista Linux e domine essa ferramenta essencial.

💬 __Dúvidas ou sugestões? Deixe o seu comentário e participe na discussão!__
