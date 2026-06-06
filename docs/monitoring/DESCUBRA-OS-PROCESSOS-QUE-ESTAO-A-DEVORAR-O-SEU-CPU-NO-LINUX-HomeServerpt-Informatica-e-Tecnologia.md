# DESCUBRA OS PROCESSOS QUE ESTÃO A DEVORAR O SEU CPU NO LINUX! – HomeServer.pt – Informática e Tecnologia

By Home Server

Source: [https://homeserver.pt/tutoriais-linux/identificar-processos-alto-uso-cpu-linux/](https://homeserver.pt/tutoriais-linux/identificar-processos-alto-uso-cpu-linux/)

Se o seu sistema Linux está lento e com desempenho abaixo do esperado, a culpa pode ser de processos que estão a consumir recursos excessivos! Felizmente, existe uma forma rápida e eficaz de identificar os 10 processos que mais estão a drenar a CPU do seu computador. Neste guia explosivo, mostramos-lhe como monitorizar e controlar os processos para maximizar a performance do seu sistema!

---

### __Método Infalível para Listar os 10 Processos que Mais Usam CPU no Linux!__

Com apenas um comando simples, é possível obter uma lista detalhada dos processos que mais estão a sobrecarregar o seu CPU! O comando __ps__, presente na maioria das distribuições Linux, permite-lhe visualizar informações detalhadas sobre os processos ativos no sistema.

Abra um terminal e execute o seguinte comando:

Bash

```
ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head
```

__Resultado?__ Irá obter uma listagem ordenada com os 10 processos que estão a consumir mais CPU, ajudando-o a agir rapidamente para otimizar o desempenho do seu Linux!

---

### __Exemplo de Saída do Comando ps__

Para que veja como funciona na prática, aqui está um exemplo de saída gerado pelo comando __ps__:

Bash

```
PID    CMD                   %MEM  %CPU
1234   firefox               5.2   87.5
5678   chrome                6.8   76.3
9101   systemd               2.1   65.2
...
```

Este comando é extremamente útil para identificar quais os processos que estão a causar lentidão no seu sistema e tomar medidas rápidas para resolvê-lo!

---

### __Método Alternativo: O Poderoso Comando top!__

Se procura uma abordagem interativa para monitorizar os processos em tempo real, então o comando __top__ é a escolha certa! Siga estes passos:

1.  __Abra um terminal__
2.  __Digite__ o comando `top` e pressione __Enter__
3.  Para ordenar os processos por consumo de CPU, pressione __Shift + P__

Com este método, pode acompanhar dinamicamente o uso de CPU e detetar picos de consumo em tempo real!

---

### __Conclusão: Controle Total do Seu Linux!__

Agora já sabe exatamente como identificar os processos que mais estão a consumir CPU no seu sistema Linux! Com os comandos __ps__ e __top__, consegue monitorizar e otimizar a performance do seu computador, evitando lentidões inesperadas e garantindo um funcionamento mais eficiente.

__Aplique estas técnicas hoje mesmo e recupere o controlo do seu Linux!__
