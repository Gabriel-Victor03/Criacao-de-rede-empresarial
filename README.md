# Criacao-de-rede-empresarial
## 📰 Proposta
Esse repositório trata de documentar a projeção, criação, implantação e gerenciamento de uma rede empresarial com **tecnologia Linux**, contendo serivços como **DHCP, DNS, Web, FTP, NFS**
Para cada serviço, será criado uma máquina virtual.
## Documentação
### Implementação
- Utiliza o Vagrant para documentar e criar as máquinas virtuais via Virtual Box.
- Utiliza o Docker para implantar os containers com os serviços pré-configurados.

### Topologia da rede
A topologia escolhida para esta rede foi a `em malha`, no qual todas máquinas virtuais estarão conectadas por meio de muitas interconexões e assim permitindo que todos os serviços das vms estejam interligados.

<img src="topologia.png" alt="Topologia de rede" width="30%" text-align= "center">

### Segmentação de sub-redes
  - Sub-rede para DHCP
  - Sub-rede para DNS
  - Sub-rede para Apache
  - Sub-rede para FTP
  - Sub-rede para NFS

### Requisitos dos serviços
## 📎 Pré requisitos para sistema operacional Linux
* Instalar o [Virtual Box](https://virtualbox.org/) (Opte pela [versão 6.1](https://www.virtualbox.org/wiki/Download_Old_Builds_6_1) ou mais antiga) 
  
* Instalar o [Vagrant](https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant)
    
## 🔑 Criação e acesso as máquinas
1) Faça o clone do repositório do github para sua máquina.
   - Use o seguinte comando no diretório escolhido: `git clone https://github.com/Gabriel-Victor03/Criacao-de-rede-empresarial.git`
2) Acesse o repositório clonado
3) Dê o comando `vagrant up` para executar o arquivo Vagrantfile e subir as máquinas virtuais
4) Após encerrado o processo de criação das máquinas virtuais, acesse as máquinas individualmente usando o comando `vagrant ssh <nome_da_máquina>` 
   - Nesse caso,para identificar cada máquina, use `vm1`, `vm2`,`vm3`,`vm4` e `vm5`
> Lembrando que é possível acessar todas as máquinas ao mesmo tempo, para isso, abra uma nova aba do termninal no local do respositório e dê o comando de acesso.
    
## 📶 Teste Extensivos
#### Para testar se os serviços de cada servidor esteja funcionando, siga os passos abaixo:

### Servidor DHCP
1) Acesse uma máquina virtual que não seja a do serviço DHCP `vagrant ssh vm2`
2) Verifique sua interface de rede `ip link`
3) Solicite um novo endereõ IP para o DHCP `sudo dhclient -v enp2s0`

### Servidor DNS
1) Acesse a máquina virtual pelo comando `vagrant ssh vm2`
2) Execute o comando de teste `sudo docker logs bind9-container`

### Serivdor Apache
1) Acesse a máquina virtual pelo comando `vagrant ssh vm3`
2) Abra o navegador no IP va vm3 juntamente com a porta do container, no caso: [http://192.168.56.8:8080/](http://192.168.56.8:8080/) 

### Servidor FTP
1) Acesse a máquina virtual pelo comando `vagrant ssh vm4`
2) Execute o comando de teste `ftp <IP da Máquina>`.
3) Informe o usuário e senha

### Servidor NFS
1) Acesse a máquina virtual pelo comando `vagrant ssh vm5`
2) Execute o comando de teste `sudo docker logs nfs-server`
