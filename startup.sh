#!/bin/sh
set -e
echo "Restarting sshd"
service ssh restart
service ssh status
echo "Starting httpd foreground"
exec apachectl -DFOREGROUND "$@"
