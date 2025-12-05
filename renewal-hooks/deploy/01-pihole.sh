#!/bin/bash

PRIMARY_DOMAIN=${DOMAIN%%,*}
PRIMARY_DOMAIN=$(printf "%s" "$PRIMARY_DOMAIN" | sed -e 's/^ *//' -e 's/ *$//' -e 's/^\*\.//')

cp /etc/letsencrypt/live/"$PRIMARY_DOMAIN"/cert.pem /opt/certs/tls.pem
cat /etc/letsencrypt/live/"$PRIMARY_DOMAIN"/privkey.pem /opt/certs/tls.pem
