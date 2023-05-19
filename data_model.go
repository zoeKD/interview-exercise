package main

type (
	TableName string
	FieldName string
	DataType  int
)

const (
	Bool DataType = iota
	Int
	Float
	String
	Timestamp
)

type Table struct {
	Name   TableName
	Fields map[FieldName]Field
}

type Field struct {
	Name     FieldName
	DataType DataType
}

func getDataModel() Table {
	// In practice, this would be retrieved dynamically from a database
	return Table{
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
}
