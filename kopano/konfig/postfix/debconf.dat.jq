"
Name: debconf/frontend
Template: debconf/frontend
Value: noninteractive
Owners: debconf
Flags: seen

Name: postfix/main_mailer_type
Template: postfix/main_mailer_type
Value: Internet Site
Owners: postfix
Flags: seen

Name: postfix/mailname
Template: postfix/mailname
Value: \(.domain)
Owners: postfix
Flags: seen

Name: postfix/root_address
Template: postfix/root_address
Value: \(.postmaster)
Owners: postfix
Flags: seen

Name: postfix/destinations
Template: postfix/destinations
Value: \(.hostname), localhost.\(.domain), localhost
Owners: postfix
Flags: seen, set

Name: postfix/chattr
Template: postfix/chattr
Value: false
Owners: postfix
Flags: seen

Name: postfix/mynetworks
Template: postfix/mynetworks
Value:
Owners: postfix
Flags: seen

Name: postfix/mailbox_limit
Template: postfix/mailbox_limit
Value: 0
Owners: postfix
Flags: seen

Name: postfix/recipient_delim
Template: postfix/recipient_delim
Value: +
Owners: postfix
Flags: seen

Name: postfix/protocols
Template: postfix/protocols
Value: all
Owners: postfix
Flags: seen
"
