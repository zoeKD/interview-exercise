## Objective

The goal of the exercise is to handle incoming http requests containing a json object, and insert them into the database.
The twist is that the database schema is known only at runtime (not statically), because it corresponds to a customer's specific data schema.
The target data schema to use for this exercise is defined in the main function, but feel free to make changes to it or move it.

### Interacting with the db

https://github.com/jackc/pgx

### Handling http requests

https://github.com/go-chi/chi

### Running the local docker db

`docker compose up -d`

### Running the server

`go run .`
