FROM ubuntu:quantal
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install packages
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor git apache2 libapache2-mod-php5
RUN git clone https://github.com/fermayo/hello-world-php.git /app

# Add image configuration and scripts
ADD https://raw.github.com/tutumcloud/docker-hello-world/master/start.sh /start.sh
ADD https://raw.github.com/tutumcloud/docker-hello-world/master/run.sh /run.sh
RUN chmod 755 /start.sh && chmod 755 /run.sh
ADD https://raw.github.com/tutumcloud/docker-hello-world/master/supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf

# Configure /app folder
RUN mkdir -p /app && rm -fr /var/www && ln -s /app /var/www

EXPOSE 80
CMD ["/run.sh"]
