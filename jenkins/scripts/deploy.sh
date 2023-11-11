#!/usr/bin/env sh

set -x
docker run -d -p 80:80 --name my-apache-php-app -v \home\\3103Lab\\PHP-Selenium-Tests-main\\src:/var/www/html php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://192.168.1.19 to see your PHP application in action.'

