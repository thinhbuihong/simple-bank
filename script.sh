#!/bin/bash

case $1 in 
	"migrate:up")
		migrate -path db/migrations -database "postgres://postgres:buihongthinh@localhost:5432/simplebank?sslmode=disable" -verbose up
		;;
	"migrate:down")
		migrate -path db/migrations -database "postgres://postgres:buihongthinh@localhost:5432/simplebank?sslmode=disable" -verbose down
		;;
	"migrate:create")
		migrate create -ext sql -dir db/migrations -seq $2
		;;
	"mockdb")
		mockgen -package mockdb -destination db/mock/store.go --build_flags=--mod=mod github.com/thinhbuihong/simplebank/db/sqlc Store
		;;
	"test")
		go test -v -cover ./...
		;;
esac

