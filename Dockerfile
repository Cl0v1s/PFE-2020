FROM lioshi/lamp:latest
RUN echo "127.0.0.1 adcog" >> /etc/hosts
RUN echo "::1 adcog" >> /etc/hosts
RUN apt update 
RUN apt install curl 
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN cd /var/www/html
RUN composer install
RUN php app/console doctrine:database:create
RUN php app/console doctrine:schema:update --dump-sql
RUN php app/console doctrine:schema:update --force
RUN php app/console doctrine:fixtures:load
RUN php app/console assets:install --symlink
RUN php app/console assetic:dump

