#!/bin/bash

sudo apt-get update

#instalando docker
sudo apt-get install -y docker.io
# Adiciona o usuário 'vagrant'
sudo usermod -aG docker vagrant
sudo systemctl enable docker
sudo systemctl start docker

#baixando imagem
sudo docker pull ubuntu/bind9
#executando imagem
sudo docker run -d --name bind9-container -e TZ=UTC -p 30053:53 ubuntu/bind9:9.18-22.04_beta