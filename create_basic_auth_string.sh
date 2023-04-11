#!/bin/bash

SUDO=''
if (( $EUID != 0 )); then SUDO='sudo'; fi

echo "Basic auth Generator for Traefik >= v1.7"
read -p "User: "  USER
read -p "Password: "  PW

# Checks if htpasswd is available or install it otherwise
which htpasswd >/dev/null || ($SUDO apt-get update && $SUDO apt-get install apache2-utils)

# Generate strings
echo "------- Basic auth string for .htpasswd --------"
string=$(htpasswd -nbB $USER $PW)
echo $string
echo "------- Basic auth string for docker-compose.yml --------"
# Escape string
echo "$string" | sed -e 's/\$/\$\$/g'
