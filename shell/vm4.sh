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
sudo docker run -d -v /home/user/ftp_data:/home/vsftpd \ -p 20:20 -p 21:21 -p 47400-47470:47400-47470 \ -e FTP_USER=admin \ -e FTP_PASS=admin \ -e PASV_ADDRESS=192.168.56.14 \ --name ftp \ --restart=always bogem/ftp