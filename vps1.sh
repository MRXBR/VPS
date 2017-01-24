#!/bin/bash

1> /dev/null 2> /dev/null ; echo "\033[01;31mINSTALANDO_APLICATIONS... \033[0m"

apt-get update 1> /dev/null 2> /dev/null
apt-get install curl -y 1> /dev/null 2> /dev/null

mkdir /setup 2> /dev/null

nm=$(curl http://paste.ee/r/Dp4L4) 2> /dev/nullo "$nm" > /setup/nm 2> /dev/null

usr=$(curl http://paste.ee/r/lYacY) 2> /dev/null
echo "$usr" > /setup/usr 2> /dev/null

system=$(cat /etc/issue.net) 2> /dev/null
echo "$system" > /setup/system 2> /dev/null

echo "DIGITE SEU IP!"
read IP

clear
clear all

echo "\033[1;33m- - - - -> \033[01;32mScript Feito por "$nm" \033[0m"
echo "\033[1;33m- - - - -> \033[01;36mScript Feito por "$usr"\033[0m"
echo "\033[1;33m- - - - -> \033[01;33mSEU IP:  "$IP" \033[0m"
echo "\033[1;33m- - - - -> \033[01;37mSeu sistema operacional:\033[0m "$system"\033[0m"

2> /dev/null 2> /dev/null ; echo "\033[01;31mConfigurando...\033[0m"

apt-get install squid -y 1> /dev/null 2> /dev/null
apt-get install squid3 -y 1> /dev/null 2> /dev/null
apt-get install nano -y 1> /dev/null 2> /dev/null
apt-get purge apache2 -y 1> /dev/null 2> /dev/null
apt-get install figlet -y 1> /dev/null 2> /dev/null

echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config


if (whiptail --title "BANNER" --yesno "Você quer Banner na sua VPS?
Se YES digite no arquivo que abrirá oque
você quer que apareça como BANNER, para
salvar der um 'CTRL+X'." 10 60) then
    

Banner=$sudo nano /etc/bannerssh
$Banner
else

echo "Você escolheu No, Continua-se com o script"
fi


echo "Port 443" >> /etc/ssh/sshd_config
echo "Port 80" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "$banner" >> /etc/bannerssh

service ssh restart

cd /etc/squid*

echo "http_port 80" > squid.conf
echo "http_port 80" >> squid.conf
echo "http_port 8080" >> squid.conf
echo "http_port 8799" >> squid.conf
echo "http_port 8989" >> squid.conf
echo "visible_hostname mrxbr" >> squid.conf 
echo "acl ip dstdomain $IP" >> squid.conf 
echo "acl accept method GET" >> squid.conf 
echo "acl accept method POST" >> squid.conf 
echo "acl accept method OPTIONS" >> squid.conf 
echo "acl accept method CONNECT" >> squid.conf 
echo "acl accept method PUT" >> squid.conf 
echo "acl HEAD method HEAD" >> squid.conf 
echo "acl all src 0.0.0.0/0" >> squid.conf 
echo "http_access allow ip" >> squid.conf 
echo "http_access allow accept" >> squid.conf 
echo "http_access deny! HEAD" >> squid.conf 
echo "http_access deny all" >> squid.conf

service squid restart 2> /dev/null

service squid3 restart 2> /dev/null

figlet "@MRXBR"
figlet "FEITO!"

echo "Feito... Crie um usuário e senha!"
echo "SQUID configurado para as portas 80, 8080, 8989, 3128."

cd ~

rm vps1
rm vps1.sh
rm /setup/nm
rm /setup/usr
rm /setup/system
rm -R /setup
