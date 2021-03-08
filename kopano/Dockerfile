FROM alehaa/debian-systemd:buster

# Reference SIGRTMIN+3 by its number, as a workaround for https://github.com/opencontainers/runc/issues/1766
STOPSIGNAL 37

# Add ports
EXPOSE 25 80 110 143 443 465 587 993 995

# Install prerequisites
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates gnupg-agent software-properties-common certbot && \
    rm -rf /var/lib/apt/lists/*

# Install utilities
RUN apt-get update && \
    apt-get install -y curl wget dnsutils nano vim jq && \
    rm -rf /var/lib/apt/lists/*

# Install postfix and slapd
RUN apt-get update && \
    apt-get install -y postfix slapd ldap-utils && \
    rm -rf /var/lib/apt/lists/*

# Install kopano-one
RUN curl -fsSL "https://repo.kopano.com/kopano/one/20.09/gpg" | apt-key add -
RUN add-apt-repository "deb https://repo.kopano.com/kopano/one/20.09 $(lsb_release -cs) supported"
RUN apt-get update && \
    apt-get install -y kopano-one && \
    rm -rf /var/lib/apt/lists/*

# Bugfix for kopano-gatway, see https://forum.kopano.io/topic/2886/ssl-negotiation-failures-with-tlsv1-and-tlsv1-3-against-gateway-ical-on-debian-10/17
RUN setcap cap_net_bind_service=+ep /usr/sbin/kopano-gateway

# Copy konfig files
COPY konfig/ /etc/konfig/

# Copy MySQL configuration files
COPY mysql/ /etc/mysql/

# Copy systemd units
COPY systemd/ /lib/systemd/system/

# Enable systemd units
RUN systemctl enable kopano-chown.service
RUN systemctl enable kopano-init.service

# Mask audit messages in journal
RUN ln -s /dev/null /etc/systemd/system/systemd-journald-audit.socket

# Volume for LetsEncrypt ACME account and certificates
VOLUME /etc/letsencrypt

# Volumes for postfix data
VOLUME /var/lib/postfix
VOLUME /var/spool/postfix

# Volumes for MySQL data
VOLUME /var/lib/mysql

# Volumes for LDAP data
VOLUME /var/lib/ldap

# Volumes for Kopano data
#VOLUME /var/lib/kopano
#VOLUME /var/lib/kopano-grapi
#VOLUME /var/lib/kopano-kdav
#VOLUME /var/lib/kopano-webapp
#VOLUME /var/lib/z-push