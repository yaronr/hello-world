FROM tutum/apache-php:latest
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install sample application
RUN rm -fr /app && git clone https://github.com/fermayo/hello-world-php.git /app

EXPOSE 80
CMD ["/run.sh"]
