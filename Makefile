.PHONY: help build up down test lint clean deploy

help:
	@echo "DeepEyeCode - Available Commands"
	@echo "  make build    - Build all Docker images"
	@echo "  make up       - Start all services"
	@echo "  make down     - Stop all services"
	@echo "  make test     - Run all tests"
	@echo "  make lint     - Lint all code"
	@echo "  make deploy   - Deploy to production"
	@echo "  make logs     - Tail logs"

build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

test:
	cd backend && pytest tests/ -v
	cd frontend && npm test

lint:
	ruff check backend/
	cd frontend && npm run lint

clean:
	docker compose down -v --rmi all

logs:
	docker compose logs -f

deploy:
	bash scripts/deploy.sh