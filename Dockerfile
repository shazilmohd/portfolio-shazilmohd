FROM ubuntu:latest
RUN apt-get update && apt-get -y install apache2
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN mkdir -p /code
WORKDIR code
COPY . code
COPY 000-default.conf /etc/apache2/sites-available/
RUN chown -R www-data:www-data /code/code
RUN chmod -R 750 /code/code
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl","-DFOREGROUND"]

