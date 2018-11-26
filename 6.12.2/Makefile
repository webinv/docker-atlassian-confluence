# which service (from docker-compose.yml:services) to run commands agains
SERVICE ?=

EXEC_ARGS ?=
RUN_ARGS ?=
DOWN_ARGS ?= --remove-orphans
BUILD_ARGS ?=

include .env
export

COMPOSE_FILE_ARGS ?= -f $(CURDIR)/docker-compose.yml

DOCKER_COMPOSE = docker-compose $(COMPOSE_FILE_ARGS) 

ifeq ($(shell uname -s),Darwin)
XARGS_OPTS =
else
XARGS_OPTS = -r
endif

build:
	$(DOCKER_COMPOSE) build confluence

push: build
	$(DOCKER_COMPOSE) push confluence

up:
	$(DOCKER_COMPOSE) up $(UP_ARGS) ${SERVICE}

logs:
	$(DOCKER_COMPOSE) logs --tail=100 -f

stop:
	$(DOCKER_COMPOSE) stop ${SERVICE}

rm: stop
	$(DOCKER_COMPOSE) rm -f ${SERVICE}

restart:
	$(DOCKER_COMPOSE) restart $(SERVICE)

recreate:
	$(DOCKER_COMPOSE) up -d --force-recreate --build confluence

down:
	$(DOCKER_COMPOSE) down $(DOWN_ARGS)

exec: up
	$(DOCKER_COMPOSE) exec -T $(SERVICE) $(EXEC_ARGS)

bash: up
	$(DOCKER_COMPOSE) exec $(SERVICE) bash

confluence: up
	$(DOCKER_COMPOSE) exec confluence bash

psql: up
	$(DOCKER_COMPOSE) exec $(SERVICE) psql -U confluence

ps:
	$(DOCKER_COMPOSE) ps

.PHONY: %
.DEFAULT: run