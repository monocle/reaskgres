# Reaskgres - A React + Flask + Postgres Starter Kit
_Work In Progress_

## Purpose

To provide a Dockerized starting point for a new React+Flask project with a Postgres database.

## Frontend

The following frontend setup will be used via Vite tooling:

* TypeScript
* React

## Backend

The following backend setup will be used:

* Flask, Flask SQLAlchemy, Flask Migrate
* mypy
* Pytest, Pytest-cov
* Black, isort

## Getting Started

1. Clone the repo.
1. Make sure Docker Desktop is running.
1. Run `make up` from the project root directory. This will start the:
    * Vite dev server at `http://localhost:5173/`
    * Flask dev server at `http://localhost:5002/`
    * In addition, it will ensure "development" and "test" databases are in Postgres.
1. Begin hacking.
