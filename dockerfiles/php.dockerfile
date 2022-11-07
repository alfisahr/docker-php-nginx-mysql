FROM php:7.4-fpm-alpine
 
WORKDIR /var/www/html
 
COPY src .

RUN apk add icu-dev
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-configure intl && docker-php-ext-install intl
 
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

USER laravel 
 
# RUN chown -R laravel:laravel .