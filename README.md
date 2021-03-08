# Kopano as a service

## Prerequisites
- Ensure that you are logged in to the Github Docker Package Registry
- Have access to DNS settings of your domain
- A server with a decent amount of resources, and with a Linux distro installed (Fedora CoreOS is preferred) 

## Start the container using podman (as root)
```bash
sudo podman run --name kaas --restart=always --systemd=always --privileged --tty --detach \
                -p 25:25 -p 80:80 -p 443:443 -p 465:465 -p 587:587 \
                -v letsencrypt:/etc/letsencrypt \
                -v postfix:/var/lib/postfix \
                -v postfix-spool:/var/spool/postfix \
                -v mysql:/var/lib/mysql \
                -v ldap:/var/lib/ldap \
                docker.pkg.github.com/lion7/kaas/kaas:latest
```

## Enter a bash shell inside the pod
```bash
sudo podman exec -it kaas bash
```

## Acquire a wildcard SSL certificate
```bash
certbot certonly --manual --preferred-challenges=dns --email postmaster@example.com --agree-tos -d example.com -d *.example.com
```

## Fix permissions on LetsEncrypt certificates so that the Kopano processes can use them
```bash
chmod o+rx /etc/letsencrypt/live/
chmod o+rx /etc/letsencrypt/archive/
chmod o+rx /etc/letsencrypt/archive/example.com/privkey1.pem
```

## Check if all services are running (and restart those that are not)
```bash
systemctl
```
