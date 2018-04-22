#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
	CREATE USER admin WITH PASSWORD 'admin';
	ALTER USER admin CREATEDB;
	ALTER ROLE admin SET client_encoding TO 'utf8';
	ALTER ROLE admin SET timezone TO 'Australia/Brisbane';
	CREATE DATABASE react_login;
	GRANT ALL PRIVILEGES ON DATABASE react_login TO admin;
EOSQL
