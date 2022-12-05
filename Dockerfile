FROM wordpress:php7.3-apache

WORKDIR /var/www/html/

COPY ./.init/Docker/.env .
COPY ./foobar-wordpress-cms .
COPY ./.init/Docker/php/uploads.ini /usr/local/etc/php/conf.d/uploads.ini
COPY ./.init/Docker/wordpress/wp-config.php ./wp-config.php

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && chmod +x /usr/bin/composer 
RUN composer require vlucas/phpdotenv
RUN ls -la