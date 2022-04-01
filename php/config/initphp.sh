#!/bin/bash

echo "Copy file for PHP and PHP FPM init"
cp /tmp/php-config/php.ini-development  /usr/local/etc/php/php.ini
cp /tmp/php-config/php-custom.ini  /usr/local/etc/php/conf.d/php-custom.ini

cp /tmp/php-config/php-fpm.conf /usr/local/etc/php-fpm.conf
cp /tmp/php-config/www.conf /usr/local/etc/php-fpm.d/www.conf