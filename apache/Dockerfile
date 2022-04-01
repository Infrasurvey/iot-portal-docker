FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update &&\
    apt-get install -y apache2 &&\
    apt-get install -y vim && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y git && \
    apt-get install -y bash && \
    apt-get install -y curl && \
    apt-get install -y net-tools &&\
    apt-get install -y iputils-ping

RUN a2enmod proxy_fcgi &&\
    a2enmod ssl &&\
    a2enmod rewrite &&\
    a2dissite 000-default

COPY .bashrc /root/.bashrc
COPY .gitconfig /root/.gitconfig

# WORKDIR /var/www/html
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80