"
tls = yes
tls_cert = /etc/letsencrypt/live/\(.domain)/fullchain.pem
tls_key = /etc/letsencrypt/live/\(.domain)/privkey.pem
\(if .defaultRedirectEnabled then "default_redirect = /webapp/" else "" end)
"