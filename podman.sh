#!/usr/bin/env bash
sudo podman run --name kaas --restart=always --systemd=always --privileged --tty --detach \
                -p 25:25 -p 80:80 -p 443:443 -p 465:465 -p 587:587 \
                -v letsencrypt:/etc/letsencrypt \
                -v postfix:/var/lib/postfix \
                -v postfix-spool:/var/spool/postfix \
                -v mysql:/var/lib/mysql \
                -v ldap:/var/lib/ldap \
                docker.pkg.github.com/lion7/kaas/kaas:latest
#                -v kopano:/var/lib/kopano \
#                -v kopano-grapi:/var/lib/kopano-grapi \
#                -v kopano-kdav:/var/lib/kopano-kdav \
#                -v kopano-webapp:/var/lib/kopano-webapp \
#                -v kopano-zpush:/var/lib/z-push \
#                docker.pkg.github.com/lion7/kaas/kopano:latest