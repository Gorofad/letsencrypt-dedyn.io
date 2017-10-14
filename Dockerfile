#FROM hypriot/rpi-alpine
FROM gorofad/rpi-python

RUN apk update && \
    apk upgrade && \
    apk add wget && \
    rm -rf /var/cache/apk/*

RUN wget --no-check-certificate https://dl.eff.org/certbot-auto -o /data/certbot-auto \
  && chmod a+x /data/certbot-auto

RUN wget --no-check-certificate https://raw.githubusercontent.com/desec-io/certbot-hook/master/hook.sh -o /data/hook.sh

COPY .dedynauth /data/.dedynauth

COPY docker-entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod a+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["/bin/bash"]
