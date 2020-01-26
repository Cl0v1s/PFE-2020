FROM lioshi/lamp:php5
RUN echo "127.0.0.1 adcog" >> /etc/hosts
RUN echo "::1 adcog" >> /etc/hosts
RUN apt update 
RUN apt install -y curl 
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN mkdir /var/www/html/adcog
RUN usermod -u 1000 www-data
WORKDIR /var/www/html/adcog
RUN pwd
RUN chmod -R 777 .


