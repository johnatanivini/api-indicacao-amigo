FROM php:8.0-fpm

RUN apt-get update -y && apt-get install -y --no-install-recommends libpq-dev apt-utils openssl zip unzip git nodejs vim

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

COPY . /app

EXPOSE 8006

