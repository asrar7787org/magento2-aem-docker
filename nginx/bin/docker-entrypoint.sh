#!/bin/bash

#[ "$DEBUG" = "true" ] && set -x

# List of VHOST
VHOST_FILE="/etc/nginx/conf.d/magento.local.conf"
#VHOST_FILE_2="/etc/nginx/conf.d/magentoarae.local.conf"

# Update VHOST_FILE_1 parameters
[ ! -z "${DOMAIN_NAME_1}" ] && sed -i "s/!DOMAIN_NAME!/${DOMAIN_NAME_1}/" $VHOST_FILE
[ ! -z "${NGINX_FPM_HOST}" ] && sed -i "s/!NGINX_FPM_HOST!/${NGINX_FPM_HOST}/" $VHOST_FILE
[ ! -z "${NGINX_FPM_PORT}" ] && sed -i "s/!NGINX_FPM_PORT!/${NGINX_FPM_PORT}/" $VHOST_FILE
[ ! -z "${NGINX_SSL_CERT}" ] && sed -i "s/!NGINX_SSL_CERT!/${NGINX_SSL_CERT}/" $VHOST_FILE
[ ! -z "${NGINX_SSL_CERT_KEY}" ] && sed -i "s/!NGINX_SSL_CERT_KEY!/${NGINX_SSL_CERT_KEY}/" $VHOST_FILE
[ ! -z "${LOCAL_HOST_IP}" ] && sed -i "s/!LOCAL_HOST_IP!/${LOCAL_HOST_IP}/" $VHOST_FILE
[ ! -z "${MAGENTO_RUN_MODE}" ] && sed -i "s/!MAGENTO_RUN_MODE!/${MAGENTO_RUN_MODE}/" $VHOST_FILE
[ ! -z "${PHP_UPLOAD_MAX_FILESIZE}" ] && sed -i "s/!PHP_UPLOAD_MAX_FILESIZE!/${PHP_UPLOAD_MAX_FILESIZE}/" $VHOST_FILE

# Uncomment to update VHOST_FILE_2 parameters
#[ ! -z "${DOMAIN_NAME_2}" ] && sed -i "s/!DOMAIN_NAME!/${DOMAIN_NAME_2}/" $VHOST_FILE_2
#[ ! -z "${NGINX_FPM_HOST}" ] && sed -i "s/!NGINX_FPM_HOST!/${NGINX_FPM_HOST}/" $VHOST_FILE_2
#[ ! -z "${NGINX_FPM_PORT}" ] && sed -i "s/!NGINX_FPM_PORT!/${NGINX_FPM_PORT}/" $VHOST_FILE_2
#[ ! -z "${NGINX_SSL_CERT}" ] && sed -i "s/!NGINX_SSL_CERT!/${NGINX_SSL_CERT}/" $VHOST_FILE_2
#[ ! -z "${NGINX_SSL_CERT_KEY}" ] && sed -i "s/!NGINX_SSL_CERT_KEY!/${NGINX_SSL_CERT_KEY}/" $VHOST_FILE_2
#[ ! -z "${LOCAL_HOST_IP}" ] && sed -i "s/!LOCAL_HOST_IP!/${LOCAL_HOST_IP}/" $VHOST_FILE_2
#[ ! -z "${MAGENTO_RUN_MODE}" ] && sed -i "s/!MAGENTO_RUN_MODE!/${MAGENTO_RUN_MODE}/" $VHOST_FILE_2
#[ ! -z "${PHP_UPLOAD_MAX_FILESIZE}" ] && sed -i "s/!PHP_UPLOAD_MAX_FILESIZE!/${PHP_UPLOAD_MAX_FILESIZE}/" $VHOST_FILE_2

# Check if the nginx syntax is fine, then launch.
#nginx -t

#exec "$@"
