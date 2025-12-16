# Trabalho de Redes

### Sumário

1. [Integrantes do Grupo](#integrantes-do-grupo)
2. [Passo a Passo](#passo-a-passo)
3. [Andamento](#andamento)
4. [Comandos Adicionais](#comandos-adicionais)
5. [Imagens](#imagens)

---

### Integrantes do Grupo

* **Grupo 1:** Andrisa dos Santos, Matheus Faccin e Pedro Henrique

> **Nota:** Todas as instruções a seguir devem ser executadas no terminal do Linux.
>
> **Ferramentas:** SSH, Linux, Windows, Apache 2, Sub-interface, Proxy (SQUID e IP TABLES)

---

## Passo a passo

### 1. Planejar as redes

* Definir a topologia da rede, incluindo dispositivos e conexões
* **LAN:** 192.168.0.0/30
* **WAN:** 200.10.0.0/29

---

### 2. Instalar o SSH no Linux

* Atualizar e instalar cliente SSH:

  ```bash
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install openssh-client
  ```
* Criar usuário:

  ```bash
  sudo adduser username
  ```
* Adicionar usuário ao grupo sudo:

  ```bash
  sudo usermod -aG sudo username
  ```
* Entrar como superusuário:

  ```bash
  sudo su
  ```
* Logar como usuário criado:

  ```bash
  sudo su username
  ```

---

### 3. Instalar o Apache 2 no Linux

* Atualizar e instalar Apache:

  ```bash
  sudo apt update
  sudo apt install apache2
  ```
* Iniciar o serviço:

  ```bash
  sudo systemctl start apache2
  ```
* Criar página web:

  ```bash
  sudo nano /var/www/html/pedrila.html
  ```
* Conteúdo do arquivo `pedrila.html`:

  ```html
  <!DOCTYPE html>
  <html lang="pt-br">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Trabalho de Redes</title>
  </head>
  <body>
      <h1>Teste para o trabalho de redes</h1>
      <p>Esta página foi desenvolvida por: Andrisa, Matheus e Pedro.</p>
      <p>Foi utilizado o Kali Linux.</p>
  </body>
  </html>
  ```
* Salvar e sair do editor nano:

  * Pressione `Ctrl + X`
  * Pressione `Y` e depois `Enter`
* Ajustar permissões:

  ```bash
  sudo chown -R www-data:www-data /var/www/html/
  sudo chmod -R 755 /var/www/html/
  ```
* (Opcional) Habilitar no firewall:

  ```bash
  sudo ufw allow 'Apache'
  ```
* Acessar página:
  `http://200.10.0.1/pedrila.html`

---

### 4. Criar Sub-interfaces no Linux

* Instalar net-tools:

  ```bash
  sudo apt install net-tools
  ```
* Visualizar interfaces de rede:

  ```bash
  sudo ifconfig
  ```
* Criar sub-interface:

  ```bash
  sudo ip addr add 200.10.0.1/29 dev eth0
  ```

---

### 5. Habilitar comunicação de interfaces

* Ativar encaminhamento de IP:

  ```bash
  sudo sysctl -w net.ipv4.ip_forward=1
  ```
* Mascarar o tráfego:

  ```bash
  sudo iptables -t nat -A POSTROUTING -s 200.10.0.0/29 -o eth0 -j MASQUERADE
  ```

---

### 6. Configurar Ethernet no Windows

* Configurar IPv4:

  * IP: `200.10.0.2/29`
  * Gateway: `200.10.0.1`

---

### 7. Configurar e usar IP TABLES no Linux

* Instalar pacotes:

  ```bash
  sudo apt install iptables
  sudo apt install iptables-persistent
  sudo systemctl enable netfilter-persistent
  ```
* Criar rota (exemplo):

  ```bash
  sudo ip route
  sudo route add -net 0.0.0.0 netmask 0.0.0.0 GW IP
  ```

---

### 8. Bloquear sites com Proxy usando SQUID

* Instalar squid:

  ```bash
  sudo apt-get install squid
  ```
* Verificar status:

  ```bash
  sudo service squid status
  ```
* Navegar para diretório de configuração:

  ```bash
  cd /etc/squid
  ```
* Fazer backup do arquivo de configuração:

  ```bash
  sudo cp squid.conf squid.conf.backup
  ```
* Apagar arquivo antigo e criar novo:

  ```bash
  sudo rm squid.conf
  sudo nano squid.conf
  ```
* Criar arquivos para sites e palavras proibidas:

  ```bash
  sudo touch /etc/squid/sites_proibidos.txt
  sudo touch /etc/squid/palavras_proibidas.txt
  ```
* Editar arquivos:

  ```bash
  sudo nano /etc/squid/sites_proibidos.txt
  sudo nano /etc/squid/palavras_proibidas.txt
  ```
* Exemplo de configuração no `squid.conf`:

  ```
  http_port 3128

  acl sites_proibidos url_regex -i "/etc/squid/sites_proibidos.txt"
  http_access deny sites_proibidos

  deny_info http://172.25.2.214/grupo2 sites_proibidos
  ```
* Reiniciar o squid após alterações:

  ```bash
  sudo systemctl stop squid
  sudo systemctl start squid
  ```

---

### 9. Configurar Proxy no Windows 11

* Abrir configurações > Rede e Internet > Proxy
* Desmarcar **Detectar configurações automaticamente**
* Em **Configurações de proxy manual**, clicar em **Editar** e ativar
* Configurar:

  * Endereço: IP da máquina Linux
  * Porta: 3128

---

### 10. Habilitar comunicação com servidor geral

* Criar sub-interface no servidor do grupo:

  ```bash
  sudo ip addr add 192.168.0.1/30 dev eth0
  ```
* Criar sub-interface no servidor geral:

  ```bash
  sudo ip addr add 192.168.0.2/30 dev enp0s31f6
  ```
* Criar proxy transparente (nftables):

  ```bash
  sudo nft add rule ip nat prerouting iif "enp0s31f6" tcp dport 80 redirect to :3128
  ```

---

## Comandos adicionais para nftables e rotas

1. Criar tabela e chains NAT no nftables:

   ```bash
   sudo nft add table ip nat
   sudo nft add chain ip nat prerouting { type nat hook prerouting priority 0 \; }
   sudo nft add chain ip nat postrouting { type nat hook postrouting priority 100 \; }
   ```
2. Adicionar regras:

   ```bash
   sudo nft add rule ip nat prerouting iif "enp0s31f6" tcp dport 80 redirect to :3128
   sudo nft add rule ip nat postrouting oif "enp0s31f6" masquerade
   ```
3. Mostrar regras ativas:

   ```bash
   sudo nft list ruleset
   ```
4. Salvar e ativar nftables:

   ```bash
   sudo sh -c 'nft list ruleset > /etc/nftables.conf'
   sudo systemctl enable nftables
   sudo systemctl start nftables
   ```
5. Configurar gateway do Linux local:

   ```bash
   sudo ip route add default via 192.168.0.2 dev eth0
   sudo ip route del default via 10.104.16.1 dev eth0
   ```
6. Criar rota para 200.10.0.0:

   ```bash
   sudo ip route 200.10.0.0/30 via 192.168.0.1
   ```

---

## Andamento

| Nome          | Concluído | Para que serve                               |
| ------------- | :-------: | -------------------------------------------- |
| LINUX         |     ✅     | Ambiente para execução das tarefas           |
| SSH           |     ✅     | Acesso remoto e seguro ao servidor           |
| APACHE 2      |     ✅     | Servidor web para hospedar páginas           |
| SUB-INTERFACE |     ✅     | Segmentação de rede para diferentes serviços |
| ROTAS         |     ✅     | Direcionamento de tráfego na rede            |
| PROXY         |     ✅     | Intermediário para requisições externas      |
| SQUID         |     ✅     | Servidor proxy para controle de acesso       |
| IP TABLES     |     ✅     | Gerenciamento de regras de firewall          |


## Imagens

<p align="center">
  <img src="imagens/foto1.jpg" width="900">
  <br>
  <em>Figura 1: Mostrando que a máquina está com o IP escolhido pelo grupo.</em>
</p>

<p align="center">
  <img src="imagens/foto2.jpg" width="900">
  <br>
  <em>Figura 2: Teste funcionando a internet.</em>
</p>

<p align="center">
  <img src="imagens/foto3.jpg" width="900">
  <br>
  <em>Figura 3: Pesquisando sites de aposta no Google.</em>
</p>

<p align="center">
  <img src="imagens/foto4.jpg" width="900">
  <br>
  <em>Figura 4: Acessando a bet digitando o link manualmente.</em>
</p>

<p align="center">
  <img src="imagens/foto5.jpg" width="900">
  <br>
  <em>Figura 5: Acessando o link que nosso grupo criou e inseriu no Squid.</em>
</p>



