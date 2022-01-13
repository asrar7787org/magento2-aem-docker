FROM nginx:latest

RUN apt-get update && apt-get install -y \
    vim \
    nano

COPY ./conf/* /etc/nginx/conf.d/

COPY ./ssl_cert/*.pem /etc/nginx/ssl/

# Uncomment the following lines if you want to generate SSl certificates during docker compose build
#RUN apt-get -qq update && apt-get -qq -y install openssl && mkdir -p /etc/nginx/ssl && cd /etc/nginx/ssl
#RUN cd /etc/nginx/ssl && openssl req -newkey rsa:2048 -nodes -keyout magento.key -x509 -days 365 \
#   -out magento.pem -subj "/C=UA/ST=Kyiv/L=Kyiv/O=magento.local/OU=magento.local/CN=magento.local"
#RUN openssl req -newkey rsa:2048 -nodes -keyout magentodede.key -x509 -days 365 \
#   -out magentodede.pem -subj "/C=UA/ST=Kyiv/L=Kyiv/O=magentodede.local/OU=magentodede.local/CN=magentodede.local"