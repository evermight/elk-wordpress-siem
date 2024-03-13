#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR'/../'
source ./.env

curl -k -X POST -u $ELASTIC_USER:$ELASTIC_PASS "$ELASTIC_HOST/_security/user/"$AGENT_USER \
-H "Content-Type: application/json" \
-d '{
  "password" : "'$AGENT_PASS'",
  "roles" : [ "superuser" ],
  "full_name" : "Agent User",
  "email" : "agent@agent.com"
}'
