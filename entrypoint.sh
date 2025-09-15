#!/bin/sh

PRIMARY_DOMAIN=${DOMAIN%%,*}
PRIMARY_DOMAIN=$(printf "%s" "$PRIMARY_DOMAIN" | sed -e 's/^ *//' -e 's/ *$//')

cat > cli.ini << EOF
agree-tos = True
dns-cloudflare = True
dns-cloudflare-credentials = /run/secrets/CERTBOT_CF_DNS_API_TOKEN
dns-cloudflare-propagation-seconds = 30
domain = $DOMAIN
email = $EMAIL
expand = True
keep-until-expiring = True
no-eff-email = True
post-hook = openssl pkcs12 -export -out /etc/letsencrypt/live/$PRIMARY_DOMAIN/cert_key.p12 -inkey /etc/letsencrypt/live/$PRIMARY_DOMAIN/privkey.pem -in /etc/letsencrypt/live/$PRIMARY_DOMAIN/cert.pem -certfile /etc/letsencrypt/live/$PRIMARY_DOMAIN/chain.pem -passout pass:
EOF

certbot certonly --config /opt/certbot/cli.ini
exec /usr/bin/supercronic /crontab/certbot-cron
