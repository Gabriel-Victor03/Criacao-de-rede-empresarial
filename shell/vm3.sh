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

#permissão a diretorio
sudo chmod 777 /diretorioWEB
# Executando o contêiner Apache 
sudo docker run -d --name server_web -v/diretorioWEB/web1/:/usr/local/apache2/htdocs -p 8080:80 httpd
sudo docker exec -it server_web /bin/bash
ehco ServerName localhost >> /usr/local/apache2/conf/httpd.conf

