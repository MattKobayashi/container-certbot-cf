FROM certbot/dns-cloudflare:v5.0.0@sha256:0dbdb8667052256f5ebdd8a56bbf24cf80b6045a9520fdfb5575c087011341ee

RUN apk --no-cache add supercronic \
    && mkdir /crontab/ \
    && mkdir /opt/certs/

COPY certbot-cron /crontab/
COPY --chmod=0744 entrypoint.sh .
COPY --chmod=0744 tests/entrypoint_test.sh .

ENTRYPOINT ["./entrypoint.sh"]

LABEL org.opencontainers.image.authors="MattKobayashi <matthew@kobayashi.au>"
