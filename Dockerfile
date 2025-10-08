FROM certbot/dns-cloudflare:v5.1.0@sha256:8181d9632ee6af74234ede88469f9f4d9b7faab4ed4cd7e77e66afca908ea992

RUN apk --no-cache add supercronic \
    && mkdir /crontab/ \
    && mkdir /opt/certs/

COPY certbot-cron /crontab/
COPY --chmod=0744 entrypoint.sh .
COPY --chmod=0744 tests/entrypoint_test.sh .

ENTRYPOINT ["./entrypoint.sh"]

LABEL org.opencontainers.image.authors="MattKobayashi <matthew@kobayashi.au>"
