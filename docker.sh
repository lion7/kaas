#!/usr/bin/env bash

# disable MINGW path conversions
export MSYS_NO_PATHCONV=1

# Note: use podman wherever possible, because it has built-in support for systemd
# See the following links for more info on why and how:
# https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/
# https://developers.redhat.com/blog/2016/09/13/running-systemd-in-a-non-privileged-container/
# https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container/
docker run --name kaas --restart=no --privileged=true --tty --detach \
           -p 25:25 -p 80:80 -p 443:443 -p 465:465 -p 587:587 \
           -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
           --tmpfs /tmp --tmpfs /run --tmpfs /sys/fs/cgroup/systemd --tmpfs /var/lib/journal \
           docker.pkg.github.com/lion7/kaas/kaas:latest