FROM debian:9

ARG DB_USER
ARG DB_PASSWORD

RUN \ 
apt-get update && apt-get install -y curl gnupg gnupg2 && \ 
curl https://raw.githubusercontent.com/owntracks/recorder/master/etc/repo.owntracks.org.gpg.key | apt-key add - && \
echo "deb  http://repo.owntracks.org/debian stretch main" | tee /etc/apt/sources.list.d/owntracks.list > /dev/null && \
apt-get update && \
apt-get install -y ot-recorder


RUN echo 'root:toor' | chpasswd
RUN ot-recorder --initialize

RUN \ 
sed -i 's/# OTR_PORT=1883/OTR_PORT=8883/' /etc/default/ot-recorder && \
sed -i "s/# OTR_USER=\"\"/OTR_USER=\"$DB_USER\"/" /etc/default/ot-recorder && \ 
sed -i 's/# OTR_HTTPHOST="localhost"/OTR_HTTPHOST="ot-recorder"/' /etc/default/ot-recorder && \ 
sed -i 's/# OTR_HOST="localhost"/OTR_HOST="mqtt"/' /etc/default/ot-recorder && \
sed -i "s/# OTR_PASS=\"\"/OTR_PASS=\"$DB_PASSWORD\"/" /etc/default/ot-recorder && \ 
sed -i 's/# OTR_CAFILE=""/OTR_CAFILE="\/etc\/owntracks\/ca.crt"/' /etc/default/ot-recorder

CMD ["ot-recorder", "owntracks/#"]
