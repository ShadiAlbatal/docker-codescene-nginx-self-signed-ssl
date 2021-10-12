#!/bin/bash -i

echo ""
#cd /home/$user
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
sudo git clone https://github.com/ShadiAlbatal/docker-codescene-nginx-self-signed-ssl.git
echo "cd  docker-codescene-nginx-self-signed-ssl"
cd docker-codescene-nginx-self-signed-ssl/
echo "checkout  using_letsencrypt_ssl"
git checkout using_letsencrypt_ssl
echo "----------------------------------------------------------"
echo "copy docker-compose to user dir"
cp initial-files/docker-compose.yml /home/$USER/docker-compose.yml /home/$USER
echo "----------------------------------------------------------"
echo "creating codescene at user dir"
mkdir -p /home/$USER/codescene
ll /home/$USER/codescene
#read email
#echo $email
echo "----------------------------------------------------------"
read -p "Enter your dns: " dns
echo "issuing your ssl-cert"
echo sudo certbot certonly --standalone -d $dns
sudo certbot certonly --standalone -d $dns
echo "----------------------------------------------------------"
echo "adding your dns to source/repos/docker-codescene-nginx-self-signed-ssl/docker-nginx/nginx.conf"
file="source/repos/docker-codescene-nginx-self-signed-ssl/docker-nginx/nginx.conf"
#sudo replace "**domain_name**" $replace -- source/repos/docker-codescene-nginx-self-signed-ssl/docker-nginx/nginx.conf
sudo replace "**domain_name**" $replace -- $file
echo "----------------------------------------------------------"
echo "review the dns if correctly added to file"
cat source/repos/docker-codescene-nginx-self-signed-ssl/docker-nginx/nginx.conf