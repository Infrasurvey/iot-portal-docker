FROM php:7.4-fpm

LABEL Maulaz Tony

RUN apt-get update &&\
    apt-get install -y apt-utils unzip git iproute2 vim &&\
    apt-get install -y git iproute2 vim curl tmux nmap net-tools rsync &&\
    apt-get install -y nodejs npm &&\
    apt-get install -y libjpeg-dev libsasl2-dev libldap2-dev libssl-dev libpng-dev &&\
    apt-get install -y libgmp-dev re2c libmhash-dev libmcrypt-dev file &&\
    apt-get install -y libmcrypt-dev libpng-dev zlib1g-dev libxml2-dev libzip-dev  libonig-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev

# La config de xdebug est automatiquement ajoutée dans fpm et cli
# COPY xdebug.ini /etc/php/7.0/mods-available/xdebug.ini

# Installation de composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

RUN docker-php-ext-install mysqli

RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/ &&\
    docker-php-ext-configure gmp &&\
    docker-php-ext-install gmp

RUN apt-get install libldap2-dev -y &&\
    rm -rf /var/lib/apt/lists/* &&\
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ &&\
    docker-php-ext-install ldap

# Use with php 7.4
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd

# Use with php 7.2
# RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/ &&\
#    apt-get update && docker-php-ext-install gd

RUN docker-php-ext-install mbstring zip &&\
    docker-php-ext-install pdo_mysql

WORKDIR /srv/www/

RUN npm install -g webpack webpack-cli npm-check-updates

COPY .bashrc /root/.bashrc
COPY .gitconfig /root/.gitconfig

EXPOSE 9000


#CMD /tmp/php-config/initphp.sh
ENTRYPOINT ["/bin/sh", "-c", "/tmp/php-config/initphp.sh && php-fpm"]
