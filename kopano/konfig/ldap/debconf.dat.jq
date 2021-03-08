"
Name: debconf/frontend
Template: debconf/frontend
Value: noninteractive
Owners: debconf
Flags: seen

Name: shared/organization
Template: shared/organization
Value: kaas
Owners: slapd
Flags: seen

Name: slapd/no_configuration
Template: slapd/no_configuration
Value: false
Owners: slapd
Flags: seen

Name: slapd/domain
Template: slapd/domain
Value: \(.domain)
Owners: slapd
Flags: seen

Name: slapd/password1
Template: slapd/password1
Value: \(.adminPassword)
Owners: slapd
Flags: seen

Name: slapd/password2
Template: slapd/password2
Value: \(.adminPassword)
Owners: slapd
Flags: seen

Name: slapd/backend
Template: slapd/backend
Value: MDB
Owners: slapd
Flags: seen

Name: slapd/purge_database
Template: slapd/purge_database
Value: false
Owners: slapd
Flags: seen

Name: slapd/move_old_database
Template: slapd/move_old_database
Value: true
Owners: slapd
Flags: seen
"
