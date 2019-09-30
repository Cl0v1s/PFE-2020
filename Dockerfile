FROM lioshi/lamp:latest
RUN echo "127.0.0.1 adcog" >> /etc/hosts
RUN echo "::1 adcog" >> /etc/hosts
RUN apt update 
RUN apt install curl 
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN mkdir /var/www/html/adcog
WORKDIR /var/www/html/adcog
CMD ls 
CMD composer install
CMD php app/console doctrine:database:create
CMD php app/console doctrine:schema:update --dump-sql
CMD php app/console doctrine:schema:update --force
CMD php app/console doctrine:fixtures:load
CMD php app/console assets:install --symlink
CMD php app/console assetic:dump

