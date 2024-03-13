#!/bin/bash

# Replace * with the public ip address.  If you are testing locally you can use local ips such as 172.*.*.* or 192.*.*.*
ip_server="*"

# Get required dependencies
apt-get update;
apt-get install -y vim curl gnupg gpg php apache2 mysql-server php-mysql php-mbstring php-curl php-pdo php-gd zip;

# Enable apache web server
a2enmod status;
a2enmod rewrite;
systemctl restart apache2;

# Download and unpackage wordpress source files 
curl https://en-ca.wordpress.org/latest-en_CA.tar.gz -o wp.tar.gz;
mv wp.tar.gz /var/www/ && cd /var/www/ && tar xvfz wp.tar.gz;

# Create directory for website
mkdir -p /var/www/web1;
cp -r wordpress/* /var/www/web1/;
chown -R www-data:www-data /var/www/web1;

# Create databases and mysql user for wordpress instance.
mysql -e "CREATE DATABASE web1;"
mysql -e "CREATE USER 'web1'@'localhost' IDENTIFIED BY 'web1-ABCD-pass';";
mysql -e "GRANT ALL PRIVILEGES ON web1.* TO 'web1'@'localhost';";

# Configure apache with virtualhost file
echo "<VirtualHost $ip_server:80>
  ServerName web1.evermight.net
  DocumentRoot /var/www/web1
</VirtualHost>" > /etc/apache2/sites-available/web1.conf

# Enable website
a2ensite web1.conf;
systemctl reload apache2;


## Repeat for second website

# Create directory for website
mkdir -p /var/www/web2;
cp -r wordpress/* /var/www/web2/;
chown -R www-data:www-data /var/www/web2;

# Create databases and mysql user for wordpress instance.
mysql -e "CREATE DATABASE web2;"
mysql -e "CREATE USER 'web2'@'localhost' IDENTIFIED BY 'web2-ABCD-pass';";
mysql -e "GRANT ALL PRIVILEGES ON web2.* TO 'web2'@'localhost';";

# Configure apache with virtualhost file
echo "<VirtualHost $ip_server:80>
    ServerName web2.evermight.net
    DocumentRoot /var/www/web2
</VirtualHost>" > /etc/apache2/sites-available/web2.conf

# Enable website
a2ensite web2.conf;
systemctl reload apache2;

## Repeat for third website

# Create directory for website
mkdir -p /var/www/web3;
cp -r wordpress/* /var/www/web3/;
chown -R www-data:www-data /var/www/web3;

# Create databases and mysql user for wordpress instance.
mysql -e "CREATE DATABASE web3;"
mysql -e "CREATE USER 'web3'@'localhost' IDENTIFIED BY 'web3-ABCD-pass';";
mysql -e "GRANT ALL PRIVILEGES ON web3.* TO 'web3'@'localhost';";

# Configure apache with virtualhost file
echo "<VirtualHost $ip_server:80>
  ServerName web3.evermight.net
  DocumentRoot /var/www/web3
</VirtualHost>" > /etc/apache2/sites-available/web3.conf

# Enable website
a2ensite web3.conf;
systemctl reload apache2;

