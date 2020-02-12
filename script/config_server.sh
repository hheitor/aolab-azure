!/bin/bash

# Install Docker & Ansible
sudo apt update
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y software-properties-common ansible docker docker-compose
echo -e "Default \e[34mDocker installed\e[0m"

# Create lab containers
sudo docker run --name hackazon --restart unless-stopped -d -p 8080:80 -p 8443:443 ianwijaya/hackazon
sudo docker run --name nginx01 --restart=unless-stopped -d -p 8081:80 nginx:latest
sudo docker run --name dvwa --restart unless-stopped -d -p 8082:80 vulnerables/web-dvwa
sudo docker run --name f5helloworld --restart unless-stopped -d -p 8083:8080 f5devcentral/f5-hello-world 
sudo docker run --name juice-shop --restart=unless-stopped -d -p 8084:3000 bkimminich/juice-shop
# Arcadia 
#sudo docker network create internal
#sudo docker run -dit -h mainapp --name=mainapp --net=internal --restart unless-stopped registry.gitlab.com/mattdierick/arcadia-finance/mainapp:latest
#sudo docker run -dit -h backend --name=backend --net=internal --restart unless-stopped registry.gitlab.com/mattdierick/arcadia-finance/backend:latest
#sudo docker run -dit -h app2 --name=app2 --net=internal --restart unless-stopped registry.gitlab.com/mattdierick/arcadia-finance/app2:latest
#sudo docker run -dit -h app3 --name=app3 --net=internal --restart unless-stopped registry.gitlab.com/mattdierick/arcadia-finance/app3:latest
#sudo docker run -dit -h nginx --name=nginx --net=internal --restart unless-stopped -p 80:80 -v /home/ubuntu/arcadia/default.conf:/etc/nginx/conf.d/default.conf registry.gitlab.com/mattdierick/arcadia-finance/nginx_oss:latest
echo -e "Default \e[96mContainers created\e[0m"

# Clone Lab Repos
git clone https://github.com/wurstmeister/kafka-docker
git clone https://github.com/cavalen/as3gosmarter/
