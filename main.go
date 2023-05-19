package main

import (
	"context"
	"fmt"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func handler(w http.ResponseWriter, r *http.Request) {
	// to implement
	w.Write([]byte("Hello World!"))
}

func main() {
	conn, err := getDbConn()
	if err != nil {
		panic(err)
	}
	defer conn.Close(context.Background())
	err = setupDbSchema(conn)

	testDataModel := getDataModel()
	fmt.Printf("Datamodel to use: %+v\n", testDataModel)

	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Get("/", handler)
	http.ListenAndServe(":3000", r)
}
