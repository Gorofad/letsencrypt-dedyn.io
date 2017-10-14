#!/bin/bash

set -ex

/data/certbot-auto --manual \
  -n \
  --no-bootstrap \
  --no-self-upgrade \
  --text \
  --preferred-challenges dns \
  --manual-auth-hook /data/hook.sh \
  -d $LETS_ENCRYPT_DOMAIN \
  -m $LETS_ENCRYPT_EMAIL \
  --agree-tos \
  --manual-public-ip-logging-ok \
  --dry-run \
  certonly

tail -f /dev/null
