#!/bin/bash

case $1 in 
	"migrate:up")
		migrate -path db/migrations -database "postgres://postgres:buihongthinh@localhost:5432/simplebank?sslmode=disable" -verbose up ${@:2}
		;;
	"migrate:down")
		migrate -path db/migrations -database "postgres://postgres:buihongthinh@localhost:5432/simplebank?sslmode=disable" -verbose down ${@:2}
		;;
	"migrate:create")
		migrate create -ext sql -dir db/migrations -seq ${@:2}
		;;
	"mockdb")
		mockgen -package mockdb -destination db/mockdb/store.go --build_flags=--mod=mod github.com/thinhbuihong/simplebank/db/sqlc Store
		;;
	"sqlc")
		sqlc generate
		;;
	"test")
		go test -v -cover ./...
		;;
esac

