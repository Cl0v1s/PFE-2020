run:
	@echo "Lancement de l'instance docker"
	docker run -v ./www:/var/www/html -v ./mysql:/var/lib/mysql -p 80:80 -p 3306:3306 lioshi/lamp:latest
