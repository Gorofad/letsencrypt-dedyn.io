#FROM hypriot/rpi-alpine
FROM gorofad/rpi-python

COPY docker-entrypoint.sh docker-install-certbot.sh docker-cron.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/docker-entrypoint.sh \
    /usr/local/bin/docker-install-certbot.sh \
    /usr/local/bin/docker-cron.sh

ADD https://dl.eff.org/certbot-auto /data/certbot-auto
ADD https://raw.githubusercontent.com/desec-io/certbot-hook/master/hook.sh /data/hook.sh 

RUN docker-install-certbot.sh

COPY .dedynauth /data/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/bin/bash"]
