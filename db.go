package main

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v5"
)

const (
	dbName     = "postgres"
	dbPort     = "5432"
	dbPassword = "pwd"
	dbUser     = "postgres"
	dbHost     = "localhost"
)

func getConnectionString(db, port, password, user, host string) string {
	connectionString := fmt.Sprintf("host=%s user=%s password=%s database=%s port=%s sslmode=disable", host, user, password, db, port)
	return connectionString
}

func getDbConn() (*pgx.Conn, error) {
	connectionString := getConnectionString(dbName, dbPort, dbPassword, dbUser, dbHost)
	conn, err := pgx.Connect(context.Background(), connectionString)
	if err != nil {
		return nil, err
	}
	return conn, nil
}

func setupDbSchema(conn *pgx.Conn) error {
	sqlCreateSchema := `
	CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

	CREATE TABLE IF NOT EXISTS transactions(
		id uuid DEFAULT uuid_generate_v4(),
		object_id VARCHAR NOT NULL,
		updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
		isLiveVersion BOOLEAN DEFAULT FALSE,
		amount integer,
		account_id VARCHAR,
		bic_country VARCHAR,
		country VARCHAR,
		description VARCHAR,
		direction VARCHAR,
		status VARCHAR,
		title VARCHAR,
		PRIMARY KEY(id)
	  );
	`
	_, err := conn.Exec(context.Background(), sqlCreateSchema)
	if err != nil {
		return err
	}
	fmt.Println("Database schema created")
	return nil
}
