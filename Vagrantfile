Vagrant.configure("2") do |config|
    config.vm.box = "hashicorp/bionic64"
    config.vm.box_version = "1.0.282"
    config.vm.boot_timeout = 3600
  
    config.vm.define :web do |web_config|
      web_config.vm.network :private_network, :ip => "192.168.33.12"
      web_config.vm.provision "shell", path: "docker-install.sh"
      web_config.vm.provision "file", source: "./docker-compose.yaml", destination: "$HOME/workshop-devops"
    end
end