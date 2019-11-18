#!/bin/sh

# Replace the hostname in the container
sed -i.bak 's/HOSTNAME/'"$HOSTNAME"'/g' /var/www/html/index.html

# Startup the cmd
exec "$@"
