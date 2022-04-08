FROM php:8.1-fpm

# Install PHP extensions
RUN apt-get update && apt-get install -y \
        libzip-dev \
        libicu-dev \
    && docker-php-ext-install \
        pdo_mysql \
        zip \
        intl \
        opcache \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

WORKDIR /var/www/html