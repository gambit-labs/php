FROM php:7.0-fpm-alpine

RUN apk --update add bash

# Install required PHP modules
RUN docker-php-ext-install \
	mysqli \
	gd \
	tidy \
	curl

ADD https://raw.githubusercontent.com/php/php-src/PHP-7.0/php.ini-production /usr/local/etc/php/php.ini
COPY php-entrypoint.sh /

ENTRYPOINT ["/php-entrypoint.sh"]
