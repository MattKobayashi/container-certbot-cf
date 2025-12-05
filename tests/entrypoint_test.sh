#!/bin/sh

PRIMARY_DOMAIN=${DOMAIN%%,*}
PRIMARY_DOMAIN=$(printf "%s" "$PRIMARY_DOMAIN" | sed -e 's/^ *//' -e 's/ *$//' -e 's/^\*\.//')

cat > cli.ini << EOF
agree-tos = True
# dns-cloudflare = True
# dns-cloudflare-credentials = /run/secrets/CERTBOT_CF_DNS_API_TOKEN
# dns-cloudflare-propagation-seconds = 30
deploy-hook = cp -RL /etc/letsencrypt/live/$PRIMARY_DOMAIN/ /opt/certs/ && chmod -R o+r /opt/certs/
domain = $DOMAIN
email = $EMAIL
keep-until-expiring = True
no-eff-email = True
standalone = True
EOF

exec certbot certonly --config cli.ini --dry-run --no-verify-ssl --non-interactive --server https://10.30.50.2:14000/dir --verbose
