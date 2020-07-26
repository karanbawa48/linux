#!/bin/bash
apt-get update -y
apt-get install -y apache2
apt install -y php libapache2-mod-php php-mysql

apt install -y php-curl php-gd php-xml php-mbstring  php-xmlrpc php-zip php-soap php-intl
sed 's/index.html/index.php/' /etc/apache2/mods-enabled/dir.conf

rm /var/www/html/index.html 

apt-get install -y mysql-server-5.7

echo '*******************************************************************************************'

mysql -uroot  -e "create USER 'autouser'@'localhost' IDENTIFIED BY '12345678';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON * . * TO 'autouser'@'localhost';"
mysql -uroot -e "FLUSH PRIVILEGES;"

echo '**************************************************************************************************'

systemctl restart apache2

curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz

echo '************************************************************************************************'

mv wordpress/* /var/www/html/
chown -R www-data:www-data /var/www/html



echo 'yo yo (╬ﾟ◥益◤ﾟ)'

