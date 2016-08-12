### A standalone PHP docker image

This is a vanilla `php:fpm-alpine` docker image with some extensions.

#### Features

These extra modules are installed:
 - mysqli
 - gd
 - tidy
 - curl

Includes the production `php.ini` settings from https://github.com/php/php-src, and some environment variables that may be used for customization
```console
$ docker run -it gambitlabs/php help
Supported PHP variables and their defaults:
 - PHP_MAX_EXECUTION_TIME=300: How many seconds a PHP request may take before it should timeout.
 - PHP_MAX_UPLOAD_SIZE=32: How many megabytes an user is allowed to upload to the server.
 - PHP_TIMEZONE=Europe/Helsinki: The timezone that should be set

PHP version: 7.0.9
```

#### License

MIT
