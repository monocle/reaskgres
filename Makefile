FRONTEND := frontend

up:
	docker compose up -d

down:
	docker compose down

frontend_logs:
	docker compose logs -f $(FRONTEND)
