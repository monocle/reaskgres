PROJ_NAME := reaskgres
BACKEND := backend
FRONTEND := frontend

up:
	docker compose up -d

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
	docker exec -it $(PROJ_NAME)-$(BACKEND)-1 /bin/sh

frontend_logs:
	docker compose logs -f $(FRONTEND)

