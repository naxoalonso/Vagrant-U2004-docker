Vagrant.configure("2") do |config|
# Imagen Base
  config.vm.box = "ubuntu/focal64"
# Hostname de la maquina
  config.vm.hostname = "u2004.ui1.local"
# Configuracion de Red -- Red privada con la maquina en la que ejecutamos y NAT por defecto --
  config.vm.network "private_network", ip: "192.168.0.100", hostname: true
# Selecionamos el provider de la maquina y sus asignaciones 
  config.vm.provider :virtualbox do |v|
    v.name = "u2004.ui1.local"
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
    v.memory = 4096
    v.cpus = 2
  end
# Introducir Clave publica de nuestro usuario en la MV
    id_rsa_pub = File.read("#{Dir.home}/.ssh/id_rsa.pub")
    config.vm.provision "copy ssh public key", type: "shell",
     inline: "echo \"#{id_rsa_pub}\" >> /home/vagrant/.ssh/authorized_keys"
    config.vm.provision "shell" do |s|
      s.path= "int-docker.sh"
   end
end
