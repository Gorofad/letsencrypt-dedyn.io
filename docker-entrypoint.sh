#!/bin/bash

set -ex

/data/certbot-auto --manual \
  --text \
  --preferred-challenges dns \
  --manual-auth-hook /data/hook.sh \
  -d mdvif.dedyn.io \
  --dry-run \
  certonly

