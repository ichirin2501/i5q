#!/bin/bash

exec /home/isucon/.local/perl/bin/carton exec start_server --port 8080 -- \
    plackup -s Starlet --workers 4 --max-reqs-per-child 10000 --disable-keepalive app.psgi
