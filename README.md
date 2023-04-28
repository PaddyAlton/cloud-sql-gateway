cloud-sql-gateway
=================

A utility for connecting to PostgreSQL databases hosted in GCP Cloud SQL from an external machine.

It works by creating docker containers:

- a cloud SQL proxy (or proxies - the docker-compose.yml file is readily extensible)
- a custom 'gateway' container that idles until 

Prerequisites
-------------

- you should [install Task](https://taskfile.dev/installation/)
- you should [install Docker](https://docs.docker.com/engine/install/)

Setup
-----

- run `task setup` to prepare some dummy credentials and build/download the images
- replace the contents of `.env` with an appropriate username and password
- replace the contents of `config/credentials.json` with an appropriate set of service account credentials

Usage
-----

Run `task start -- <schemaname>`. Here `schemaname` is the name of the target schema/database within the Cloud SQL instance.

This will

- start the SQL proxy container(s) and gateway container (defined in `docker-compose.yml`)
- execute the script to open the gateway via the gateway container
- launch a `psql` terminal connected to the appropriate database schema

### Alternative

Run `task prox` to start the containers without executing the opening script. The proxy (or proxies) defined in `docker-compose.yml` will be available via port forwarding on localhost (you should check the compose file for the port number).

This is useful if you wish to connect to the database(s) via the proxy, but through other means than the `psql` terminal.

Cleanup
-------

Run `task stop` or `docker compose down` to shut down all the proxy and gateway containers.
