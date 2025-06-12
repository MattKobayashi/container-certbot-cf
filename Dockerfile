FROM certbot/dns-cloudflare:v4.1.1@sha256:bf87c2e3588f08c7fd520cc2fd155a954850c68d92105d693b26cd12dc3fca28

RUN apk --no-cache add supercronic \
    && mkdir /crontab/ \
    && mkdir /opt/certs/

COPY certbot-cron /crontab/
COPY --chmod=0744 entrypoint.sh .
COPY --chmod=0744 tests/entrypoint_test.sh .

ENTRYPOINT ["./entrypoint.sh"]

LABEL org.opencontainers.image.authors="MattKobayashi <matthew@kobayashi.au>"
