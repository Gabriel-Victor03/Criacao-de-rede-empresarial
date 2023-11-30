#!/bin/bash

sudo apt-get update
#Instalando docker e configurando user
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo usermod -aG docker vagrant
sudo systemctl restart docker
#encerrando qlqr dhcp existente
sudo docker stop dhcp
sudo docker rm dhcp
#baixa imagem dhcpd
docker pull networkboot/dhcpd

#copia o arquivo pro tmp
sudo cp /vagrant/dhcpd.config /tmp/dhcpd.config
#cria container
sudo docker run -d --name dhcp --network host -v /tmp:/data networkboot/dhcpd
