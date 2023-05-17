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

	testDataModel := Table{
		Name: "transactions",
		Fields: map[FieldName]Field{
			"object_id":   {Name: "object_id", DataType: String},
			"updated_at":  {Name: "updated_at", DataType: Timestamp},
			"amount":      {Name: "amount", DataType: Int},
			"account_id":  {Name: "account_id", DataType: String},
			"bic_country": {Name: "bic_country", DataType: String},
			"country":     {Name: "country", DataType: String},
			"description": {Name: "description", DataType: String},
			"direction":   {Name: "direction", DataType: String},
			"status":      {Name: "status", DataType: String},
			"title":       {Name: "title", DataType: String},
		},
	}
	fmt.Printf("Datamodel to use: %+v\n", testDataModel)

	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Get("/", handler)
	http.ListenAndServe(":3000", r)
}
