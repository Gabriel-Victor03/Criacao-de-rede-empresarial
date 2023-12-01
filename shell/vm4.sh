#!/bin/bash

sudo apt-get update

#instalando docker
sudo apt-get install -y docker.io
# Adiciona o usuário 'vagrant'
sudo usermod -aG docker vagrant
sudo systemctl enable docker
sudo systemctl start docker

#instala a imagem ftp
sudo docker pull bogem/ftp

# executando ftp
sudo docker run -d -v <host folder>:/home/vsftpd \ -p 20:20 -p 21:21 -p 47400-47470:47400-47470 \ -e FTP_USER=<username> \ -e FTP_PASS=<password> \ -e PASV_ADDRESS=<ip address of your server> \ --name ftp \ --restart=always bogem/ftp