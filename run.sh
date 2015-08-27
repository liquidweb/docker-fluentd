#!/bin/bash

if [ ! "${KUBERNETES_SERVICE_HOST}" ]; then
    /usr/local/bin/fluentd -c /etc/fluent/fluent.conf
else
    /usr/local/bin/fluentd -c /etc/fluent/fluent-kubernetes.conf
fi

