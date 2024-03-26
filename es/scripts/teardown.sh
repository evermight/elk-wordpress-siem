#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR;
source ./.env

curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/alerts-siem"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/alerts-general"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/clamscans"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/fail2ban"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/wp-plugins"

curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/data_views/data_view/3c126ef7-6442-4c01-9f2d-5d0bb7c7a980" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/data_views/data_view/333e7141-c564-4a3b-b7c7-3bf85329a076" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/data_views/data_view/6b0a22f4-5cd0-46c0-b332-39423067beb8" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/data_views/data_view/e2b51bf4-db11-4628-b1df-94a249cf9e2e" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/saved_objects/dashboard/06400b60-deed-11ee-a156-ed6be4f6519f" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/alerting/rule/115020c0-c3cd-11ee-ba2a-5fe446fe9078" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/alerting/rule/3d43d4d0-d75d-11ee-b177-d388cf014bb2" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/alerting/rule/66fb22f0-d6a0-11ee-a9da-c7fd352d04b2" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/alerting/rule/768fd860-dc35-11ee-b28e-ddfb0a50b92e" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/alerting/rule/3ebfadd0-dd9c-11ee-9200-cb5cc7ba4eec" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/alerting/rule/194e9d40-e32d-11ee-88ff-45113736fd24" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/detection_engine/rules?rule_id=03e8c539-1d46-4688-ba8c-d050782915a6" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/detection_engine/rules?rule_id=2fe13990-41d6-4b4b-a491-ddde59c5ffb8" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/detection_engine/rules?rule_id=546730be-aad0-491b-baa5-a6fd7beaed01" -H "kbn-xsrf: reporting"

curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/actions/connector/90eeb130-c494-11ee-bba7-9d5215344c58" -H "kbn-xsrf: reporting"
curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$KIBANA_HOST/api/actions/connector/446e2d20-c554-11ee-a7fc-855e12ead1d4" -H "kbn-xsrf: reporting"

#curl -k -X DELETE -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/_ingest/pipeline/geoip"
