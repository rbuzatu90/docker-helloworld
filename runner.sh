#!/bin/sh
echo "who ========"
whoami
# Replace the hostname in the container
sed -i 's/HOSTNAME/'"$HOSTNAME"'/g' /opt/rh/httpd24/root/var/www/html/index.html

# Startup the cmd
exec "/opt/rh/httpd24/root/usr/sbin/httpd"
exec "$@"
