#! /bin/bash

# intended use: ./open.sh proxyname schemaname
# with proxyname in docker-compose.yml (e.g. proxyname=cloud-sql-proxy-a),
# schemaname the schema/database name being targeted inside the Cloud SQL instance
# and environment variables $USER_NAME, $PASSWORD used for access control

proxy_name=$1
schema_name=$2

connection_string=postgresql://$USER_NAME:$PASSWORD@$proxy_name:5432/$schema_name

psql -d $connection_string --pset expanded=auto
