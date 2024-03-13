#!/bin/bash

# This script is a HACK to get around a docker-compose and "default variabel problem" with logstash
#sed -i 's/schedule\s\+=>\s\+"[^"]\+"/schedule => "${LOGSTASH_DEBUG_SCHEDULE}"/g' conf.d/*.conf
sed -i 's/schedule\s\+=>/schedule => "${LOGSTASH_DEBUG_SCHEDULE}" #/g' conf.d/*.conf
