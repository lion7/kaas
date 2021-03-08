FROM docker.pkg.github.com/lion7/kaas/kopano:latest

# Copy JSON
COPY kopano-one.json /etc/konfig/kopano-one.json

# Run konfig
RUN /etc/konfig/configure.sh

