#!/usr/bin/env bash

set -e

cd /etc/konfig/
CONFIG_JSON=${1:-kopano-one.json}

if [ -f configured ]; then
  echo "System is already configured"
  exit 1
fi

# Write postfix configuration files
jq -rf postfix/ldap-users.cf.jq < "${CONFIG_JSON}" > /etc/postfix/ldap-users.cf
jq -rf postfix/main.cf.jq < "${CONFIG_JSON}" > /etc/postfix/main.cf

# Modify the default Kopano configuration files
jq -rf kopano/config.php.jq < "${CONFIG_JSON}" >> /etc/kopano/webapp/config.php
jq -rf kopano/dagent.cfg.jq < "${CONFIG_JSON}" >> /etc/kopano/dagent.cfg
jq -rf kopano/gateway.cfg.jq < "${CONFIG_JSON}" >> /etc/kopano/gateway.cfg
jq -rf kopano/kapid.cfg.jq < "${CONFIG_JSON}" >> /etc/kopano/kapid.cfg
jq -rf kopano/konnectd.cfg.jq < "${CONFIG_JSON}" >> /etc/kopano/konnectd.cfg
jq -rf kopano/kwebd.cfg.jq < "${CONFIG_JSON}" >> /etc/kopano/kwebd.cfg
jq -rf kopano/ldap.cfg.jq < "${CONFIG_JSON}" >> /etc/kopano/ldap.cfg
jq -rf kopano/server.cfg.jq < "${CONFIG_JSON}" >> /etc/kopano/server.cfg

# Reconfigure slapd using a generated debconf database
jq -rf ldap/debconf.dat.jq < "${CONFIG_JSON}" >> ldap/debconf.dat
DEBCONF_DB_OVERRIDE='File{/etc/konfig/ldap/debconf.dat}' dpkg-reconfigure --frontend=noninteractive slapd

# Import Kopano LDAP schema
zcat /usr/share/doc/kopano/kopano.ldif.gz | slapadd -n 0

# Generate and import LDIF files
jq -rf ldap/organization.ldif.jq < "${CONFIG_JSON}" | slapadd -n 1
jq -rf ldap/users.ldif.jq < "${CONFIG_JSON}" | slapadd -n 1

# Fix LDAP permissions
chown -R openldap:openldap /etc/ldap

# Allow (re)starting services during apt-get operations
sed -i 's|^exit 101|#exit 101|g' /usr/sbin/policy-rc.d

# Mark system as configured
touch configured
