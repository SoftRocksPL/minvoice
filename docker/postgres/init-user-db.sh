#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER minvoice WITH PASSWORD 'password' CREATEDB;
    CREATE DATABASE minvoice_dev;
    GRANT ALL PRIVILEGES ON DATABASE minvoice_dev TO minvoice;
EOSQL
