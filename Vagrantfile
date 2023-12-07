# Vagrant.configure("2") do |config|

#   config.vm.define "vm1" do |vm1|
#     vm1.vm.box = "ubuntu/focal64"  # Box (imagem base) a ser usada
#     vm1.vm.hostname = "servidor-web"
#     vm1.vm.network "private_network", type: "dhcp"
#     vm1.vm.provider "virtualbox" do |vb|  # Provedor de virtualização
#       vb.memory = "1024"  # Quantidade de memória RAM
#       vb.cpus = 1  # Número de CPUs
#     vm1.vm.provision "shell", path: "shell/vm1.sh" # Arquivo shell a ser lido e executado
#     end
#   end

  
#   config.vm.define "vm2" do |vm2|
#     vm2.vm.box = "ubuntu/focal64"  
#     vm2.vm.hostname = "banco-mysql"
#     vm2.vm.network "private_network", type: "dhcp"
#     vm2.vm.provider "virtualbox" do |vb| 
#       vb.memory = "1024"  
#       vb.cpus = 1  
#     vm2.vm.provision "shell", path: "shell/vm2.sh" 
#     end
#   end



#   config.vm.define "vm4" do |vm4|
#     vm4.vm.box = "ubuntu/focal64"
#     vm4.vm.hostname = "servidor-ftp"
#     vm4.vm.network "private_network", type: "dhcp"
#     vm4.vm.provider "virtualbox" do |vb|
#       vb.memory = "512"
#       vb.cpus = "1"
#     end
#     vm4.vm.provision "shell", path: "shell/vm4.sh"
#   end


#   config.vm.defin "vm5" do |vm5|
#     vm5.vm.box = "ubuntu/focal64"
#     vm5.vm.hostname = "servidor-nfs"
#     vm5.vm.network "private_network", type: "dhcp"
#     vm5.vm.provider "virtualbox" do |vb|
#       vb.memory = "512"
#       vb.cpus = "1"
#     end
#     vm5.vm.provision "shell", path:"shell/vm5.sh"
#   end


# end

Vagrant.configure("2") do |config|
  config.vm.define "vm1" do |dhcp|
      dhcp.vm.box = "ubuntu/focal64"  # Box (imagem base) a ser usada
      dhcp.vm.hostname = "servidorDhcp"
      dhcp.vm.network "forwarded_port", guest: 80, host: 8080, auto_config:false
      dhcp.vm.network "private_network", ip:"192.168.56.11"
      dhcp.vm.synced_folder "./diretorio_synced", "/diretorioDHCP"

      dhcp.vm.provision "shell", path: "shell/vm1.sh" # Arquivo shell a ser lido e executado
  end

  config.vm.define "vm2" do |dns|
      dns.vm.box = "ubuntu/focal64"  # Box (imagem base) a ser usada
      dns.vm.hostname = "servidorDns"
      dns.vm.network "forwarded_port", guest: 89, host: 8089, auto_config:false
      dns.vm.network "private_network", type:"dhcp", ip:"192.168.56.12"
      dns.vm.synced_folder "./diretorio_synced", "/diretorioDNS"

      dns.vm.provision "shell", path: "shell/vm2.sh" # Arquivo shell a ser lido e executado
  end

  config.vm.define "vm3" do |web|
    web.vm.box = "ubuntu/focal64"
    web.vm.hostname = "servidorWeb"
    web.vm.network "private_network", type: "dhcp", ip:"192.168.56.13"
    web.vm.network "forwarded_port", guest: 80, host: 8085, auto_config: false
    web.vm.synced_folder "./diretorio_synced", "/diretorioWEB"
    web.vm.provider "virtualbox" do |vb|  # Provedor de virtualização
      vb.memory = "512"  # Quantidade de memória RAM
      vb.cpus = 1  # Número de CPUs
    end
    web.vm.provision "shell", path: "shell/vm3.sh"
  end

  config.vm.define "vm4" do |ftp|
    ftp.vm.box = "ubuntu/focal64"
    ftp.vm.hostname = "servidorFtp"
    ftp.vm.network "forwarded_port", guest: 87, host: 8087, auto_config:false
    ftp.vm.network "private_network", type:"dhcp", ip:"192.168.56.14"
    ftp.vm.synced_folder "./diretorio_synced", "/diretorioFTP"
    ftp.vm.provision "shell", path: "shell/vm4.sh"
  end

  config.vm.define "vm5" do |nfs|
    nfs.vm.box = "ubuntu/focal64"
    nfs.vm.hostname = "servidorNfs"
    nfs.vm.network "private_network", type:"dhcp", ip:"192.168.56.15"
    nfs.vm.network "forwarded_port", guest: 3032, host: 3032
    nfs.vm.synced_folder "./diretorio_synced", "/diretorioNFS"
    nfs.vm.provision "shell", path: "shell/vm5.sh"
  end
end