#!/bin/bash
set -e

if [[ "$JMX_REMOTE" ]]; then
  if [[ -z "$RMI_SERVER_HOSTNAME" ]]; then
    RMI_SERVER_HOSTNAME='0.0.0.0'
  fi

  sed -i '/^JAVA_ARGS/a JAVA_ARGS="$JAVA_ARGS -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.rmi.port=1098 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.local.only=false -Djava.rmi.server.hostname='"${RMI_SERVER_HOSTNAME}"'"' ../etc/artemis.profile
fi

source /docker-entrypoint.sh
