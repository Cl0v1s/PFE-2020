@echo OFF
@echo "Construction image Docker"

@echo "Lancement de l'instance docker"
docker run -d -v %CD%/www:/var/www/html/adcog:cached -v /var/www/html/adcog/.git -p 80:80 -p 3306:3306 --name adcog_container adcog:latest
@echo "Configuration... Répondre Yes à tout."
docker exec -it adcog_container /bin/bash -c "composer install && php app/console doctrine:database:create && php app/console doctrine:schema:update --dump-sql && php app/console doctrine:schema:update --force && php app/console doctrine:fixtures:load && php app/console assets:install --symlink && php app/console assetic:dump"
