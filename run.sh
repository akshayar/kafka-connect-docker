#!/bin/bash

set -e


envsubst < /opt/kafka-connect/connect-distributed.template > /var/run/kafka-connect/connect-distributed.properties

/opt/bitnami/kafka/bin/connect-distributed.sh /var/run/kafka-connect/connect-distributed.properties

