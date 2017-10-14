#!/bin/bash

apk update
apk --upgrade add gcc linux-headers musl-dev libffi-dev # tools for installing certbot
apk add openssl-dev curl bind-tools # tools for running certbot

chmod a+x /data/certbot-auto /data/hook.sh

echo "Installing certbot-auto - this can take some time..."
/data/certbot-auto -q --no-bootstrap --no-self-upgrade --debug --manual

# delete tools for installing certbot
apk del gcc linux-headers musl-dev libffi-dev

rm -rf /var/cache/apk/*
