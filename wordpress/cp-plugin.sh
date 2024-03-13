#!/bin/bash

mkdir wp-plugins/;
mv evermight wp-plugins/;
cp -r wp-plugins/* /var/www/web1/wp-content/plugins;
cp -r wp-plugins/* /var/www/web2/wp-content/plugins;
cp -r wp-plugins/* /var/www/web3/wp-content/plugins;

chown -R www-data:www-data /var/www/web1/wp-content/plugins;
chown -R www-data:www-data /var/www/web2/wp-content/plugins;
chown -R www-data:www-data /var/www/web3/wp-content/plugins;
