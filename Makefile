target:;



run_server:
	docker build -f Dockerfile-dev -t simple-cd-project-server:latest .
	docker run -it -p 8080:8080 -v $$(pwd)/deploy:/go/src/simple-cd/deploy -v $$(pwd)/server:/go/src/simple-cd/server -v $$(pwd)/scripts:/scripts simple-cd-project-server:latest run-server.sh


run_web:
	docker build -f Dockerfile-dev -t simple-cd-project-web:latest .
	docker run -it -v $$(pwd)/deploy:/deploy -v $$(pwd)/web:/web -v $$(pwd)/scripts:/scripts simple-cd-project-web:latest run-web.sh

run:
	docker run -d -p 8080:8080 -v $$(pwd)/deploy:/go/src/simple-cd/deploy -v $$(pwd)/server:/go/src/simple-cd/server -v $$(pwd)/scripts:/scripts simple-cd-project-server:latest run-server.sh
	docker run -d -v $$(pwd)/deploy:/deploy -v $$(pwd)/web:/web -v $$(pwd)/scripts:/scripts simple-cd-project-web:latest run-web.sh
	$$(while ! httping -qc1 http://myhost:myport ; do sleep 1 ; done)
	


build:
	cd web && npm install && npm run build
	cd server && go get && go build -o server .
	cp server/server deploy/server && cp -R web/dist deploy/dist