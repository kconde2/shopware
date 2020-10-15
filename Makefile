init:
	cp .env.example .env

up:
    ifeq ("$(wildcard $('./mutagen.yml.lock'))","")
	make mutagen
    endif
	docker-compose up -d --build

down:
    ifeq ("$(wildcard $('./mutagen.yml.lock'))","")
	mutagen project terminate -f mutagen.yml
    endif
	docker-compose down --remove-orphans


ccache:
	docker-compose exec apache bin/console sw:cache:clear

bash:
	docker-compose exec apache bash
bash:

ll:
	docker-compose exec apache ls -la

restart: down up

.PHONE: mutagen
mutagen:
	docker-compose up -d mutagen
	mutagen project start -f mutagen.yml
