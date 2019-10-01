init:
	@echo "Lancement de l'instance docker"
	docker run -v $(pwd)/www:/var/www/html/adcog -v $(pwd)/mysql:/var/lib/mysql -p 80:80 -p 3306:3306 --name pfe_container pfe:latest

config: 
	@echo "Configuration... Répondre Yes à tout."
	docker exec -it pfe_container /bin/bash -c "composer install && php app/console doctrine:database:create && php app/console doctrine:schema:update --dump-sql && php app/console doctrine:schema:update --force && php app/console doctrine:fixtures:load && php app/console assets:install --symlink && php app/console assetic:dump"

stop:
	docker stop pfe_container 

start:
	docker start pfe_container

build: 
	@echo "Construction image Docker"
	docker build -t="pfe" .
