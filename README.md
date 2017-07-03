### A standalone PHP docker image

This is a vanilla `php:fpm-alpine` docker image with some extensions.

#### Features

These extra modules are installed:
 - mysqli
 - gd
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

#### cloud-init

```
#cloud-config
package_update: true
packages:
  - git
  - curl
  - make
  - wget
  - nano
  - software-properties-common
  - apt-transport-https
runcmd:
  - apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  - apt-add-repository -y 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
  - apt-get update -y
  - apt-get install -y docker-engine
  - git clone https://github.com/gambit-labs/php.git /root/php
# after login you'll find the cloud-init logs in /var/log/cloud-init-output.log
```

#### License

MIT
