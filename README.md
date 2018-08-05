# Objective

This is a simple server client project that can be started by one click. The backend was developed using Golang, and the frontend VueJs. You dont need to setup and install anyone of this environment to run project, just run **make build_dev** to build step and **make run_server** and **make run_web** to start docker on dev mode.

Both front and backend are reactive throw changes in code, throw the docker build. There is one simple docker file to control this changes, that make it possible to develop and check result in real time

### Just need to install:
- Make
- Docker

Commands to run:
make install_dev: this command build the develop docker images
make run_dev: this commands run the develop docker images.

### This project is production ready, using travisCI to compile and build a new release of package. The production docker file uses a simple alpine OS and get