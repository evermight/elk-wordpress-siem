#!/bin/bash

while getopts j: option
do
    case "${option}" in
        j) f2b_jail=${OPTARG};;
    esac
done

if [ -z $f2b_jail ]; then
  echo "-j for jail name required";
  exit;
fi;

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $script_dir
source ./.env

f2b_jail="pizza-login"

f2b_status=$(echo $(fail2ban-client status $f2b_jail));
f2b_filelist=$(echo "$f2b_status" | sed -e 's/.*File list:\s*//' | sed -e 's/\s\+`-\sActions.*//');
f2b_iplist=$(echo "$f2b_status" | sed -e 's/.*IP list:\s*//' | sed -e 's/\s\+/\\",\\"/');
if [ -n "$f2b_iplist" ]; then
  f2b_iplist='\"'$f2b_iplist'\"';
fi
#echo $f2b;
#echo $f2b_iplist;
#echo $f2b_filelist;
hn=$(hostname);
tm=$(date -u +'%FT%T.%3NZ');

payload='{"timestamp":"'$tm'","hostname":"'$hn'","ip_list":"['$f2b_iplist']","file_list":"'$f2b_filelist'","status":"'$f2b_status'","jail":"'$f2b_jail'"}';
curl -k -X POST -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/fail2ban/_doc" \
    -H "Content-Type: application/json" \
    -d "$payload"

