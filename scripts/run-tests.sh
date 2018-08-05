#!/usr/bin/env bash

echo "1-WEB"
echo " a-run unit tests"
cd /web/
npm run unit
echo "2-SERVER"
echo " a-run unit tests"
cd /go/src/simple-cd/server/
go test
exit