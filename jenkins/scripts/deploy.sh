#!/usr/bin/env sh

set -x
docker run -d -p 80:80 --name my-apache-php-app -v C:\\Users\\mikha\\Desktop\\PHP\\PHP-Selenium-Tests\\src:/var php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://192.168.1.19 to see your PHP application in action.'

