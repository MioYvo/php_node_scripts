#!/bin/bash

mkdir -p /etc/v2ray
curl https://raw.githubusercontent.com/MioYvo/php_node_scripts/master/config.json -o /etc/v2ray/config.json

docker stop v2ray
docker rm v2ray
docker run -itd --name v2ray --restart always -p 31560:31560 -p 31561:31561 -v /etc/v2ray/config.json:/etc/v2ray/config.json --log-opt max-size=10m --log-opt max-file=10 v2ray/official