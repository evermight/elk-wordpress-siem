#!/bin/bash
while getopts i: option
do
    case "${option}" in
        i) fqdn=${OPTARG};;
    esac
done

if [ -z $fqdn ]; then
  echo '-i for ip address or FQDN required'
  exit
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR;

scp -r ./wordpress/wp-content/plugins/* root@$fqdn:/var/www/web1/wp-content/plugins/
scp -r ./wordpress/wp-content/plugins/* root@$fqdn:/var/www/web2/wp-content/plugins/
scp -r ./wordpress/wp-content/plugins/* root@$fqdn:/var/www/web3/wp-content/plugins/

ssh root@$fqdn "chown -R www-data:www-data /var/www/web1/wp-content/plugins/"
ssh root@$fqdn "chown -R www-data:www-data /var/www/web2/wp-content/plugins/"
ssh root@$fqdn "chown -R www-data:www-data /var/www/web3/wp-content/plugins/"

