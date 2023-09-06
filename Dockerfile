FROM php:7.1-apache

# Sets the document root director for the webserver to 'html/'
ENV APACHE_DOCUMENT_ROOT=/var/www/html/
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# install dependencies and cleanup (needs to be one step, as else it will cache in the laver)
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends && \
    pecl install xdebug-2.9.8 && \
    docker-php-ext-enable xdebug && \
#    iproute2 libcurl4-openssl-dev libxml2-dev libzip-dev libpng-dev sudo && \
    docker-php-ext-install mysqli && \
#    docker-php-ext-install gd zip && \
#    docker-php-ext-install -j$(nproc) curl json xml mbstring zip bcmath soap && \
#    apt-get clean && \
#    apt-get autoremove -y && \
#    apt-get purge -y --auto-remove libcurl4-openssl-dev libjpeg-dev libxml2-dev libmemcached-dev && \
    rm -rf /var/lib/apt/lists/*

# configure PHP
RUN touch /usr/local/etc/php/conf.d/php.ini && \
    echo "date.timezone = Europe/Berlin" >> /usr/local/etc/php/conf.d/timezone.ini && \
    echo "memory_limit = -1" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "max_execution_time = 0" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "log_errors = On" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "error_log = /dev/null" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "xdebug.remote_enable = on" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "xdebug.remote_handler = dbgp" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "xdebug.remote_host = host.docker.internal" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "xdebug.remote_port = 9000" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "xdebug.remote_mode = req" >> /usr/local/etc/php/conf.d/php.ini && \
    echo "xdebug.idekey="PHPSTORM" >> /usr/local/etc/php/conf.d/php.ini
