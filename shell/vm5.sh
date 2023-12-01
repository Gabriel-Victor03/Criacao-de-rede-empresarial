#!/bin/bash

sudo apt-get update

#instalando docker
sudo apt-get install -y docker.io
# Adiciona o usuário 'vagrant'
sudo usermod -aG docker vagrant
sudo systemctl enable docker
sudo systemctl start docker

# remove container
sudo docker stop nfs-server || true
sudo docker rm nfs-server || true

#instalando imagem
sudo docker pull itsthenetwork/nfs-server-alpine
#executando imagem
sudo docker run -id --name nfs-server --privileged -v /path/to/vagrant/project/nfs-share:/export -e SHARED_DIRECTORY=/export -p 2049:2049/tcp -p 2049:2049/udp itsthenetwork/nfs-server-alpine /bin/sh

