FROM php:8.0-fpm-alpine

COPY ./php.ini /usr/local/etc/php/conf.d/docker-php-config.ini

RUN apk --update --no-cache add git

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install sysvsem

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# TODO: Here we could add run some extra comands like running db migrations
CMD composer install ;  php-fpm 

EXPOSE 9000

