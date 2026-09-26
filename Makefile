.PHONY: up-dev down-dev up-prod down-prod net

net:
	@docker network inspect fullstackapp_shared >/dev/null 2>&1 || \
		docker network create fullstackapp_shared

up-dev: net
	cd backend && docker compose -f docker-compose.dev.yaml up -d --build
	sleep 3
	cd frontend && docker compose -f docker-compose.dev.yaml up -d --build

down-dev:
	-cd frontend && docker compose -f docker-compose.dev.yaml down
	-cd backend && docker compose -f docker-compose.dev.yaml down

up-prod: net
	cd backend && docker compose up -d --build
	sleep 3
	cd frontend && docker compose up -d --build

down-prod:
	-cd frontend && docker compose down
	-cd backend && docker compose down

logs-be:
	cd backend && docker compose -f docker-compose.dev.yaml logs -f backend

logs-fe:
	cd frontend && docker compose -f docker-compose.dev.yaml logs -f frontend