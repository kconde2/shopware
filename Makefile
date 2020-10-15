init:
	cp .env.example .env

MutagenLock = ./mutagen.yml.lock

start-mutagen:
	docker-compose up -d mutagen
	mutagen project start -f mutagen.yml
stop-mutagen:
	mutagen project terminate -f mutagen.yml

up:
ifeq ($(wildcard $(MutagenLock)),)
	# $(MutagenLock) File doesn't exist
	make start-mutagen
endif
	docker-compose up -d --build

down:
ifneq ($(wildcard $(MutagenLock)),)
	# $(MutagenLock) File exist
	make stop-mutagen
endif
	docker-compose down --remove-orphans

restart: down up

ccache:
	docker-compose exec apache bin/console sw:cache:clear

bash:
	docker-compose exec apache bash
bash:

ll:
	docker-compose exec apache ls -la
