init: docker-down docker-pull docker-build docker-up
up: docker-up
down: docker-down
restart: down up
ps: docker-ps

docker-ps:
	docker ps

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans

docker-down-clear:
	docker-compose down -v --remove-orphans

docker-pull:
	docker-compose pull

docker-build:
	docker-compose build --pull
