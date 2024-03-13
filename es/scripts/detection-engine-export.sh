#!/bin/bash
while getopts i: option
do
    case "${option}" in
        i) id=${OPTARG};;
    esac
done

if [ -z $id ]; then
  echo '-i for rule id required'
  exit
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR;
source ./.env

# 03e8c539-1d46-4688-ba8c-d050782915a6 - host files
# 2fe13990-41d6-4b4b-a491-ddde59c5ffb8 - sudo
# 546730be-aad0-491b-baa5-a6fd7beaed01 - ssh brute force

curl -k -X POST -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/detection_engine/rules/_export" -H "kbn-xsrf: reporting" -H "Content-Type: application/json" \
-d '{
  "objects": [
    {
      "rule_id": "'$id'"
    }
  ]
}'
