"
!include /usr/share/kopano/ldap.openldap.cfg
ldap_uri = ldap://localhost
ldap_bind_user = cn=admin,dc=\(.domain | split(".") | join(",dc="))
ldap_bind_passwd = \(.adminPassword)
ldap_search_base = dc=\(.domain | split(".") | join(",dc="))
"