FROM certbot/dns-cloudflare:v4.2.0@sha256:741896d9e490b4417c9c2e5eb5aa1c007b6f6a754d57edf7a9bbd8eb3874a057

RUN apk --no-cache add supercronic \
    && mkdir /crontab/ \
    && mkdir /opt/certs/

COPY certbot-cron /crontab/
COPY --chmod=0744 entrypoint.sh .
COPY --chmod=0744 tests/entrypoint_test.sh .

ENTRYPOINT ["./entrypoint.sh"]

LABEL org.opencontainers.image.authors="MattKobayashi <matthew@kobayashi.au>"
