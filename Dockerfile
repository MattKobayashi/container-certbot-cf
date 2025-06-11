FROM certbot/dns-cloudflare:v4.1.0@sha256:d9e940a162acff3ee17afe8117071c708f6ca174308c61fa94af14ca842d3480

RUN apk --no-cache add supercronic \
    && mkdir /crontab/ \
    && mkdir /opt/certs/

COPY certbot-cron /crontab/
COPY --chmod=0744 entrypoint.sh .
COPY --chmod=0744 tests/entrypoint_test.sh .

ENTRYPOINT ["./entrypoint.sh"]

LABEL org.opencontainers.image.authors="MattKobayashi <matthew@kobayashi.au>"
