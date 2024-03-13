#!/bin/bash
while getopts t: option
do
    case "${option}" in
        t) stype=${OPTARG};;
    esac
done

if [ -z $stype ]; then
  echo '-t for object type required: visualization, dashboard, search, index-pattern'
  exit
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR;
source ./.env

curl -k -X GET -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/saved_objects/_find?type="$stype -H "kbn-xsrf: reporting"
