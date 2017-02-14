#!/bin/sh
# Apache start script
# sed -i \
#  -e "s/post_max_size\s*=.*/post_max_size = 10M/" \
#  -e "s/upload_max_filesize\s*=.*/upload_max_filesize = 10M/" \
#      /etc/php5/apache2/php.ini

# Change owner
# exec usermod -u 1000 www-data
# exec usermod -G staff www-data

# exec chown -R www-data:staff /var/www/html/storage
# exec chmod -R 777 /var/www/html/storage

#/etc/init.d/apache2 reload