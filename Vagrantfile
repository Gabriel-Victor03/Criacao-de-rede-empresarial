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
      dhcp.vm.hostname = "dhcp"
      # vm1.vm.network "forwarded_port", guest: 80, host: 8080
      dhcp.vm.network "private_network", ip:"192.168.56.10"
      dhcp.vm.provider "virtualbox" do |vb|  # Provedor de virtualização
        vb.memory = "512"  # Quantidade de memória RAM
        vb.cpus = 1  # Número de CPUs
      end

      dhcp.vm.provision "shell", path: "shell/vm1.sh" # Arquivo shell a ser lido e executado
  end

  config.vm.define "vm2" do |dns|
      dns.vm.box = "ubuntu/focal64"  # Box (imagem base) a ser usada
      dns.vm.hostname = "dns"
      dns.vm.network "private_network", type:"dhcp"
      dns.vm.provider "virtualbox" do |vb|  # Provedor de virtualização
        vb.memory = "512"  # Quantidade de memória RAM
        vb.cpus = 1  # Número de CPUs
      end

      vm2.vm.provision "shell", path: "shell/vm2.sh" # Arquivo shell a ser lido e executado
  end

  config.vm.define "vm3" do |web|
      web.vm.box = "ubuntu/focal64"
      web.vm.hostname = "web"
      web.vm.network "private_network", type: "dhcp"
      web.vm.network "forwarded_port", guest: 80, host: 8080

      web.vm.provision "shell", inline: <<-SHELL
  end

end