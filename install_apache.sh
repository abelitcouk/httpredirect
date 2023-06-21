#!/bin/bash
apt-get -y update

apt-get -y install apache2

echo "Hello World" > /var/www/html/index.html

cat <<eof >>/etc/apache2/apache2.conf
# Added 21/06/2023 for test
<IfModule mod_rewrite.c>
RewriteEngine On
Redirect /hebrew.html http://www.abel-it.co.uk/hebrew/index.html
</IfModule>
eof

a2enmod rewrite
systemctl restart apache2
