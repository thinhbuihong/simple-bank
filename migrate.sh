case $1 in 
	"up")
		migrate -path db/migrations -database "postgres://postgres:buihongthinh@localhost:5432/simplebank?sslmode=disable" -verbose up
		;;
	"down")
		migrate -path db/migrations -database "postgres://postgres:buihongthinh@localhost:5432/simplebank?sslmode=disable" -verbose down
		;;
	"create")
		migrate create -ext sql -dir db/migrations -seq $2
		;;
esac