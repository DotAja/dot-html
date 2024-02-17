#!/bin/bash

echo "Masukkan link ZIP dari situs web:"
read webhtml
apt update
apt upgrade -y
apt install apache2 -y
apt install certbot -y
apt install unzip -y
apt-get install certbot python3-certbot-apache -y
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
rm /var/www/html/index.html
wget -O /tmp/file.zip "$webhtml" && unzip -o /tmp/file.zip -d "/var/www/html" && rm /tmp/file.zip
wget -O /tmp/cf.sh "https://github.com/DotAja/dot-html/raw/main/cf.sh" && chmod +x /tmp/cf.sh && /tmp/cf.sh && rm /tmp/cf.sh
clear
sleep 5
====================================
echo "https://shop.dotaja.my.id"
====================================
