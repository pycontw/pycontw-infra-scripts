#!/bin/bash
curl -L https://raw.githubusercontent.com/wmnnd/nginx-certbot/2.x/init-letsencrypt.sh > init-letsencrypt.sh
chmod +x init-letsencrypt.sh
sudo ./init-letsencrypt.sh -d metabase.pycon.tw