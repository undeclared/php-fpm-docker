FROM php:8-fpm

RUN apt-get update; \
    apt-get install libpq-dev libicu-dev libzip-dev git unzip zip libonig-dev libgmp-dev wget -y; \
    pecl install xdebug; \
    pecl install redis; \
    docker-php-ext-install intl gmp zip; \
    docker-php-ext-install bcmath ctype json; \
    docker-php-ext-install openssl tokenizer xml pdo_pgsql; \
    docker-php-ext-install pdo pdo_pgsql; \
    docker-php-ext-enable xdebug; \
    docker-php-ext-enable redis; \
    docker-php-ext-enable zip; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;
        
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=node:lts /usr/local/bin/node /usr/local/bin/node
COPY --from=node:lts /usr/local/bin/npm /usr/local/bin/npm
