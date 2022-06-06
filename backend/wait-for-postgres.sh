#!/bin/bash
# wait-for-postgres.sh
# https://docs.docker.com/compose/startup-order/

set -e

password="$1"
user="$2"
db="$3"

shift 3
cmd="$@"

until PGPASSWORD=$password psql -h "db" -p "5432" -U "$user" -d "$db" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd
