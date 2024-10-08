package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

// ConnectDB establishes a connection to the MySQL database
func ConnectDB() {
	// Define MySQL database connection parameters
	dbUser := ""             // MySQL username
	dbPassword := ""         // MySQL password
	dbHost := ""             // MySQL host (localhost)
	dbPort := ""             // MySQL port
	dbName := "adventure_db" // Your database name

	// Data Source Name (DSN): "username:password@tcp(host:port)/dbname"
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s", dbUser, dbPassword, dbHost, dbPort, dbName)

	// Open connection to MySQL
	var err error
	db, err = sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal("Error opening database: ", err)
	}

	// Test the connection
	err = db.Ping()
	if err != nil {
		log.Fatal("Failed to connect to database: ", err)
	}

	fmt.Println("Connected to MySQL database successfully!")
}
