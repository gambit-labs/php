#!/bin/bash

PHP_MAX_EXECUTION_TIME=${PHP_MAX_EXECUTION_TIME:-300}
PHP_MAX_UPLOAD_SIZE=${PHP_MAX_UPLOAD_SIZE:-32}
PHP_TIMEZONE=${PHP_TIMEZONE:-"Europe/Helsinki"}

sed "/max_execution_time/d;/upload_max_filesize/d;/post_max_size/d;" -i /usr/local/etc/php/php.ini
cat >> /usr/local/etc/php/php.ini <<EOF

; Options that are coming from the gambitlabs/lemp-base entrypoint script
date.timezone = ${PHP_TIMEZONE}
max_execution_time = ${PHP_MAX_EXECUTION_TIME}
upload_max_filesize = ${PHP_MAX_UPLOAD_SIZE}M
post_max_size = $((PHP_MAX_UPLOAD_SIZE+1))M
EOF

php_usage() {
	cat <<-EOF
	Supported PHP variables and their defaults:
	 - PHP_MAX_EXECUTION_TIME=${PHP_MAX_EXECUTION_TIME}: How many seconds a PHP request may take before it should timeout.
	 - PHP_MAX_UPLOAD_SIZE=${PHP_MAX_UPLOAD_SIZE}: How many megabytes an user is allowed to upload to the server.
	 - PHP_TIMEZONE=${PHP_TIMEZONE}: The timezone that should be set

	PHP version: $(php -v | grep built | awk '{print $2}')
	EOF
}

if [[ -z ${PHP_DO_NOT_EXECUTE} ]]; then
	if [[ $# == 0 ]]; then
		exec php-fpm
	elif [[ $# == 1 && $1 == "help" || $1 == "usage" ]]; then
		php_usage
	else
		exec $@
	fi
fi
