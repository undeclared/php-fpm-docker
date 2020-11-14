FROM php:7.4-fpm

RUN apt-get update \
        && apt-get install libicu-dev libpq-dev libzip-dev git unzip zip libonig-dev libgmp-dev wget -y; \
    pecl install xdebug; \
    pecl install redis; \
    docker-php-ext-install intl gmp; \
    docker-php-ext-install bcmath ctype json mbstring; \
    docker-php-ext-install openssl tokenizer xml zip; \
    docker-php-ext-install pdo pdo_mysql pdo_pgsql; \
    docker-php-ext-enable xdebug; \
    docker-php-ext-enable redis; \
    docker-php-ext-enable zip; \
    apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;
        
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=node:12.19-alpine /usr/local/bin/node /usr/local/bin/node
COPY --from=node:12.19-alpine /usr/local/bin/npm /usr/local/bin/npm
