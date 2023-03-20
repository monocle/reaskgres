PROJ_NAME := reaskgres
BACKEND := backend
FRONTEND := frontend
DATABASE := database
POSTGRES_USER := postgres

up:
	docker compose up -d
	@$(MAKE) db_create

down:
	docker compose down

backend_build:
	docker compose stop $(BACKEND)
	docker compose rm $(BACKEND)
	docker rmi $(PROJ_NAME)-$(BACKEND)
	docker compose up -d $(BACKEND)

backend_logs:
	docker compose logs -f $(BACKEND)

backend_restart:
	docker compose stop $(BACKEND)
	docker compose up -d $(BACKEND)

backend_shell:
	docker exec -it $(PROJ_NAME)-$(BACKEND)-1 /bin/bash

db_create:
	docker exec $(PROJ_NAME)-$(BACKEND)-1 python scripts/db_create.py

db_drop:
	docker exec $(PROJ_NAME)-$(BACKEND)-1 python scripts/db_drop.py

db_shell:
	docker exec -it $(PROJ_NAME)-$(DATABASE)-1 psql -U $(POSTGRES_USER)

frontend_logs:
	docker compose logs -f $(FRONTEND)

list:
	@echo
	@echo "Available targets:"
	@make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$$)/ && !/^\./ && !/%$$/ {split($$1,A,/ /); for(i in A) if (A[i] != "Makefile") print A[i]}' | sort | uniq
	@echo
