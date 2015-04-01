#!/bin/bash

service elasticsearch start
service logstash start

# wait for elasticsearch to start up - https://github.com/elasticsearch/kibana/issues/3077
counter=0; while [ ! "$(curl localhost:9200 2> /dev/null)" -a $counter -lt 30  ]; do sleep 1; ((counter++)); echo "waiting for Elasticsearch to be up ($counter/30)"; done;

/opt/kibana/bin/kibana > /var/log/kibana/kibana.log 2>/var/log/kibana/kibana.err.log
exi
