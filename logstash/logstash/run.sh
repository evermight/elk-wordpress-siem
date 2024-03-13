#!/bin/bash

source ./.env;
export ELASTIC_HOST
export ELASTIC_USER
export ELASTIC_PASS
export ELASTIC_CA_FILE
export EMAIL_TO
export EMAIL_FROM
export SMTP_ADDRESS
export SMTP_DOMAIN
export SMTP_PORT
export SMTP_USER
export SMTP_PASS
export SMTP_OUT
export STD_OUT

/usr/share/logstash/bin/logstash --path.settings /etc/logstash --config.reload.automatic
