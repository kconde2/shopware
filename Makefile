up:
	make mutagen
	docker-compose up -d --build

down:
	docker-compose down
	mutagen project terminate -f mutagen.yml

ccache:
	docker-compose exec apache bin/console sw:cache:clear

bash:
	docker-compose exec apache bash
ll:
	docker-compose exec apache ls -la
kl:
	docker-compose exec apache ls -la
    docker volume create --name=shopware-sync

restart: down up

.PHONE: mutagen
mutagen:
	docker-compose up -d mutagen
	mutagen project start -f mutagen.yml
