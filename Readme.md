# Objective

You should spend 3h in total. Please send your code and notes 3h after starting the exercise.
We will debrief for about 1h, in the days following the exercise session.

## Part one

The goal of the exercise is to handle incoming http requests containing a json object, and insert them into the database.
The twist is that the database schema is known only at runtime (not statically), because it corresponds to a customer's specific data schema.
The target data schema to use for this exercise is defined in the main function, but feel free to make changes to it or move it.

We want to have some level of input validation: type (int, float, string, bool, timestamp), format, enums, required/nullable at least. Do you have other ideas ?

We also want to keep a history of all versions of the object. Your code should insert the new object only if its 'updatedAt' value is greater than the previous, and keep the 'isLiverVersion' field up to date for all entries.

## Part two

Please design an API that allows you to create and evaluate a mathematcal formula (on floats), using a tree. The tree's leaves should be constant numbers, and the tree's nodes should be mathematical operators.
Please implement at least 3 different operators, including a binary (e.g. division) and an n-ary operator (e.g. sum).
The tree should be created and evaluated separately.

Stretch goal: make the tree serializable in json format.

# Indications

### Interacting with the db

https://github.com/jackc/pgx

### Handling http requests

https://github.com/go-chi/chi

### Running the local docker db

`docker compose up -d`

### Running the server

`go run .`
