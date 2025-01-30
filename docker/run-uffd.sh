#!/bin/bash
set -e

mkdir -p /data/db
chown uffd:uffd /data/db

exec /usr/bin/uwsgi --no-orphans --ini /etc/uwsgi/apps-enabled/uffd.ini --socket 0.0.0.0:9090
