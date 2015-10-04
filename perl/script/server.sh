#!/bin/bash

exec /home/isucon/.local/perl/bin/carton exec start_server -- plackup -s Starlet -p 8080 --workers 4 --disable-keepalive app.psgi
