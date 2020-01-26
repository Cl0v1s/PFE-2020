@echo OFF
@echo "Construction image Docker"
docker build -t="adcog" .
@echo "Lancement de l'instance docker"
docker run -d -v %CD%/www:/var/www/html/adcog:cached -v %CD%/mysql:/home/root/mysql:cached -p 80:80 -p 3306:3306 --name adcog_test_container adcog:latest
@echo "Configuration... Répondre Yes à tout."
docker exec -it adcog_test_container /bin/bash -c "composer install && php app/console doctrine:database:create && php app/console doctrine:schema:update --dump-sql && php app/console doctrine:schema:update --force && php app/console doctrine:fixtures:load && php app/console assets:install --symlink && php app/console assetic:dump"
@echo "Exécution du script SQL contenant les données de test"
docker exec -it adcog_test_container /bin/bash -c "mysql -uadmin -padmin adcog < /home/root/mysql/test_data.sql"