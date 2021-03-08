"
# See /usr/share/postfix/main.cf.dist for a commented, more complete version


# Debian specific:  Specifying a file name will cause the first
# line of that file to be used as the name.  The Debian default
# is /etc/mailname.
#myorigin = /etc/mailname

smtpd_banner = $myhostname ESMTP $mail_name
biff = no

# appending .domain is the MUA's job.
append_dot_mydomain = no

# Uncomment the next line to generate 'delayed mail' warnings
#delay_warning_time = 4h

readme_directory = no

# See http://www.postfix.org/COMPATIBILITY_README.html -- default to 2 on fresh installs.
compatibility_level = 2

# TLS parameters
smtp_tls_session_cache_database = btree:${data_directory}/
smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
smtpd_use_tls=yes
smtpd_tls_security_level = may
smtpd_tls_auth_only = yes
smtpd_tls_mandatory_protocols = !SSLv2,!SSLv3,!TLSv1,!TLSv1.1
smtpd_tls_protocols =  !SSLv2,!SSLv3,!TLSv1,!TLSv1.1
smtpd_tls_cert_file = /etc/letsencrypt/live/\(.domain)/fullchain.pem
smtpd_tls_key_file = /etc/letsencrypt/live/\(.domain)/privkey.pem
tls_preempt_cipherlist = no

# See /usr/share/doc/postfix/TLS_README.gz in the postfix-doc package for
# information on enabling SSL in the smtp client.

# Don't talk to mail systems that don't know their own hostname.
smtpd_helo_restrictions = permit_mynetworks, reject_unknown_helo_hostname

# Don't accept mail from domains that don't exist.
smtpd_sender_restrictions = reject_unknown_sender_domain

# Relay control: local clients and authenticated clients may specify any destination domain.
smtpd_relay_restrictions = permit_mynetworks, permit_sasl_authenticated, reject_unauth_destination

# Block clients that speak too early.
smtpd_data_restrictions = reject_unauth_pipelining

# Internet Site configuration
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
myhostname = \(.hostname)
myorigin = \(.domain)
mydestination = \(.hostname), localhost.\(.domain), localhost
relayhost =
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all
inet_protocols = all

# Virtual mailbox configuration
virtual_mailbox_domains = \(.domain)
virtual_mailbox_maps = ldap:/etc/postfix/ldap-users.cf
virtual_transport = lmtp:unix:kopano-dagent.sock
"
