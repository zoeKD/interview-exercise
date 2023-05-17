# Objective

You should spend 3h in total. Please send you code and notes 3h after starting the exercise.
We will debrief for about 1h, in the days following the exercise session.

## Part one (code)

The goal of the exercise is to handle incoming http requests containing a json object, and insert them into the database.
The twist is that the database schema is known only at runtime (not statically), because it corresponds to a customer's specific data schema.
The target data schema to use for this exercise is defined in the main function, but feel free to make changes to it or move it.

We want to have some level of input validation: type (int, float, string, bool, timestamp), format, enums, required/nullable at least. Do you have other ideas ?

- Stretch/optional: keep a history of object versions. How would you handle it ?

## Part two (Brainstorming/no code)

Now, we want to build a simple tool that runs SQL queries against the customer's database, using a no-code SQL builder. We need the output to be strongly typed.
How would you handle this ?

- ! Disclaimer: Feature not yet released, think of it as a brainstorming/discussion that you could have in one of your first weeks at Marble. This is not supposed to be a simple question nor a « trick » exercise.
- What SQL features/functions should we allow at first ?
- How to represent/parse a query to keep typing ?
- Please share your thoughts, ideas as best as you can, without focusing too much on the form. We'll debrief this together after the exercise.

# Indications

### Interacting with the db

https://github.com/jackc/pgx

### Handling http requests

https://github.com/go-chi/chi

### Running the local docker db

`docker compose up -d`

### Running the server

`go run .`
