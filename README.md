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
1. Run `make init` from the project root directory. This will do the following:
    1. Ask you for a new project name and then add that name to various files.
    1. Set up a `.env` file for some environment variables.
    1. Create all of the Docker images and containers
    1. Start the containers:
        * Frontend - Vite server at `http://localhost:5173/`
        * Backend - Flask server at `http://localhost:5002/`
        * Database - Postgres server at `http://localhost:5432/`
    1. Create `development` and `test` databases.
1. Delete the existing `.git` project repo.
1. Run `git init`.

After that, you can start working on your app code.

## Convenience Make Tasks

Check out the project's [Makefile](Makefile) to what tasks are available. For example,

* `make backed_shell` will give you access to the backend Docker shell.
* `make backend_test` will start a file watcher for your backend files and run `pytest` when a test file (or corresponding source file) has changed.
    * Note: For VSCode, your VSCode window should be attached to the backend container for file changes to be detected.
