#!/bin/sh

sh -c 'while true; do /app/joplin-bin/bin/joplin --profile /joplin-desktop sync; sleep 60; done' &
sh -c '/app/joplin-bin/bin/joplin --profile /joplin-desktop server start' &
python /app/app.py
