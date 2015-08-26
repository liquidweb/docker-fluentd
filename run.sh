#!/bin/bash

ADD fluent.conf /etc/fluent/
ADD fluent-kubernetes.conf /etc/fluent/

ENTRYPOINT ["/usr/local/bin/fluentd", "-c", "/etc/fluent/fluent.conf"]


if [ ! "${KUBERNETES_SERVICE_HOST}" ]; then
    /usr/local/bin/fluentd -c /etc/fluent/fluent-kubernetes.conf
else
    /usr/local/bin/fluentd -c /etc/fluent/fluent.conf
fi

