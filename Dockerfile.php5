FROM php:5.6-fpm-alpine

# Configure and install required PHP modules
RUN apk --update add bash libpng-dev libjpeg-turbo-dev libvpx-dev \
	&& docker-php-ext-configure gd \
		--with-gd \
		--with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install \
		mysql \
		mysqli \
		gd \
		curl

ADD https://raw.githubusercontent.com/php/php-src/PHP-5.6/php.ini-production /usr/local/etc/php/php.ini
COPY php-entrypoint.sh /

ENTRYPOINT ["/php-entrypoint.sh"]
