#!/bin/bash

sudo apt-get update

#instalando docker
sudo apt-get install -y docker.io
# Adiciona o usuário 'vagrant'
sudo usermod -aG docker vagrant
sudo systemctl enable docker
sudo systemctl start docker
#imagem do Apache
sudo docker pull httpd
# Executando o contêiner Apache 
sudo docker run -d --name web -p 8080:80 httpd
