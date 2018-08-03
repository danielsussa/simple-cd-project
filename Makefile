target:;

run:
	docker build -f Dockerfile-dev -t simple-cd-project:latest .
	docker run -p 8080:8080 simple-cd-project:latest

build:
	mkdir deploy

	cd web && npm install && npm run build
	cd server && go get && go build -o server .
	cp server/server deploy/server && cp -R web/dist deploy/dist