"
server_listen = *%lo:236
mysql_user = kopano
local_admin_users = root kopano
user_plugin = ldap
user_plugin_config = /etc/kopano/ldap.cfg
enable_sso = yes
kcoidc_issuer_identifier = https://\(.domain)
enable_hosted_kopano = yes
storename_format = %u@%c
loginname_format = %u@%c
"