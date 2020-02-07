FROM nginx:latest

ARG PROXY_USER
ARG PROXY_PASSWORD


RUN apt-get update && apt-get install -y openssl apache2-utils

# Create TLS directory and move to
#RUN mkdir /etc/nginx/TLS
#WORKDIR /etc/nginx/TLS

# Generate self signed certificates and Diffie Hellman key
#RUN \ 
#openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout owntracks.key -out owntracks.crt -subj "/C=FR/ST=HR/L= /O=Security/OU=IT/CN=owntracks" && \
#openssl dhparam -out /etc/nginx/TLS/dhparam.pem 2048

# Remove server version in nginx.conf
RUN sed -i 's/        # server_tokens off;/        server_tokens off;/' /etc/nginx/nginx.conf

# Create nginx password to secure some directories
WORKDIR /etc/nginx
RUN htpasswd -c -b .owntracks.passwd "${PROXY_USER}" "${PROXY_PASSWORD}"

# Create/configure virtualhost and remove default virtualhost
COPY ./virtualhost.conf /etc/nginx/conf.d/
RUN rm /etc/nginx/conf.d/default.conf

EXPOSE 80 443

ENTRYPOINT nginx -g 'daemon off;'
