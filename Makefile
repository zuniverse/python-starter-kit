# Prevent file associations
.PHONY: start stop exec-backend exec-postgres fetch-dev-all fetch-live-all test

# What runs if make has no args
# .DEFAULT_GOAL := test

###### Manage Docker containers ######

start:
	docker-compose up

stop:
	docker-compose down

exec-backend:
	docker exec -it backend bash

exec-postgres:
	docker exec -it postgres bash

###### App entry points ######

fetch-dev-all:
	./src/entrypoint.sh fetch fromfile all

fetch-live-all:
	./src/entrypoint.sh fetch fetchurl all

test:
	python -m tests.test
