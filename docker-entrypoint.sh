#!/bin/bash

set -e

if [ "$1" = "plex" ]; then
    chown -R plex.plex /plex
    exec start-stop-daemon --start -c plex --exec /usr/local/bin/plex
else
    exec "$@"
fi
