FROM php:7.4.1-fpm

RUN apt-get update \
        && apt-get install libicu-dev libpq-dev git unzip zip -y; \
    pecl install xdebug; \
    docker-php-ext-install pdo pdo_mysql pdo_pgsql intl; \
    docker-php-ext-enable xdebug; \
    apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

COPY --from=composer /usr/bin/composer /usr/bin/composer