#!/bin/bash

sudo apt-get update
#Instalando docker e configurando user
sudo apt-get install -y docker.io
sudo usermod -aG docker vagrant
# sudo systemctl restart docker
sudo systemctl enable docker
sudo systemctl start docker
#encerrando qlqr dhcp existente
sudo docker stop dhcp
sudo docker rm dhcp
#baixa imagem dhcpd
sudo docker pull networkboot/dhcpd

#copia o arquivo pro tmp
sudo cp /vagrant/dhcpd.config /tmp/dhcpd.config
#cria container


sudo docker run --detach --volume /usr/local/docker/dhcpd:/data --network host --name dhcpd --restart unless-stopped networkboot/dhcpd
