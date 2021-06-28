#!/bin/bash

# Renew the certificate
certbot renew --preferred-challenges http

for cert in /etc/letsencrypt/live/*
do
    if [ -d "$cert" ]
        then
            cat $cert/fullchain.pem $cert/privkey.pem > /opt/ssl/$(echo $cert | cut -d '/' -f 5).pem
        fi
done
