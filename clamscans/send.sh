#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $script_dir
source ./.env

clamscan_log=$script_dir"/log/scan.log"

# Remove everything before and including "----------- SCAN SUMMARY -----------"
payload=$(sed '1,/----------- SCAN SUMMARY -----------/d' "$clamscan_log");
# Make object keys lowercase and add quotation
payload=$(echo "$payload" | sed -e 's/\([^:]*\):/"\L\1":/');
# Make object keys underscore notation
payload=$(echo "$payload" | sed -e 's/\([a-z]\)\s\+\([a-z]\)/\1_\2/');
# Put quotes around answers
payload=$(echo "$payload" | sed -e 's/:\s*\(.\+\)$/:"\1"/');
# Remove quotes from numbers
payload=$(echo "$payload" | sed -e 's/:"\([0-9]\+\.\?[0-9]*\)"$/:\1/');
# Add comma to end each line
payload=$(echo "$payload" | sed -e 's/:\(.\+\)$/:\1,/');

## ELASTIC SPECIFIC CHANGES
# Add fix date values for Elasticsearch
payload=$(echo "$payload" | sed -e 's/\(:"[0-9][0-9][0-9][0-9]\):\([0-9][0-9]\):\([0-9][0-9]\s\)/\1-\2-\3/');
# Add fix time values for Elasticsearch
payload=$(echo "$payload" | sed -e 's/\(\s[0-9][0-9]:[0-9][0-9]:[0-9][0-9]\)",$/\1.000000",/');
# Add hostname 
hn=$(hostname)
payload=$payload'"hostname":"'$hn'",';
# Add linux timestamp
tm=$(date -u +'%FT%T.%3NZ')
payload=$payload'"timestamp":"'$tm'"';

## Remove comma from last line of file
#payload=$(echo "$payload" | sed -e '${s/,$//}');

# Close brackets for JSON Object
payload="{$payload}"

curl -k -X POST -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/clamscans/_doc" \
    -H "Content-Type: application/json" \
    -d "$payload"

