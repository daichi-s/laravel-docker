FROM php:8.0-fpm

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

# composer install
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html