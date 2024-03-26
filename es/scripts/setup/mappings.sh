#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR'/../'
source ./.env

curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/wp-plugins"
curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/wp-plugins/_mapping" \
-H "Content-Type: application/json" \
-d @./mappings/wp-plugins.json

curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/clamscans"
curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/clamscans/_mapping" \
-H "Content-Type: application/json" \
-d @./mappings/clamscans.json

curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/fail2ban"
curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/fail2ban/_mapping" \
-H "Content-Type: application/json" \
-d @./mappings/fail2ban.json

curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/alerts-siem"
curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/alerts-siem/_mapping" \
-H "Content-Type: application/json" \
-d @./mappings/alerts-siem.json

curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/alerts-general"
curl -k -X PUT -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/alerts-general/_mapping" \
-H "Content-Type: application/json" \
-d @./mappings/alerts-general.json
