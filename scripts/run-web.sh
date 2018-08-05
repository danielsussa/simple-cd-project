#!/usr/bin/env bash

cd /web

if [ ! -d node_modules ]; then
    echo ".npm install"
    npm install
fi

npm run watch

exec "$@"