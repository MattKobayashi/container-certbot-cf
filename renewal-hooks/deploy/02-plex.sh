#!/bin/bash

PRIMARY_DOMAIN=${DOMAIN%%,*}
PRIMARY_DOMAIN=$(printf "%s" "$PRIMARY_DOMAIN" | sed -e 's/^ *//' -e 's/ *$//' -e 's/^\*\.//')

openssl pkcs12 -export -out /opt/certs/cert_key.p12 -inkey /etc/letsencrypt/live/"$PRIMARY_DOMAIN"/privkey.pem -in /etc/letsencrypt/live/"$PRIMARY_DOMAIN"/cert.pem -certfile /etc/letsencrypt/live/"$PRIMARY_DOMAIN"/chain.pem -passout pass:"$CERT_PASSWORD"
chmod -R o+r /opt/certs/
