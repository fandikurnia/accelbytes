FROM eboraas/apache
RUN apt-get update
RUN apt-get -y install vim curl
RUN a2enmod proxy
COPY ./000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY ./env.load /etc/apache2/mods-enabled/env.load

