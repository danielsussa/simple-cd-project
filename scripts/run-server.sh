#!/usr/bin/env bash

cd src/simple-cd
export PATH=/go/src/simple-cd/deploy:$PATH

echo 1-Get Dependencies

if [ ! -d server/vendor ]; then
    echo "..download go dep"
    cd server
    go get github.com/golang/dep/cmd/dep
    dep ensure
    cd ..
fi

echo 2-starting compile daemon
CompileDaemon -command="deploy/server" -directory="server" -build="go build -a -installsuffix cgo -o ../deploy/server ."

exec "$@"