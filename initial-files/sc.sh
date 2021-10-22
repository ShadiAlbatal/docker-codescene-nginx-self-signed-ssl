#!/bin/bash -i

echo ""
cd /home/$user
echo "update"
sudo apt update -y
echo "----------------------------------------------------------"
echo "upgrade"
sudo apt upgrade -y
echo "----------------------------------------------------------"
echo "get install software-properties-common"
sudo apt-get install software-properties-common
echo "----------------------------------------------------------"
echo "repository universe"
sudo add-apt-repository universe
echo "----------------------------------------------------------"
echo "install docker, docker-compose"
sudo apt install docker.io -y && sudo apt install docker-compose -y
echo "----------------------------------------------------------"
echo "install mariadb-server, mariadb-client"
sudo apt install mariadb-server -y && sudo apt install mariadb-client -y
echo "----------------------------------------------------------"
echo "sudo snap install core; sudo snap refresh core"
sudo snap install core; sudo snap refresh core
echo "----------------------------------------------------------"
echo "snap install --classic certbot"
sudo snap install --classic certbot
echo "----------------------------------------------------------"
echo "ln -s /snap/bin/certbot /usr/bin/certbot"
sudo ln -s /snap/bin/certbot /usr/bin/certbot
echo "mkdir src , enter it"
mkdir source
cd source
#pwd
echo "mkdir repos , enter it"
mkdir repos
cd repos
echo "----------------------------------------------------------"
echo "git clone"
git clone https://github.com/ShadiAlbatal/docker-codescene-nginx-self-signed-ssl.git
echo "cd  docker-codescene-nginx-self-signed-ssl"
cd docker-codescene-nginx-self-signed-ssl/
echo "checkout  using_letsencrypt_ssl"
git checkout using_letsencrypt_ssl
echo "----------------------------------------------------------"
read -p "Enter your dns: " dns
echo "issuing your ssl-cert"
echo sudo certbot certonly --standalone -d $dns
sudo certbot certonly --standalone -d $dns
echo "----------------------------------------------------------"
echo "adding your dns to source/repos/docker-codescene-nginx-self-signed-ssl/docker-nginx/nginx.conf"
pwd
cd docker-nginx
pwd
ll
cat nginx.conf
sudo replace "**domain_name**" $dns -- nginx.conf
echo "----------------------------------------------------------"
echo "review the dns if correctly added to file"
cat nginx.conf
echo "----------------------------------------------------------"
echo "going to /home/user"
cd /home/$USER
pwd
ll
echo "----------------------------------------------------------"
echo "creating codescene at user dir"
mkdir codescene
ll /home/$USER
echo "----------------------------------------------------------"
echo "copy docker-compose to user dir"
cp /home/azureuser/source/repos/docker-codescene-nginx-self-signed-ssl/initial-files/docker-compose.yml .
pwd
ll
echo "----------------------------------------------------------"