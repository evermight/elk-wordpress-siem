#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR'/../'
source ./.env

curl -k -X POST -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/detection_engine/rules/_import" -H "kbn-xsrf: true" \
--form file=@./detection-engines/sudoers.ndjson
curl -k -X POST -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/detection_engine/rules/_import" -H "kbn-xsrf: true" \
--form file=@./detection-engines/hostfiles.ndjson
curl -k -X POST -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/detection_engine/rules/_import" -H "kbn-xsrf: true" \
--form file=@./detection-engines/ssh-brute-force.ndjson
