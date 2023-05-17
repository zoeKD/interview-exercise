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
