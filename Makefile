target:;

run:
	docker build -f Dockerfile-dev -t simple-cd-project-server:latest .
	docker run -it -p 8080:8080 -v $$(pwd)/deploy:/go/src/simple-cd/deploy -v $$(pwd)/server:/go/src/simple-cd/server -v $$(pwd)/scripts:/scripts simple-cd-project-server:latest run-server.sh


run_web:
	docker build -f Dockerfile-web-dev -t simple-cd-project-server:latest .
	docker run -it -v $$(pwd)/deploy:/deploy -v $$(pwd)/web:/web -v $$(pwd)/scripts:/scripts simple-cd-project-web:latest bash


build:
	mkdir deploy


	cd web && npm install && npm run build
	cd server && go get && go build -o server .
	cp server/server deploy/server && cp -R web/dist deploy/dist