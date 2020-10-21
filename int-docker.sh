# Eliminar version docker
echo "Eliminando Docker instalado"
sudo apt-get remove docker docker-engine docker.io

# Requisitos Previos
echo "\n Instalacion de requisitos "
sudo apt-get update
sudo apt-get install \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common -y

# Introducir clave GPG Docker
echo "\n Introducir clave GPG Docker"
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg -o docker-ce.gpgkey
sudo apt-key add docker-ce.gpgkey

# Introducir repositorio Docker
echo "\n Introducir repositorio Docker"
sudo echo "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" >> /etc/apt/sources.list

# Actualizacion de repositorios e intalacion de Docker
echo "\n Actualizacion de repositorios e intalacion de Docker"
sudo apt-get update
sudo apt-get install docker-ce -y

# Instalar Docker-Compose
echo "\n Instalar Docker-Compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Comprobar versiones Docker
echo "\n Comprobar versiones Docker"
sudo docker -v
sudo docker-compose --version

