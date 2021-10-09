#!/bin/bash


echo "CodeScene"
cd /home/$user
pwd
dir=`pwd`
$dir
echo "update"
apt update -y
echo "----------------------------------------------------------"
echo "upgrade"
apt upgrade -y
echo "----------------------------------------------------------"
echo "get install software-properties-common"
apt-get install software-properties-common
echo "----------------------------------------------------------"
echo "repository universe"
add-apt-repository universe
echo "----------------------------------------------------------"
echo "install docker"
apt install docker.io -y && apt install docker-compose -y
echo "----------------------------------------------------------"
echo "sudo snap install core; sudo snap refresh core"
snap install core; sudo snap refresh core
echo "----------------------------------------------------------"
echo "snap install --classic certbot"
snap install --classic certbot
echo "----------------------------------------------------------"
echo "ln -s /snap/bin/certbot /usr/bin/certbot"
ln -s /snap/bin/certbot /usr/bin/certbot
echo "----------------------------------------------------------"
#dir=`pwd`
#echo $dir
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
echo "copy docker-compose to user dir"
cp docker-compose-user/docker-compose.yml $dir
echo "----------------------------------------------------------"
cd $dir
echo "create codescene"
mkdir codescene
