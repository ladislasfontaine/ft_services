#!/bin/bash

tar -xf /tmp/latest.tar.gz.1 -C /usr/share/webapps/
rm /tmp/latest.tar.gz.1

rm -f /usr/share/webapps/wordpress/wp-config.php
cp /tmp/wp-config.php /usr/share/webapps/wordpress/

php -S 0.0.0.0:5050 -t /usr/share/webapps/wordpress/