
config: 
	@echo "Configuration... Répondre Yes à tout."
	docker exec -it pfe_container /bin/bash -c "composer install && php app/console doctrine:database:create && php app/console doctrine:schema:update --dump-sql && php app/console doctrine:schema:update --force && php app/console doctrine:fixtures:load && php app/console assets:install --symlink && php app/console assetic:dump"

start:
	docker-sync start
	# wait until the command finishes creating the volume, then:
	docker-compose -f docker-compose.yml up -d
	docker exec -it adcog_www chown -R xfs app_sync

stop:

	docker-sync stop
	docker stop pfe_container


w-init:
	@echo "Lancement de l'instance docker"
	docker run -v $(pwd)/www:/var/www/html/adcog -p 80:80 -p 3306:3306 --name pfe_container pfe:latest

w-config: 
	@echo "Configuration... Répondre Yes à tout."
	docker exec -it pfe_container /bin/bash -c "composer install && php app/console doctrine:database:create && php app/console doctrine:schema:update --dump-sql && php app/console doctrine:schema:update --force && php app/console doctrine:fixtures:load && php app/console assets:install --symlink && php app/console assetic:dump"

w-stop:
	docker stop pfe_container 

w-start:
	docker start pfe_container

w-build: 
	@echo "Construction image Docker"
	docker build -t="pfe" .

log:
	docker exec -it pfe_container cat /var/log/apache2/error.log
