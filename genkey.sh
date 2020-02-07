
MOSQUITTO_DIR="./mosquitto/TLS"
NGINX_DIR="./nginx/TLS"
OT_RECORDER_DIR="./ot-recorder/CA"

echo "Cleaning directory $MOSQUITTO_DIR"
rm -f $MOSQUITTO_DIR/ca*
rm -f $MOSQUITTO_DIR/mqtt.*

echo "Cleaning directory $OT_RECORDER_DIR"
rm -f $OT_RECORDER_DIR/ca*

echo "Cleaning directory $NGINX_DIR"
rm -f $NGINX_DIR/*

echo "Generate Mosquitto DB CA files"
cd ./mosquitto
bash generate-CA.sh mqtt
cp TLS/ca.crt .$OT_RECORDER_DIR

echo "Generate Nginx certificates"
cd ../nginx
bash generate_certs.sh
