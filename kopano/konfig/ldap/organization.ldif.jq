"
dn: ou=\(.organization),dc=\(.domain | split(".") | join(",dc="))
objectClass: organizationalUnit
objectClass: top
ou: \(.organization)
"