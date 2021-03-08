. as $root | .users | to_entries[] | "
dn: uid=\(.value.username),ou=\($root.organization),dc=\($root.domain | split(".") | join(",dc="))
objectClass: posixAccount
objectClass: top
objectClass: kopano-user
objectClass: inetOrgPerson
gidNumber: \(1000 + .key)
cn: \(.value.givenName) \(.value.surName)
homeDirectory: /home/\(.value.username)
mail: \(.value.username)@\($root.domain)
uidNumber: \(1000 + .key)
uid: \(.value.username)
kopanoAccount: 1
kopanoAdmin: \(if .value.admin then "1" else "0" end)
sn: \(.value.surName)
userPassword: \(.value.password)
"