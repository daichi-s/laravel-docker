FROM php:8.2-fpm

# Install PHP Extensions
RUN apt-get update && apt-get install -y \
        libzip-dev \
        libicu-dev \
        unzip \
        nodejs \
        npm \
    && docker-php-ext-install \
        pdo_mysql \
        zip \
        intl \
        opcache \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# nodejsインストール(バージョン指定)
RUN npm install n -g && \
    n 18.16.0

# yarnインストール
RUN corepack enable && \
    corepack enable yarn

# Composerインストール
COPY --from=composer/composer:2.2-bin /composer /usr/bin/composer

WORKDIR /var/www/html