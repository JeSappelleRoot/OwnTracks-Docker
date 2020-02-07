#/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./TLS/owntracks.key -out ./TLS/owntracks.crt -subj "/C=FR/ST=HR/L= /O=Security/OU=IT/CN=owntracks" &> /dev/null
openssl dhparam -out ./TLS/dhparam.pem 2048
