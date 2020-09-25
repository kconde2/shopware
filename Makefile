up:
	docker-compose up -d --build

down:
	docker-compose down

ccache:
	docker-compose exec apache bin/console sw:cache:clear

restart: down up
