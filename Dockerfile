FROM hypriot/rpi-python

RUN apt-get update && \
    apt-get install --yes wget

RUN wget --no-check-certificate https://dl.eff.org/certbot-auto \
  && chmod a+x certbot-auto

RUN wget --no-check-certificate https://raw.githubusercontent.com/desec-io/certbot-hook/master/hook.sh

COPY .dedynauth .dedynauth

RUN ./certbot-auto --manual \
  --text \
  --preferred-challenges dns \
  --manual-auth-hook ./hook.sh \
  -d YOUR_DOMAIN_NAME \
  certonly

CMD ["/bin/bash"]
