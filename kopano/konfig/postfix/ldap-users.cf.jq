"
server_host = localhost
search_base = \($root.domain | split(".") | join(",dc="))
version = 3
scope = sub
query_filter = (&(objectClass=posixAccount)(mail=%s))
result_attribute = mail
"
