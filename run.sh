#!/bin/bash

set -e
echo "Starting Kafka Connect"
echo "DESTINATION_BOOTSTRAP_SERVER=${DESTINATION_BOOTSTRAP_SERVER}"
echo "REPLICATION_FACTOR=${REPLICATION_FACTOR}"
echo "OFFSET_STORAGE_TOPIC=${OFFSET_STORAGE_TOPIC}"
echo "CONFIG_STORAGE_TOPIC=${CONFIG_STORAGE_TOPIC}"
echo "STATUS_STORAGE_TOPIC=${STATUS_STORAGE_TOPIC}"
envsubst < /opt/kafka-connect/connect-distributed.template > /var/run/kafka-connect/connect-distributed.properties
cat /var/run/kafka-connect/connect-distributed.properties
/opt/bitnami/kafka/bin/connect-distributed.sh /var/run/kafka-connect/connect-distributed.properties

