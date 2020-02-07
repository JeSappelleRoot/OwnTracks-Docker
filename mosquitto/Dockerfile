FROM debian:9

# Define args build
ARG DB_USER
ARG DB_PASSWORD

# Get files
RUN apt-get update && apt-get install -y mosquitto mosquitto-clients
# Stop autostarting mosquitto DB
RUN /etc/init.d/mosquitto stop
# Manually create password file
RUN touch /etc/mosquitto/passwd
# Generate password for user dbo and create TLS directory
RUN mosquitto_passwd -b /etc/mosquitto/passwd "${DB_USER}" "${DB_PASSWORD}"
RUN mkdir /etc/mosquitto/TLS

# Copy configuration files
COPY mosquitto_main.conf /etc/mosquitto/mosquitto.conf
COPY mosquitto_confd.conf /etc/mosquitto/conf.d/mosquitto.conf

# Launch Mosquitto DB as entrypoint
ENTRYPOINT mosquitto -c /etc/mosquitto/mosquitto.conf
