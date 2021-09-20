"
dn: ou=\(.organizationalUnit),dc=\(.domain | split(".") | join(",dc="))
objectClass: organizationalUnit
objectClass: top
ou: \(.organizationalUnit)
"
