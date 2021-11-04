FROM webdevops/php-apache:5.6

# Arguments and environmental variables
ARG PASSWORD=${PASSWORD}
ARG VOLUME=${VOLUME}

# Run
RUN \
wget -O /root/master.zip https://github.com/hasol81/comix-server/archive/master.zip -q && \
unzip -qq /root/master.zip -d /root && \
mkdir -p /var/www/comix-server && \
cp -a /root/comix-server-master/*.php /var/www/comix-server/ && \
cp -a /root/comix-server-master/conf/httpd.conf-comix /etc/apache2/sites-enabled/aircomix_vhost.conf && \
cp -a /root/comix-server-master/conf/htaccess /var/www/comix-server/.htaccess && \
rm -rf /root/comix-server-master && \
htpasswd -cb /var/www/comix-server/.htpasswd AirComix "${PASSWORD}" && \
chown www-data:www-data /var/www/comix-server/.ht*

# Volume
VOLUME ${VOLUME}

# Expose
EXPOSE 31257