include .env
DB_URL="postgresql://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@$(POSTGRES_HOST):$(POSTGRES_PORT)/$(POSTGRES_DATABASE)?sslmode=disable"

swag-init:
	swag init -g api/server.go -o api/docs

start:
	go run cmd/main.go

migrateup:
	migrate -path migrations -database "$(DB_URL)" -verbose up
migratedown:
	migrate -path migrations -database "$(DB_URL)" -verbose down
