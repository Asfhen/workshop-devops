#!/bin/bash
echo "Atualizando Sistema"
sudo apt-get update
echo "Instalando Dependencias do Sistema"
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
echo "Pegando chave GPG do docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Atualizando o Sistema com as novas chaves"
sudo apt-get update
echo "Instalando o Docker Engine"
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo "Baixando projeto do Docker-Compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Criando Link Virtual"
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "Adicionando Grupo Sudo do docker"
sudo groupadd docker
sudo usermod -aG docker $USER