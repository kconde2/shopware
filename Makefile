up:
	docker-compose up -d

down:
	docker-compose down

cache-clear:
	docker-compose exec apache bin/console cache:clear

restart: down up
