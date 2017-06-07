FROM php:5.6-fpm-alpine

RUN apk --update add bash libpng-dev libjpeg libvpx-dev curl-dev libmcrypt-dev

# Install required PHP modules
RUN docker-php-ext-install \
	mysql \
	mysqli \
	gd \
	curl \
	mcrypt

ADD https://raw.githubusercontent.com/php/php-src/PHP-5.6/php.ini-production /usr/local/etc/php/php.ini
COPY php-entrypoint.sh /

ENTRYPOINT ["/php-entrypoint.sh"]
