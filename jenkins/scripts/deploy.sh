#!/usr/bin/env sh

set -x
docker run -d -p 3000:3000 --name my-apache-php-app -v /home/src:/var/www php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://localhost:3000 to see your PHP application in action.'
