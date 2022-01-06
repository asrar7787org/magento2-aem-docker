#!/bin/bash

set -e

exec varnishd \
    -j unix,user=vcache \
    -F \
    -f ${VARNISH_CONFIG} \
    -s ${VARNISH_STORAGE} \
    -a ${VARNISH_LISTEN} \
    -T ${VARNISH_MANAGEMENT_LISTEN} \
    -p feature=+esi_ignore_https \
    -p workspace_backend=128k \
    -p http_resp_size=256k \
    -p http_resp_hdr_len=42000 \
    ${VARNISH_DAEMON_OPTS}