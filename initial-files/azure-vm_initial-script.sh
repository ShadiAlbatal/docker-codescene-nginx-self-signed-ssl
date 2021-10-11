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
echo "install docker"
sudo apt install docker.io -y && sudo apt install docker-compose -y
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
echo "create codescene"
mkdir -p /home/$USER/codescene

echo "to issue a ssl-cert, provide the following data, and answer the question"
echo "email"
read email
echo "dns"
read dns

echo $email
echo $dns

certbot certonly --standalone -d $dns --email $email


filename="/home/azureuser/sda/df/gg/nginx.conf"

read -p "Enter the replace string: " replace

string="**domain_name**"

if [[ $string != "" && $replace != "" ]]; then
sed -i "s/$string/$dns/" $filename
#echo "succ"
fi
