FROM php:apache
MAINTAINER Egg Digital (Dev2)

RUN apt-get update && \
    apt-get install -y \
        wget \
        unzip \
        git \
        libssl-dev

RUN pecl install mongodb && \
	pecl install xdebug-beta && \
	docker-php-ext-enable xdebug



RUN echo "extension=mongodb.so" > $PHP_INI_DIR/conf.d/mongodb.ini


# Install composer
ENV COMPOSER_VERSION 1.2.4
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}


# Enable Apache2 modules
RUN a2enmod rewrite

# Install PHP extensions deps
RUN docker-php-ext-install zip && \
	docker-php-ext-install mbstring

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        zlib1g-dev \
        libicu-dev \
        g++ \
        unixodbc-dev \
        libxml2-dev \
        libaio-dev \
        libmemcached-dev \
        freetds-dev


RUN mkdir -m 777 /log-dev-docker.dev

WORKDIR /var/www/html

ADD sites-enabled/vhost.conf /etc/apache2/sites-enabled/