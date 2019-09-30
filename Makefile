run:
	@echo "Lancement de l'instance docker"
	docker run -v $(pwd)/www:/var/www/html/adcog -v $(pwd)/mysql:/var/lib/mysql -p 80:80 -p 3306:3306 pfe:latest

build: 
	@echo "Construction image Docker"
	docker build -t="pfe" .
