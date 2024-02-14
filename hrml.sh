#!/bin/bash
apt update
apt upgrade -y
apt install apache2 -y
apt install certbot -y
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
wget "https://github.com/DotAja/dot-html/raw/main/htmlku.zip" -O /tmp/file.zip
unzip -o /tmp/file.zip -d "/var/www/html"
rm /tmp/file.zip
wget -O /tmp/cf.sh "https://github.com/DotAja/dot-html/raw/main/cf.sh"
chmod +x /tmp/cf.sh
/tmp/cf.sh
rm /tmp/cf.sh
