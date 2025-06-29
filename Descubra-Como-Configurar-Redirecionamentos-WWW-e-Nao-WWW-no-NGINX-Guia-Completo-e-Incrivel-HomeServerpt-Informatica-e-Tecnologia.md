# Descubra Como Configurar Redirecionamentos WWW e Não-WWW no NGINX (Guia Completo e Incrível) – HomeServer.pt – Informática e Tecnologia

By Home Server

Source: [https://homeserver.pt/tutoriais-linux/como-redirecionar-www-ou-nao-www-nginx/](https://homeserver.pt/tutoriais-linux/como-redirecionar-www-ou-nao-www-nginx/)

Se ainda não está a redirecionar o tráfego entre as versões __WWW__ e __não-WWW__ do seu site, está a perder uma oportunidade crucial para __melhorar a experiência do utilizador__, impulsionar o __SEO__ e garantir um site mais profissional e organizado. Felizmente, o __NGINX__, um dos servidores web mais poderosos e versáteis do mercado, oferece uma solução prática e eficiente para implementar estas mudanças de forma rápida e sem complicações.

Prepare-se para mergulhar num guia detalhado e atualizado que vai transformar a gestão do seu site! Descubra como configurar redirecionamentos que unificam a presença online da sua marca, evitando problemas como conteúdos duplicados e inconsistências de URL que podem prejudicar o seu desempenho nos motores de busca.

---

### __Por Que São Essenciais os Redirecionamentos de URL no NGINX?__

Antes de avançarmos para as configurações práticas, é essencial compreender os fundamentos dos __redirecionamentos de URL__ no NGINX. Ao dominar estas noções, poderá gerir o seu site de forma eficaz, garantir uma experiência otimizada para o utilizador e melhorar significativamente a __autoridade do seu domínio__.

#### __Tipos de Redirecionamentos de URL e Quando Utilizá-los__

1.  __301 Redirects – Redirecionamentos Permanentes__

    *   __Objetivo__: Informar os motores de busca e os utilizadores que um URL mudou permanentemente.
    *   __Impacto no SEO__: Transfere a autoridade do URL antigo para o novo, mantendo a credibilidade nos rankings.
    *   __Exemplo de Utilização__: Quando muda o domínio ou reestrutura o site.

2.  __302 Redirects – Redirecionamentos Temporários__

    *   __Objetivo__: Indicar que a mudança é temporária, ideal para manutenção ou alterações pontuais.
    *   __Impacto no SEO__: Preserva o URL original nos motores de busca, já que a alteração não é definitiva.

3.  __303 Redirects – Evitar Submissões Duplicadas em Formulários__

    *   __Objetivo__: Melhorar a experiência do utilizador ao evitar envios duplicados de dados em formulários.
    *   __Benefício__: Elimina erros e potencia a navegação mais fluida.

---

### __Como Configurar Redirecionamentos no NGINX?__

Agora que compreende os benefícios, é hora de aprender __passo a passo como configurar redirecionamentos__ no NGINX para garantir que todo o tráfego seja direcionado de forma consistente para a versão desejada do seu site.

#### __Redirecionar Não-WWW para WWW com Server Blocks__

Uma das formas mais eficazes de gerir redirecionamentos é através de __server blocks__. Veja como pode fazer isso:

```
server {
    listen 80;
    server_name exemplo.com;
    return 301 $scheme://www.exemplo.com$request_uri;
}

server {
    listen 80;
    server_name www.exemplo.com;
    # Alojar o conteúdo do site aqui
}
```

Este código redireciona todas as solicitações de `exemplo.com` para `www.exemplo.com`, garantindo que o __protocolo__ e o __caminho__ original sejam preservados.

#### __Redirecionar WWW para Não-WWW com Server Blocks__

Se preferir que o seu site seja acedido sem “www”, também é fácil configurar o NGINX para isso:

```
server {
    listen 80;
    server_name www.exemplo.com;
    return 301 $scheme://exemplo.com$request_uri;
}

server {
    listen 80;
    server_name exemplo.com;
    # Alojar o conteúdo do site aqui
}
```

#### __Usar Regras de Rewrite para Redirecionamentos Personalizados__

As __regras de rewrite__ são extremamente úteis para situações onde precise de maior controlo sobre os redirecionamentos:

```
server {
    listen 80;
    server_name www.exemplo.com;
    rewrite ^(.*)$ $scheme://exemplo.com$1 permanent;
}
```

Esta configuração assegura que qualquer URL começado por “www” seja automaticamente redirecionado para a versão sem “www”, mantendo o caminho e marcando o redirecionamento como permanente.

---

### __A Importância de Monitorizar e Ajustar as Configurações__

Implementar redirecionamentos é apenas o primeiro passo. É crucial monitorizar regularmente o comportamento do servidor para garantir que tudo está a funcionar corretamente. Não só isso melhora a __experiência do utilizador__, como evita penalizações dos motores de busca por erros de configuração.

---

__Conclusão__

Configurar redirecionamentos de __não-WWW para WWW__ (ou vice-versa) no __NGINX__ é uma etapa essencial para criar um site coeso, otimizado e preparado para competir nos motores de busca. Este guia prático fornece todas as ferramentas de que precisa para implementar esta funcionalidade como um verdadeiro profissional.

__Não perca tempo!__ Adote já estas práticas e transforme o seu site numa máquina de SEO e conversão. 🚀
